package com.vshow.control.api.client.sys;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.DpSend;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendDate;
import com.vshow.control.data.SendInteract;
import com.vshow.control.data.SendTime;

import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;


/**
 * 重发执行结果
 * @param account账号
 * @param password 密码 
 * @param tid 返回结果id
 * @param rlid 重发的日志id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiResendAction implements Action {

	private String password;
	private String account;
	private String content;

	private int tid;
	private int rlid;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

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
				//获取发布的日志信息
				Log olog=(Log)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_all_id", rlid);
				if(olog!=null){
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
					String date = sf.format(new Date());
					olog.setSdate(date);
					olog.setSendkey(Constant.createSendkey(user.getId(),date));
					olog.setUrid(user.getId());
					int logid = (Integer)SqlConnect.getSqlMapInstance().insert("add_log_send",olog);
					olog.setId(logid);
					//System.out.println(olog.getMsg());
					//String osendkey=Constant.resolveSendkey(olog.getMsg());
					
					int skl_b=olog.getMsg().indexOf("sendkey!");
			        if(skl_b==-1){
			       	    skl_b=olog.getMsg().indexOf("+")+1;
			        }else{
			       	    skl_b=skl_b+8;
			        }
			        int skl_e=olog.getMsg().length();
			        
			        String nsk=olog.getMsg().substring(skl_b, skl_e);
			        
			        if(olog.getStype()==20){
			        	skl_e=nsk.indexOf("#");
				       	  
			 	        if(skl_e!=-1){
			 	      	  nsk=nsk.substring(0, skl_e);
			 	        }
			        }else{
			        	skl_e=nsk.indexOf("%");
				       	  
			 	        if(skl_e!=-1){
			 	      	  nsk=nsk.substring(0, skl_e);
			 	        }
			        	
			        }	
			        	
					olog.setMsg(olog.getMsg().replaceAll(nsk, olog.getSendkey()));
					
					SqlConnect.getSqlMapInstance().update("upd_log_send_msg", olog);
					
					int rid;
					Result oresult;
					
					MyMsg mymsg;
					//获取rid对象
					oresult=(Result)SqlConnect.getSqlMapInstance().queryForObject("sel_result_all_id", tid);
					if(oresult!=null){
						int orid=oresult.getId();
						//插入新的result结果
						oresult.setState(0);
						oresult.setLogid(olog.getId());
						rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", oresult);
						//获取终端信息
						Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", oresult.getClid());
						//判断result类型
						String msg0818;
						if(oresult.getType()==1){
							//发送给终端
				            msg0818=Constant.sendDownString(olog.getMsg(), olog.getSendkey(),null);
				            String itemids="";
				            int type=1;
				            //普通发布
				            if(oresult.getType()==1){
				            	Send sd=(Send)SqlConnect.getSqlMapInstance().queryForObject("sel_send_all_id",orid);
				            	sd.setResultid(rid);
				            	itemids=sd.getItemids();
				            	SqlConnect.getSqlMapInstance().insert("ad_send",sd);
				            	type=1;
				            }else if(oresult.getType()==2){
				            	SendInteract sd=(SendInteract)SqlConnect.getSqlMapInstance().queryForObject("sel_send_interact_all_id",orid);
				            	sd.setResultid(rid);
				            	itemids=sd.getInteractitemid()+"";
				            	SqlConnect.getSqlMapInstance().insert("insert_one_sendinteractitem",sd);
				            	type=2;
				            }else if(oresult.getType()==16){
				            	SendTime sd =(SendTime)SqlConnect.getSqlMapInstance().queryForObject("sel_send_time_all_id",orid);
				            	itemids=sd.getItemid();
				            	SqlConnect.getSqlMapInstance().insert("insert_one_timeitem",sd);
				            	type=1;
				            }else if(oresult.getType()==17){
				            	InsertSend sd =(InsertSend)SqlConnect.getSqlMapInstance().queryForObject("sel_send_insert_all_id",orid);
				            	itemids=sd.getItemid();
				            	SqlConnect.getSqlMapInstance().insert("insert_one_insertitem",sd);
				            	type=1;
				            }else if(oresult.getType()==18){
				            	DpSend sd =(DpSend)SqlConnect.getSqlMapInstance().queryForObject("sel_send_dp_all_id",orid);
				            	itemids=sd.getItemid();
				            	SqlConnect.getSqlMapInstance().insert("insert_one_dpitem",sd);
				            	type=1;
				            }else if(oresult.getType()==23){
				            	SendDate sd =(SendDate)SqlConnect.getSqlMapInstance().queryForObject("sel_send_dp_all_idz",orid);
				            	itemids=sd.getItemids();
				            	SqlConnect.getSqlMapInstance().insert("ad_send_date",sd);
				            	type=1;
				            }
				            ClientPlayHandle.insertClientPlay(itemids, type, oresult.getType(), olog.getContent(), olog.getUrid(), client.getMark(), olog.getSendkey(), 0);
						}else{
							msg0818=olog.getMsg();
						}
						
						if (client.getServerid() == 0) {
							   Mlt mt = Constant.messageMap.get(client.getMark());
							   if (mt != null) {
									mymsg = new MyMsg();
									mymsg.msg = msg0818;
									mymsg.sendkey = olog.getSendkey();
									mt.allmsg.add(mymsg);
								}
							 } 
					     }				
					code = "2";
				} else {
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

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getRlid() {
		return rlid;
	}

	public void setRlid(int rlid) {
		this.rlid = rlid;
	}
}
