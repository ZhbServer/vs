package com.vshow.control.api.client.sys;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.ShutNew;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;


/**
 * 定时开关机
 * @param account账号
 * @param password 密码 
 * @param task 日期命令
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiNewDsAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
	private String task;
	private String cids;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				HashSet<Integer> tmidsset = new HashSet();
				try{	
					if (cids != null && !"".equals(cids)) {
						/** 获取选中的所有终端 **/
						String[] tids_s = cids.split("\\_");
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
														dayscontent=Constant.LOCAL.getA00483();
													} else if (zqs[j].equals("7")) {
														dayscontent=Constant.LOCAL.getA00482();
													} else if (zqs[j].equals("6")) {
														dayscontent=Constant.LOCAL.getA00481();
													} else if (zqs[j].equals("5")) {
														dayscontent=Constant.LOCAL.getA00480();
													} else if (zqs[j].equals("4")) {
														dayscontent=Constant.LOCAL.getA00479();
													} else if (zqs[j].equals("3")) {
														dayscontent=Constant.LOCAL.getA00478();
													} else if (zqs[j].equals("2")) {
														dayscontent=Constant.LOCAL.getA00476();
													} else if (zqs[j].equals("1")) {
														dayscontent=Constant.LOCAL.getA00475();
													}
												}else{
													if(zqs[j].equals("8")){
														dayscontent+="|"+Constant.LOCAL.getA00483();
													} else if (zqs[j].equals("7")) {
														dayscontent+="|"+Constant.LOCAL.getA00482();
													} else if (zqs[j].equals("6")) {
														dayscontent+="|"+Constant.LOCAL.getA00481();
													} else if (zqs[j].equals("5")) {
														dayscontent+="|"+Constant.LOCAL.getA00480();
													} else if (zqs[j].equals("4")) {
														dayscontent+="|"+Constant.LOCAL.getA00479();
													} else if (zqs[j].equals("3")) {
														dayscontent+="|"+Constant.LOCAL.getA00478();
													} else if (zqs[j].equals("2")) {
														dayscontent+="|"+Constant.LOCAL.getA00476();
													} else if (zqs[j].equals("1")) {
														dayscontent+="|"+Constant.LOCAL.getA00475();
													}
												}
										}
										smsm.setDays(temstr);
										
										smsm.setType(Integer.parseInt(ss2[1]));
										
								        smsm.setSdate(ss2[2]);
										
									
										if(Integer.parseInt(ss2[1])==0){
											oftype=Constant.LOCAL.getA00485();
										}else{
											oftype=Constant.LOCAL.getA00484();
										}
										
	
										if (cmd.isEmpty()) {
											cmd = week + "_" +ss2[1] + "_"+ ss2[2];
											logcontent=Constant.LOCAL.getA00502()+" : "+dayscontent+"_"+oftype+"_"+ss2[2];
										} else {
											cmd += "^" + week + "_" + ss2[1]+ "_" + ss2[2];
											logcontent += "^" +Constant.LOCAL.getA00502()+" : "+dayscontent+"_"+oftype+"_"+ss2[2];
										}
										ls.add(smsm);
									}
								}
							}
						}
						if (logcontent.length() == 0) {
							logcontent = Constant.LOCAL.getA00501();
						}
						
						
						Log log = LogHandle.insertTheLogSend(LogType.type27, user.getId(),logcontent,1);
						String sendkey = log.getSendkey();
						String msg = "01+" + "sendkey!" + sendkey + "%shutnew!" + cmd;
						log.setMsg(msg);
						SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
						Result rs = new Result();
						MyMsg mymsg;
						Client client;
						// 发送给终端
						for (Integer cid : tmidsset) {
							client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", cid);
							rs.setClid(client.getId());
							rs.setLogid(log.getId());
							rs.setState(0);
							rs.setType(ResultType.rt12);
							int rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);
							//添加指令记录
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							for (int i = 0; i < ls.size(); i++) {
								//thekey = thekeytime + "_" + urid + "_" + i;
								smsm = (ShutNew) ls.get(i);
								smsm.setResultid(rid);
								SqlConnect.getSqlMapInstance().insert("insert_one_new_shut", smsm);
							}
							
							
							if (client.getServerid() == 0) {
								Mlt mt = Constant.messageMap.get(client.getMark());
								if (mt != null) {
									mymsg = new MyMsg();
									mymsg.msg = msg;
									mymsg.sendkey = log.getSendkey();
									mt.allmsg.add(mymsg);
								}
							}
						}
					}
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);
	
		content = jsons.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCids() {
		return cids;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}