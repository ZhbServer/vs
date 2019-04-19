package com.vshow.control.item.jh;


import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.DownLoad;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.JhItem;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendDate;
import com.vshow.control.data.SendTime;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolDp;
import com.vshow.control.protocol.ProtocolDpB;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.protocol.ProtocolUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class FbDpJhItemAction implements Action {

	
	
	private String clientids;  //终端id多个以"_"分割
	private String cgids;      //终端分组id多个以"_"分割
	private int jhid;

	
	


	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		Local local= (Local) session.get("local");
		HashSet<Integer> tmidsset = new HashSet();
	
		/**获取所有终端**/
		if (cgids != null && !"".equals(cgids)) {
			
			String[] cgids_s = cgids.split("\\_");
			ClientGroupRelation cgr;
			/** 获取用户下的所有终端**/
			for (int i = 0; i < cgids_s.length; i++) {
				
				cgr=new ClientGroupRelation();
				cgr.setUid(uid);
				cgr.setGid(Integer.parseInt(cgids_s[i].trim().split("\\,")[0]));
				cgr.setGtype(Integer.parseInt(cgids_s[i].trim().split("\\,")[1]));
				List terms = sm.queryForList("sel_cgr_gid_uid_by_gtype",cgr);
				for (int j = 0; j < terms.size(); j++) {
				
					tmidsset.add(Integer.parseInt(terms.get(j)+""));
				}
			}
		}
		if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\_");
			for (int i = 0; i < tids_s.length; i++) {
				tmidsset.add(Integer.parseInt(tids_s[i]));	
			}
		}
		Scene se;
		if(tmidsset.size()>0){
			
			if(VVersion.le_clientdisabled==0){
					int  disabled=Constant.checkDisabledClient(tmidsset);
					
					if(disabled==1){
						
						return "success3"; 
					}	
					
			}
			  
			/** 获取当前计划所有节目**/
			/** 获取计划名**/
			String jhName=(String)SqlConnect.getSqlMapInstance().queryForObject("see_jh_name", jhid);
			
			List<JhItem> jhitems=SqlConnect.getSqlMapInstance().queryForList("sel_jh_item_all",jhid);
			
			
			//垫片发布
			Protocol protocol=new Protocol();
			protocol.setType(ProtocolType.TYPE65);
			protocol.setPlayType("dpnewlist");
			
			//获取计划id分组
			List<JhItem> jhitemsGroup=SqlConnect.getSqlMapInstance().queryForList("sel_jh_group_all", jhid);
			
			
			List<ProtocolDpB> protocolDpBList=new ArrayList<ProtocolDpB>();
			
			for (int i = 0; i < jhitemsGroup.size(); i++) {
				
				JhItem jhItem=jhitemsGroup.get(i);
				
				ProtocolDpB protocolDpB=new ProtocolDpB();
				
				protocolDpB.setDay(jhItem.getDay());
				
				protocolDpB.setJd(Integer.parseInt(jhItem.getSdate()));
				
				List<JhItem> jhitemsGroupDayList=SqlConnect.getSqlMapInstance().queryForList("sel_jh_group_day_info", jhItem);
				
				List<ProtocolDp> protocolDpList=new ArrayList<ProtocolDp>();
				
				for (int j = 0; j < jhitemsGroupDayList.size(); j++) {
					
					JhItem  jhitemsGroupDay=jhitemsGroupDayList.get(j);
					
					ProtocolDp protocolDp=new ProtocolDp();
					
					protocolDp.setJdNum(Integer.parseInt(jhitemsGroupDay.getEdate()));
					
					List<String> playList=new ArrayList<String>();
					
					
					if(jhitemsGroupDay.getItemids().equals("")){
						
					}else{
						
						String jhitemsString[]=jhitemsGroupDay.getItemids().split("\\,");
						
						for (int z = 0; z < jhitemsString.length; z++) {
							
							/**获取节目信息**/
							se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", Integer.parseInt(jhitemsString[z]));
							
							playList.add(se.getFilename());
							
						}
						
					}
					
				
					
					protocolDp.setPlayList(playList);
					
					protocolDpList.add(protocolDp);
					
					
				}
				
				protocolDpB.setProtocolDp(protocolDpList);
				protocolDpBList.add(protocolDpB);
				
				
			}
			
			protocol.setProtocolPlayBaseList(protocolDpBList);
			
			
			/**HashSet去重复**/
			HashSet<Integer> itemset=new HashSet();
		
			for (JhItem jhitem : jhitems) {
			
				if(jhitem.getItemids().equals("")){
					
				}else{
					
					
					    String jhitemsString[]=jhitem.getItemids().split("\\,");
						
						
						for (int i = 0; i < jhitemsString.length; i++) {
							
							itemset.add(Integer.parseInt(jhitemsString[i]));
							
						}
				}
               
				
			}
			
			Client client;
			String filepathzip="";
			int fileExists=0;
			String[] vms;
			long clen=0L;
			long len=0L;
			String itemnames="";
			int rid;
		
			String downcmd="";
			String vmsStrs="";
			if (itemset.size() > 0) {
				ProtocolDownResource protocolDownResourceTemp;
				for (Integer itemid : itemset) {
					/**获取节目信息**/
					se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", itemid);
					if(se!=null){
						
						/**获取场景zip大小*/
						filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
						
						/**验证文件存在不存在: 0不存在,1存在**/
						fileExists=FileHandle.fileExists(filepathzip);
																
						if(fileExists==0){
							return "success2"; 
						}
						
						len = FileHandle.getFileByte(filepathzip);
						
						/**获取视频,音频大小*/
						if(!"".equals(se.getVname())){					
							vms = se.getVname().split("\\|");
							for (int j = 0; j < vms.length; j++) {
								
                                /**验证多视频音频文件是重复**/
								if(vmsStrs.indexOf(vms[j])==-1){
									fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
									//if(fileExists==0){
									//	return "success2"; 
									//}
									
									len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
									
									vmsStrs=vmsStrs+"*"+vms[j];
								}
							}
						}
						
						
						if(downcmd.equals("")){
							downcmd = se.getFilename() + ".zip";
						}else{
							downcmd = downcmd + "|" + se.getFilename() + ".zip";
						}
						
						if (se.getVname().length() > 0
								&& (se.getVname().indexOf(':') == -1)) {
							
							downcmd += "|" + se.getVname();
						}
											
					}
					clen+=len;
					
				}
			}
			protocol.setDownResourceSize(clen);
			protocol.setProtocolDownResourceList(ProtocolUtil.getProtocolDownResourceList(downcmd));
			
			/** 判断用户有没有发送权限(0.需审核 1.已审核.2节目需审核3.发布需审核)**/
			if (uocheck == 0||uocheck==3) {
					
			
			} else if (uocheck == 1||uocheck==2) {
			
					    String logcontent =local.getA00653()+"["+local.getB00310()+"]:"+jhName;
						
					    Log log = LogHandle.insertTheLogSend(LogType.type73, uid, logcontent,1);
						
					    String sendkey = log.getSendkey();
					
						protocol.setSendkey(sendkey);
						
						JSONObject jsonObject = JSONObject.fromObject(protocol);
						
						//System.out.println(jsonObject.toString());
						
						log.setMsg(jsonObject.toString());
						
						sm.update("upd_log_send_msg", log);
						
						String fzmsg;
						
						Result rs = new Result();
						
						HashMap hm = new HashMap();
						
						MyMsg mymsg;
						
		                SendTime st;
			            
		                String msgfile=Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
		         	
		         	    File f = new File(Constant.FILES + File.separator + msgfile+".txt");
		     		
		         	    FileOutputStream oldFileWriter;
		     		
		     		    new File(Constant.FILES + File.separator + msgfile+".txt.new");
		     		
		     		    FileOutputStream newFileWriter;
		     		
		     		    oldFileWriter = new FileOutputStream(f);
						
		     		    oldFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
			     		
		     		    oldFileWriter.close();
			     		
						/** 发送给终端**/
			            String msg0818="0+sendkey!" + sendkey + "%"+msgfile+".txt";
						for (Integer cid : tmidsset) {
							client=(Client)sm.queryForObject("sel_client_byid", cid);
							Constant.ResetDownState(client.getMark(),"0.0");
							//sm.delete("del_one_senditem", client.getId());
							rs.setClid(client.getId());
							rs.setLogid(log.getId());
							rs.setState(0);
							rs.setType(ResultType.rt18);
							rid=(Integer)sm.insert("ad_result", rs);			
							/** 添加指令记录**/
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							
							/**for (JhItem jhitem : jhitems) {
								
								st = new SendTime();
								st.setResultid(rid);
								st.setItemid(jhitem.getItemids()+",");
								st.setDay(jhitem.getDay());
								st.setSdate(jhitem.getSdate());
								st.setEdate(jhitem.getEdate());
								sm.insert("insert_one_timeitem", st);
								
							}**/
							
							/**添加执行结果最后一次播放记录**/
							//itemsids=itemsids.replaceAll("_", ",");
							
							//ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt16, playcons, uid, client.getMark(), log.getSendkey(), 0);
							
							if (client.getServerid() == 0) {
							   Mlt mt = Constant.messageMap.get(client.getMark());
							   if (mt != null) {
									mymsg = new MyMsg();
									mymsg.msg = msg0818;
									mymsg.sendkey = log.getSendkey();
									mt.allmsg.add(mymsg);
								}
							 } else {
								 /*client = (Client) sm.queryForObject("see_terminal_server_mark", client.getId());
								 fzmsg = msg + "@" + sendkey + "@";
								 vlu = (String) hm.get(client.getSrvmark());
								 if (vlu == null) {
										hm.put(client.getSrvmark(),fzmsg + client.getMark());
								 } else {
										hm.put(client.getSrvmark(),vlu += "_" + client.getMark());
								 }*/
							 }
							 
							  
						} 
						/*Iterator iit = hm.keySet().iterator();
						String tke;
						MyMsg myt;
						while (iit.hasNext()) {
							tke = (String) iit.next();
							Mlt mt = Constant.messageMap2.get(tke);
							if (mt != null) {
								myt = new MyMsg();
								myt.msg = (String) hm.get(tke);
								
								
								int allmsgSize=mt.allmsg.size();
								if(allmsgSize==2){
									mt.allmsg.remove(0);
								}else if(allmsgSize>2){
									mt.allmsg.clear();
								}
								mt.allmsg.add(myt);
							}
						
						}*/
			
					}
		
		}
		return SUCCESS;
	}


	

	public String getClientids() {
		return clientids;
	}


	public void setClientids(String clientids) {
		this.clientids = clientids;
	}


	public String getCgids() {
		return cgids;
	}

	public void setCgids(String cgids) {
		this.cgids = cgids;
	}
	
	public int getJhid() {
		return jhid;
	}


	public void setJhid(int jhid) {
		this.jhid = jhid;
	}
	
	




}
