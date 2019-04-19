package com.vshow.control.item.fb;


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
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendInteract;
import com.vshow.control.data.Sucai;
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

public class FbInteractItemAction implements Action {

	
	private String itemsids;    //节目id
	private String clientids;  //终端id多个以"_"分割
	private String cgids;       //终端分组id多个以"_"分割
	private String lostFileName="";
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
		
		
		
		if(tmidsset.size()>0){
			
			/** 获取节目**/
			
			String[] itemArray=itemsids.split("\\_");
			InteractItem item=new InteractItem();
			for (int i = 0; i < itemArray.length; i++) {
				if(i==0){
					 item = (InteractItem) sm.queryForObject(
							"sel_id_interactitem", Integer.parseInt(itemArray[i]));
				}
			}
			
			Client client;
			Scene se;
			String filepathzip="";
			int fileExists=0;
			String[] vms;
			long clen=0L;
			long len=0L;
			
			int rid;
			if (tmidsset.size() > 0) {
				/**获取节目下所有场景(关联)**/
				
				 if(VVersion.le_clientdisabled==0){
						
					    int  disabled=Constant.checkDisabledClient(tmidsset);
						
						if(disabled==1){
							
							return "success3"; 
						}	
						
				 }

				//List<Scene> scenes = sm.queryForList("sel_interactitem_allscene",Integer.parseInt(itemsids));
			   List<Scene> scenes=new ArrayList<Scene>();	
			   for (int i = 0; i < itemArray.length; i++) {
						
					String filenNameR =(String)sm.queryForObject("sel_interact_item_filename_id", Integer.parseInt(itemArray[i]));
						
					Constant.recursionFileNameTson(filenNameR, scenes);
						
			    }
				 
				
				
				/** 验证文件存在不存在，并且获取文件大小*/
				String vmsStrs="";
				for (int i = 0; i < scenes.size(); i++) {
					se=scenes.get(i);
					if(se!=null){
						
						/**获取场景zip大小*/
						filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
						
						/**验证文件存在不存在: 0不存在,1存在**/
						fileExists=FileHandle.fileExists(filepathzip);
																
						if(fileExists==0){
							
							InteractItem interactItem=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename", se.getFilename());
							if(interactItem!=null){
								lostFileName+=interactItem.getName();
							}
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
									
									if(fileExists==0){
										
										Sucai sucai=(Sucai)SqlConnect.getSqlMapInstance().queryForObject("sel_sc_filename", vms[j]);
										
										if(sucai!=null){
											lostFileName+=sucai.getName();
										}else{
											lostFileName+=vms[j];
										}
										return "success2"; 
									}
									
									len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
									
									vmsStrs=vmsStrs+"*"+vms[j];
									
								}
							}
						}
						
						/**获取副屏视频大小**/
						Scene tempSceneSub=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid_sub", se.getFilename());
						
						if(tempSceneSub!=null){
							
							/**获取视频,音频大小*/
							if(!"".equals(tempSceneSub.getVname())){					
								vms = tempSceneSub.getVname().split("\\|");
								for (int j = 0; j < vms.length; j++) {
									/**验证多视频音频文件是重复**/
									if(vmsStrs.indexOf(vms[j])==-1){
										//fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
										//if(fileExists==0){
										//	return "success2"; 
										//}
										len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
										
										vmsStrs=vmsStrs+"*"+vms[j];
										
									}
									
								}
							}
							
						}
											
					}
					clen+=len;
					
				}

