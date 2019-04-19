package com.vshow.control.api.client.sys;

import java.io.File;
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
 * 唤醒
 * @param account账号
 * @param password 密码 
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiRouseAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
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
						String tname = Constant.LOCAL.getA00487();
						Log log = LogHandle.insertTheLogSend(LogType.type25, user.getId(),tname,1);
						String sendkey = log.getSendkey();
						String msg = "07+"+ sendkey ;
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
							rs.setType(ResultType.rt10);
							int rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);
							//添加指令记录
							//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
							
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

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}