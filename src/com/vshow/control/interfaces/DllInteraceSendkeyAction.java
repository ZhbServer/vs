package com.vshow.control.interfaces;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.tools.ant.taskdefs.Sleep;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDataSource;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class DllInteraceSendkeyAction extends ActionSupport {
	
	private String sendkey;
	
	private int opt;   //正常播放[接收成功]   //无节目或者节目没有添加插件[接收成功]
	


	Logger logger  =  Logger.getLogger(DllInteraceSendkeyAction.class);
	
	
	@Override
	public String execute() throws Exception {
	
		
		logger.info("接收插件接口sendkey数据信息:");
		
		logger.info("sendkey:"+sendkey);
		
		logger.info("opt:"+opt);
		
		if(sendkey!=null&&!sendkey.equals("")){
			
			Constant.dllMapCheck.put(sendkey, opt);	
		
		}
		
		return SUCCESS;
	}
	
	

	public int getOpt() {
		return opt;
	}

	public void setOpt(int opt) {
		this.opt = opt;
	}

	public String getSendkey() {
		return sendkey;
	}

	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}

	

	
}