				/** 判断用户有没有发送权限(0.需审核 1.已审核 2 节目需要审核 3.发布需要审核)**/
				if (uocheck == 0 || uocheck == 3) {
					String logcontent = local.getA00445() + ":"+ item.getName();
				    Log log = LogHandle.insertTheLogSend(LogType.type77, uid, logcontent,2);
					Result rs = new Result();
					SendInteract sd = new SendInteract();
					
					for (Integer cid : tmidsset) {
						client=(Client)sm.queryForObject("sel_client_byid", cid);
						//sm.delete("del_one_senditem", client.getId());
						rs.setClid(client.getId());
						rs.setLogid(log.getId());
						rs.setState(0);
						rs.setType(ResultType.rt2);
						rid=(Integer)sm.insert("ad_result", rs);
						/**添加指令记录**/
						//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
						sd.setResultid(rid);
						sd.setInteractitemid(Integer.parseInt(itemsids));
						sm.insert("insert_one_sendinteractitem", sd);
					}

				} else if (uocheck == 1 || uocheck == 2) {

					String cmd = "";
					Scene tempScene = (Scene) sm.queryForObject("sel_one_interactscene", item.getId());
					cmd = tempScene.getFilename();
					String downcmd = "";
					for (int i = 0; i < scenes.size(); i++) {
						Scene sce = scenes.get(i);
						if (i == 0) {
							 cmd = sce.getFilename();
							 downcmd = sce.getFilename() + ".zip";
						} else {
							 cmd = cmd + "|" + sce.getFilename();
							downcmd = downcmd + "|" + sce.getFilename() + ".zip";
						}
						if (sce.getVname().length() > 0
								&& (sce.getVname().indexOf(':') == -1)) {
							downcmd += "|" + sce.getVname();
						}
						

						/**获取副屏视频大小**/
						Scene tempSceneSub=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid_sub", sce.getFilename());
						
						if(tempSceneSub!=null){
							if (tempSceneSub.getVname().length() > 0
									&& (tempSceneSub.getVname().indexOf(':') == -1)) {
								downcmd += "|" + tempSceneSub.getVname();
							}
							
						}

					}

					String logcontent = local.getA00445() + ":"+ item.getName();
				
					Log log = LogHandle.insertTheLogSend(LogType.type77, uid, logcontent,1);
					String sendkey = log.getSendkey();
					String msg = "02" + clen + "/" + downcmd + "+"
							+ "sendkey!" + sendkey + "%playlist!" + cmd;
					log.setMsg(msg);
					sm.update("upd_log_send_msg", log);
					String fzmsg;
					Result rs = new Result();
					SendInteract sd = new SendInteract();
					HashMap hm = new HashMap();
					int rsid;
					String vlu;
					MyMsg mymsg;
					String msgdownkey = "";
					/** 发送给终端**/
					String msg0818=Constant.sendDownString(msg, sendkey,null);
					for (Integer cid : tmidsset) {
						client=(Client)sm.queryForObject("sel_client_byid", cid);
						Constant.ResetDownState(client.getMark(),"0.0");
						//sm.delete("del_one_senditem", client.getId());
						rs.setClid(client.getId());
						rs.setLogid(log.getId());
						rs.setState(0);
						rs.setType(ResultType.rt2);
						rid=(Integer)sm.insert("ad_result", rs);			
						/** 添加指令记录**/
						//Constant.addCml(cid, rid, log.getId(),log.getSendkey());					
						sd.setResultid(rid);
						sd.setInteractitemid(Integer.parseInt(item.getId()+""));
						sm.insert("insert_one_sendinteractitem", sd);
						
						/**添加执行结果最后一次播放记录**/
						itemsids=item.getId()+"".replaceAll("_", ",");
						
						ClientPlayHandle.insertClientPlay(itemsids, 2, ResultType.rt2, logcontent, uid, client.getMark(), log.getSendkey(), 0);
						
						
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
					
					/**
					Iterator iit = hm.keySet().iterator();
					String tke;
					MyMsg myt;
					while (iit.hasNext()) {
						tke = (String) iit.next();
						Mlt mt = Constant.messageMap2.get(tke);
						if (mt != null) {
							myt = new MyMsg();
							myt.msg = (String) hm.get(tke);
							int allmsgSize = mt.allmsg.size();
							if (allmsgSize == 2) {
								mt.allmsg.remove(0);
							} else if (allmsgSize > 2) {
								mt.allmsg.clear();
							}
							mt.allmsg.add(myt);
						}
					}
	                 **/
				}

			}
		}
		
		
	
		
		return SUCCESS;
	}

	public String getItemsids() {
		return itemsids;
	}

	public void setItemsids(String itemsids) {
		this.itemsids = itemsids;
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

	public String getLostFileName() {
		return lostFileName;
	}

	public void setLostFileName(String lostFileName) {
		this.lostFileName = lostFileName;
	}
}
