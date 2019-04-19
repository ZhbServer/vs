package com.vshow.control.item.jh;


import java.io.File;
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
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class FbJhItemAction implements Action {

	
	
	private String clientids;  //终端id多个以"_"分割
	private String cgids;      //终端分组id多个以"_"分割
	private int vfbmode=0;      //发布模式 0替换 1追加
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
			
			/**HashSet去重复**/
			HashSet<Integer> itemset=new HashSet();
			String cmds="";
			String downcmd = "";
			String playcons="";
			String playcon="";
			String itemidss="";
			for (JhItem jhitem : jhitems) {
				playcon = Constant.LOCAL.getA00642()+":" + jhitem.getItemnames();
				  
				playcon += Constant.LOCAL.getA00582()+" :" + jhitem.getSdate();

				playcon += Constant.LOCAL.getA00583()+" :" + jhitem.getEdate();
                
                if(itemidss.length()==0){
                	itemidss=jhitem.getItemids();
                	playcons=playcon;
                }else{
                	itemidss=itemidss+","+jhitem.getItemids();
                	playcons=playcons+"^"+playcon;
                }
                String jhitemsString[]=jhitem.getItemids().split("\\,");
				/**拼接协议**/
				String cmd =jhitem.getSdate()+"_"+jhitem.getEdate()+"_";
				for (int i = 0; i < jhitemsString.length; i++) {
					itemset.add(Integer.parseInt(jhitemsString[i]));
					/**获取节目信息**/
					se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", Integer.parseInt(jhitemsString[i]));
					
					if (i == 0) {
						cmd = se.getFilename();
					} else {
						cmd += "|" + se.getFilename();
					}
					if(downcmd.length()==0){
						downcmd = se.getFilename() + ".zip";
					}else{
						downcmd += "|" + se.getFilename() + ".zip";
					}
					if (se.getVname().length() > 0
							&& (se.getVname().indexOf(':') == -1)) {
						downcmd += "|" + se.getVname();
					}
				}
				if(cmds.length()==0){
					cmds=jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
				}else{
					cmds=cmds+"^"+jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
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
		
			if (itemset.size() > 0) {
				
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
								
								//fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
								//if(fileExists==0){
								//	return "success2"; 
								//}
								len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
							}
						}
											
					}
					clen+=len;
				}
				/** 判断用户有没有发送权限(0.需审核 1.已审核.2节目需审核3.发布需审核)**/
				if (uocheck == 0||uocheck==3) {
					 /**
						String logcontent =local.getA00417()+ ":" + itemnames;
						Log log = LogHandle.insertTheLogSend(LogType.type12, uid, logcontent,2);
						Result rs = new Result();
						Send sd = new Send();
						for (Integer cid : tmidsset) {
							client=(Client)sm.queryForObject("sel_client_byid", cid);
							//sm.delete("del_one_senditem", client.getId());
							rs.setClid(client.getId());
							rs.setLogid(log.getId());
							rs.setState(0);
							rs.setType(ResultType.rt1);
							rid=(Integer)sm.insert("ad_result", rs);
							添加指令记录
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							sd.setResultid(rid);
							sd.setItemids(itemsids);
							sm.insert("ad_send", sd);
						}
				      **/
			
					} else if (uocheck == 1||uocheck==2) {
			
						String mode="";
						String modeStr="";
						if(vfbmode==0){
							mode="02";
							modeStr=local.getA00637();
						}else{
							mode="44";
							modeStr=local.getA00636();
						}
					    String logcontent =local.getA00653()+"["+local.getA00646()+"]["+modeStr+"]:"+jhName;
						Log log = LogHandle.insertTheLogSend(LogType.type88, uid, logcontent,1);
						String sendkey = log.getSendkey();
						String msg = mode + clen + "/" + downcmd + "+"
								+ "sendkey!" + sendkey + "%datelist!"+cmds;		
						log.setMsg(msg);
						sm.update("upd_log_send_msg", log);
						String fzmsg;
						Result rs = new Result();
						SendDate sd ;
						HashMap hm = new HashMap();
						String vlu;
						MyMsg mymsg;
						Date currentTime;
			            String markdownload;
			            String downloadkey;
			            String msgdownkey="";
						/** 发送给终端**/
			            String msg0818=Constant.sendDownString(msg, sendkey,null);
						for (Integer cid : tmidsset) {
							client=(Client)sm.queryForObject("sel_client_byid", cid);
							Constant.ResetDownState(client.getMark(),"0.0");
							//sm.delete("del_one_senditem", client.getId());
							rs.setClid(client.getId());
							rs.setLogid(log.getId());
							rs.setState(0);
							rs.setType(ResultType.rt23);
							rid=(Integer)sm.insert("ad_result", rs);			
							/** 添加指令记录**/
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							
							for (JhItem jhitem : jhitems) {
								sd=new SendDate();
								sd.setResultid(rid);
								sd.setItemids(jhitem.getItemids()+",");
								sd.setSdate(jhitem.getSdate());
								sd.setEdate(jhitem.getEdate());
								sm.insert("ad_send_date", sd);
							}
							
							/**添加执行结果最后一次播放记录**/
							//itemsids=itemsids.replaceAll("_", ",");
							ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt23, playcons, uid, client.getMark(), log.getSendkey(), 0);
							
						    
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
	
	
	public int getVfbmode() {
		return vfbmode;
	}


	public void setVfbmode(int vfbmode) {
		this.vfbmode = vfbmode;
	}



}
