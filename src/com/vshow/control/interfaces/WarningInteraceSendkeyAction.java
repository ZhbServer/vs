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

public class WarningInteraceSendkeyAction extends ActionSupport {
	
	private String sendkey;
	
	private int opt;   //1正常播放     0 无预警节目
	


	Logger logger  =  Logger.getLogger(WarningInteraceSendkeyAction.class);
	
	
	@Override
	public String execute() throws Exception {
	
		
		logger.info("接收电梯接口sendkey数据信息:");
		
		logger.info("sendkey:"+sendkey);
		
		logger.info("opt:"+opt);
		
         
		if(sendkey!=null&&!sendkey.equals("")){
			
			Constant.warningMapCheck.put(sendkey, opt);	
		
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
