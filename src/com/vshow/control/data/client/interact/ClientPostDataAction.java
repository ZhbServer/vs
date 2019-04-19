package com.vshow.control.data.client.interact;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.log4j.Logger;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.gson.JsonArray;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.count.CountPeople;
import com.vshow.control.count.CountPeopleDataAnalysis;
import com.vshow.control.data.ResultDownFail;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.tool.SqlConnect;

public class ClientPostDataAction extends ActionSupport {
	
	/**
	 * json 属性名
	 * 
	 * int resultStateType                执行结果类型暂时保留(详细type说明见 resultState)
	 * int protocolType                   类型   (详细type说明 见 ProtocalType)
	 * String sendkey                     协议标识
	 * String mac                         终端mark
	 * Object  protocolDownResourceList   下载列表
	 * 
	 * 
	 * protocolDownResourceList 属性
	 * 
	 * int downType        下载类型 0本机 1乐视云
	 * String fileName     文件名
	 * String downUrl      下载地址
	 * String videoUnique  乐视云下载 videoUnique
	 * String fileMd5                文件MD5 
	 * 
	 */
			
	
	
	private String reportJson;
	
	//private String reportJson="{\"protocolDownResourceList\":[{\"downType\":0,\"fileMd5\":\"\",\"fileName\":\"149921913107419.zip\",\"downUrl\":\"http://192.168.3.24:8513/149921913107419.zip\"},{\"downType\":0,\"fileMd5\":\"\",\"fileName\":\"149921909602599.mpg\",\"downUrl\":\"http://192.168.3.24:8513/149921909602599.mpg\"}],\"protocolType\":2,\"sendkey\":\"2017-07-05-11:59:04-1-7361\",\"mac\":\"38:A2:8C:AD:03:9B\"}";
	
	
	Logger logger  =  Logger.getLogger(ClientPostDataAction.class);
	@Override
	public String execute() throws Exception {
		
		logger.info("接收终端Post信息:"+reportJson);
		
		return SUCCESS;
	}
	public String getReportJson() {
		return reportJson;
	}
	public void setReportJson(String reportJson) {
		this.reportJson = reportJson;
	}
}
