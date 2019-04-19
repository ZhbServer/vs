package com.vshow.control.item.fb;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import java.util.List;
import java.util.Map;


import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.count.CountPeopleDetails;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;

import com.vshow.control.data.Item;
import com.vshow.control.data.Log;

import com.vshow.control.data.AccurateSend;
import com.vshow.control.data.InductionSend;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendPlayBasis;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolPlayAccurate;
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

public class FbAccurateItemAction implements Action {

	
	private String itemsids;   //节目id多个以"_"分割
	private String clientids;  //终端id多个以"_"分割
	private String cgids;      //终端分组id多个以"_"分割
	private int fbmode=0;      //发布模式 0替换 1追加
	private String sendPlayBasisJson;

	public String execute() throws Exception {
		
        JSONObject json = JSONObject.fromObject(sendPlayBasisJson);
		
		
        ProtocolPlayAccurate protocolPlayAccurate= (ProtocolPlayAccurate)JSONObject.toBean(json, ProtocolPlayAccurate.class);
		
		if(protocolPlayAccurate.getFbmode()==0){
			fbmode=2;
		}else if(protocolPlayAccurate.getFbmode()==1){
			fbmode=44;
		}
		
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
		
			if(VVersion.le_clientdisabled==0){
				int  disabled=Constant.checkDisabledClient(tmidsset);
				
				if(disabled==1){
					
					return "success3"; 
				}	
				
			}
			
			
			
			/** 获取节目**/
			String itemids_s[] =itemsids.split("\\_") ;
			Client client;
			Scene se;
			String filepathzip="";
			int fileExists=0;
			String[] vms;
			long clen=0L;
			long len=0L;
			String itemnames="";
			int rid;
			List<Scene> scenes=new ArrayList<Scene>();
			if (itemids_s.length > 0) {
				
				int playNumber=1;
				String vmsStrs="";
				for (int i = 0; i < itemids_s.length; i++) {
					
					
				
					playNumber=1;
					/**获取节目信息**/
					
					se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id",Integer.parseInt(itemids_s[i]) );
					if(se!=null){
						se.setPlayNumber(playNumber);
						scenes.add(se);
						
						/**获取节目名字**/
						if(itemnames.length()==0){
							itemnames=se.getName();
						}else{
							itemnames=itemnames+","+se.getName();
						}
						
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
					clen+=len;
					}
			
				
					/** 判断用户有没有发送权限(0.需审核 1.已审核.2节目需审核3.发布需审核)**/
					if (uocheck == 0||uocheck==3) {
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
							/**添加指令记录**/
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							sd.setResultid(rid);
							sd.setItemids(itemsids);
							sm.insert("ad_send", sd);
						}
			
					} else if (uocheck == 1||uocheck==2) {
			
						String cmd = "";
						String downcmd = "";
						String playFileName="";
						
						
						List<String> playList =new ArrayList<String>();
						for (int i = 0; i < scenes.size(); i++) {
							Scene sce = scenes.get(i);
							
							//拼接播放次数
							playFileName="";
							for (int j = 0; j < sce.getPlayNumber(); j++) {
								if(j==0){
									playFileName=sce.getFilename();
								}else{
									playFileName=playFileName + "|" + sce.getFilename();
								}
							}
							
							
							playList.add(sce.getFilename());
							
							if (i == 0) {
								cmd = playFileName;
								downcmd = sce.getFilename() + ".zip";
							} else {
								cmd = cmd + "|" + playFileName;
								downcmd = downcmd + "|" + sce.getFilename() + ".zip";
							}
							if (sce.getVname().length() > 0
									&& (sce.getVname().indexOf(':') == -1)) {
								downcmd += "|" + sce.getVname();
							}
			
						}
						
					
						
						String logcontent =local.getB00145()+":" + itemnames;
						
	                    if(protocolPlayAccurate.getSex()==0){
	                    	logcontent=logcontent+"["+Constant.LOCAL.getB00142() +":"+Constant.LOCAL.getB00143()+","+Constant.LOCAL.getB00144()+"]";
						}else if(protocolPlayAccurate.getSex()==1){
							logcontent=logcontent+"["+Constant.LOCAL.getB00142() +":"+Constant.LOCAL.getB00143()+"]";
						}else if(protocolPlayAccurate.getSex()==2){
							logcontent=logcontent+"["+Constant.LOCAL.getB00142() +":"+Constant.LOCAL.getB00144()+"]";
						} 
	
	                    logcontent=logcontent+"["+Constant.LOCAL.getB00141() +":"+protocolPlayAccurate.getGeneration().replace(",", "~")+"]";
						
					    Log log = LogHandle.insertTheLogSend(LogType.type104, uid, logcontent,1);
						
						String sendkey = log.getSendkey();
						
						Protocol  protocol=new Protocol();
						
						protocol.setType(fbmode);
						
						protocol.setSendkey(sendkey);
						
						//下载资源
						List<ProtocolDownResource> protocolDownResourceList=ProtocolUtil.getProtocolDownResourceList(downcmd);
						
						protocol.setProtocolDownResourceList(protocolDownResourceList);
						
						//类型
						protocol.setPlayType("accuratelist");
						
						
						//播放列表
						ProtocolPlayAccurate ppa=new ProtocolPlayAccurate();
						
						JSONObject jsonObject = JSONObject.fromObject(sendPlayBasisJson);
						
						
						
						
						ppa.setSex(jsonObject.getInt("sex"));
						
						ppa.setGeneration(jsonObject.getString("generation"));
						
						ppa.setPlayList(playList);
						
						protocol.setProtocolPlayBaseList(ppa);
						
						String protocolPlayStitching=cmd+"_"+ppa.getSex()+"_"+ppa.getGeneration().replaceAll("\\,", "\\_");
						
						protocol.setProtocolPlayStitching(protocolPlayStitching);
						
						json = JSONObject.fromObject(protocol);
						
						log.setMsg(json.toString());
						
						sm.update("upd_log_send_msg", log);
						
						
						
						Result rs = new Result();
						AccurateSend as = new AccurateSend();
						
						
						
						MyMsg mymsg;
				
						
			            /** 发送给终端**/
			            String msg0818=Constant.createDownString(json.toString(), sendkey);
			            
						for (Integer cid : tmidsset) {
							client=(Client)sm.queryForObject("sel_client_byid", cid);
							Constant.ResetDownState(client.getMark(),"0.0");
							//sm.delete("del_one_senditem", client.getId());
							rs.setClid(client.getId());
							rs.setLogid(log.getId());
							rs.setState(0);
							rs.setType(ResultType.rt36);
							rid=(Integer)sm.insert("ad_result", rs);			
							/** 添加指令记录**/
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							/**添加执行结果最后一次播放记录**/
							itemsids=itemsids.replaceAll("_", ",");
							as.setResultid(rid);
							as.setItemids(itemsids+",");
							as.setType(1);
							as.setGeneration(jsonObject.getString("generation"));
							as.setSex(jsonObject.getInt("sex"));
							sm.insert("ad_accurate_send", as);
							
							
							
							ClientPlayHandle.insertClientPlay(itemsids, 1, ResultType.rt36, logcontent, uid, client.getMark(), log.getSendkey(), 0);
							
						    
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
	
	
	
	public String getSendPlayBasisJson() {
		return sendPlayBasisJson;
	}


	public void setSendPlayBasisJson(String sendPlayBasisJson) {
		this.sendPlayBasisJson = sendPlayBasisJson;
	}
	
	
	public int getFbmode() {
		return fbmode;
	}


	public void setFbmode(int fbmode) {
		this.fbmode = fbmode;
	}

}
