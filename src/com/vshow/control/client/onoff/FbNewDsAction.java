package com.vshow.control.client.onoff;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.ShutNew;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbNewDsAction implements Action {
	
	private String task;
	private String clientids;  //终端id多个以"_"分割
	private String cgids;       //终端分组id多个以"_"分割

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
			/** 获取用户下所选组的所有终端**/
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
			
			task.trim();

			SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String thekeytime = sf2.format(new Date());

			ArrayList ls = new ArrayList();
			
			ShutNew smsm = null;
			
			String logcontent = "";
			
			String theone = "";
			String temstr;
			String[] ss2;
			String cmd = "";
			String[] zqs; 
	      
	        int week = 0;
	        String oftype="";
	        String dayscontent="";
			if (task.length() > 0) {
				String[] ss = task.split("\\/");
				for (int i = 0; i < ss.length; i++) {
					theone = ss[i].trim();
					if (theone.length() > 0) {
						ss2 = theone.split("\\_");
						if (ss2.length == 3) {
							smsm = new ShutNew();
							temstr = ss2[0];
							zqs=temstr.split("\\|");
							week=0;
							dayscontent="";
							oftype="";
							for (int j = 0; j < zqs.length; j++) {
								 if(zqs[j].equals("1")){
									 week|=Constant.WEEK1;
								 }
								 if(zqs[j].equals("2")){
									 week|=Constant.WEEK2;
								 }
								 if(zqs[j].equals("3")){
									 week|=Constant.WEEK3;
								 }
								 if(zqs[j].equals("4")){
									 week|=Constant.WEEK4;
								 }
								 if(zqs[j].equals("5")){
									 week|=Constant.WEEK5;
								 }
								 if(zqs[j].equals("6")){
									 week|=Constant.WEEK6;
								 }
								 if(zqs[j].equals("7")){
									 week|=Constant.WEEK7;
								 }
								 if(zqs[j].equals("8")){
									 week|=Constant.WEEK_ALL;
								 }
								 
								 if(dayscontent.length()==0){
										if(zqs[j].equals("8")){
											dayscontent=local.getA00483();
										} else if (zqs[j].equals("7")) {
											dayscontent=local.getA00482();
										} else if (zqs[j].equals("6")) {
											dayscontent=local.getA00481();
										} else if (zqs[j].equals("5")) {
											dayscontent=local.getA00480();
										} else if (zqs[j].equals("4")) {
											dayscontent=local.getA00479();
										} else if (zqs[j].equals("3")) {
											dayscontent=local.getA00478();
										} else if (zqs[j].equals("2")) {
											dayscontent=local.getA00476();
										} else if (zqs[j].equals("1")) {
											dayscontent=local.getA00475();
										}
								 }else{
										if(zqs[j].equals("8")){
											dayscontent+="|"+local.getA00483();
										} else if (zqs[j].equals("7")) {
											dayscontent+="|"+local.getA00482();
										} else if (zqs[j].equals("6")) {
											dayscontent+="|"+local.getA00481();
										} else if (zqs[j].equals("5")) {
											dayscontent+="|"+local.getA00480();
										} else if (zqs[j].equals("4")) {
											dayscontent+="|"+local.getA00479();
										} else if (zqs[j].equals("3")) {
											dayscontent+="|"+local.getA00478();
										} else if (zqs[j].equals("2")) {
											dayscontent+="|"+local.getA00476();
										} else if (zqs[j].equals("1")) {
											dayscontent+="|"+local.getA00475();
										}
									}
							}
							smsm.setDays(temstr);
							
							smsm.setType(Integer.parseInt(ss2[1]));
							
					        smsm.setSdate(ss2[2]);
							
						
							if(Integer.parseInt(ss2[1])==0){
								oftype=local.getA00485();
							}else{
								oftype=local.getA00484();
							}
							

							if (cmd.isEmpty()) {
								cmd = week + "_" +ss2[1] + "_"+ ss2[2];
								logcontent=local.getA00502()+" : "+dayscontent+"_"+oftype+"_"+ss2[2];
							} else {
								cmd += "^" + week + "_" + ss2[1]+ "_" + ss2[2];
								logcontent += "^" +local.getA00502()+" : "+dayscontent+"_"+oftype+"_"+ss2[2];
							}
							ls.add(smsm);
						}
					}
				}
			}
			if (logcontent.length() == 0) {
				logcontent = local.getA00501();
			}
			
			
			//String tname = local.getA00486();
			Log log = LogHandle.insertTheLogSend(LogType.type27, uid,logcontent,1);
			String sendkey = log.getSendkey();
			String msg = "01+" + "sendkey!" + sendkey + "%shutnew!" + cmd;
			log.setMsg(msg);
			sm.update("upd_log_send_msg", log);
			Result rs = new Result();
			HashMap hm = new HashMap();
			String vlu;
			String fzmsg;
			MyMsg mymsg;
			Client client;
			// 发送给终端
			for (Integer cid : tmidsset) {
				client=(Client)sm.queryForObject("sel_client_byid", cid);
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt12);
				int rid=(Integer)sm.insert("ad_result", rs);
				//添加指令记录
				//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				for (int i = 0; i < ls.size(); i++) {
					//thekey = thekeytime + "_" + urid + "_" + i;
					smsm = (ShutNew) ls.get(i);
					smsm.setResultid(rid);
					sm.insert("insert_one_new_shut", smsm);
				}
				
				
				if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
					}
				} else {
					/*client = (Client) sm.queryForObject("see_terminal_server_mark",
							client.getId());
					fzmsg = msg + "@" + sendkey + "@";
					vlu = (String) hm.get(client.getSrvmark());
					if (vlu == null) {
						hm.put(client.getSrvmark(), fzmsg + client.getMark());
					} else {
						hm.put(client.getSrvmark(), vlu += "_" + client.getMark());
					}*/
				}

			}
			/*
			Iterator iit = hm.keySet().iterator();
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
			//session.put("url", "tocs.vs");
		}
		
		return SUCCESS;
	}

	

	public String getTask() {
		return task;
	}



	public void setTask(String task) {
		this.task = task;
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




	

}
