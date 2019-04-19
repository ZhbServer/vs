package com.vshow.control.interfaces;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.util.DataUtil;
import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;

import com.vshow.control.data.Result;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class SendInteractClientsAction extends ActionSupport {

    private String account;   //登录名
	
	private String password;  //密码
	
	private String content; // 返回内容



	Log logger = LogFactory.getLog(SendInteractClientsAction.class);



	@Override
	public String execute() throws Exception {

		
		String info = "";
		String code = "00000"; // 00000发送成功 00001 标识码不能为空 00002终端不存在 00003参数不合法 00004 终端未认证 00005终端未接受00006账户或者密码错误 00007文件不合法
		boolean flag = false;
		Map map=new HashMap<String, String>();
		
		//验证用户
		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_check_user_login", usparam);
		
		if (user == null) {
			code = "00006";
			info = "账户或者密码错误";
		}else{
			
			User tuser=new User();
			tuser.setId(user.getId());
			tuser.setZxstate(1);
			int onclient=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_onclient_zxstate_count_rj", tuser);
			map.put("onclient", onclient);
			tuser.setZxstate(0);
			int offclient=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_onclient_zxstate_count_rj", tuser);
			map.put("offclient", offclient);
			
		}
		
		map.put("code", code);
		
		map.put("info", info);
		
        JSONArray jsons1 = JSONArray.fromObject(map);
        
		content = jsons1.toString();
		
		return SUCCESS;
		
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public Log getLogger() {
		return logger;
	}

	public void setLogger(Log logger) {
		this.logger = logger;
	}

	public String getContent() {
		return content;
	}

}
