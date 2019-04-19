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
import com.vshow.control.data.Item;
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

public class DllInteraceSendkeyClientInfoAction extends ActionSupport {
	
	private String sendkey;
	
    private String playFileName;  //播放文件名
    
    private int vol;   //音量
    
    private int emergencyArea;   //应急区有无播放内容  0无 1有 2无应急区

	Logger logger  =  Logger.getLogger(DllInteraceSendkeyClientInfoAction.class);
	
	
	@Override
	public String execute() throws Exception {
	
		
		logger.info("接收插件接口sendkey数据信息:");
		
		logger.info("sendkey:"+sendkey);
		logger.info("playFileName:"+playFileName);
		logger.info("vol:"+vol);
		logger.info("emergencyArea:"+emergencyArea);
		
		
		
		if(sendkey!=null&&!sendkey.equals("")){
			
			Map map=new HashMap<String, Object>();
			
			if(playFileName==null||playFileName.equals("")){
				
				map.put("playName", "暂无节目播放");
				
			}else{
				
				map.put("playFileName", playFileName);
				
				Item item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_filename", playFileName);
				
				if(item==null){
					map.put("playName", "当前节目未在服务器");
				}else{
					map.put("playName", item.getName());
				}
			}
			
			map.put("vol", vol);
			
			map.put("emergencyArea", emergencyArea);
			
			Constant.dllMapInfo.put(sendkey, map);	
		
		}
		
		return SUCCESS;
	}
	

	public String getPlayFileName() {
		return playFileName;
	}


	public void setPlayFileName(String playFileName) {
		this.playFileName = playFileName;
	}

	public int getVol() {
		return vol;
	}

	public void setVol(int vol) {
		this.vol = vol;
	}

	public int getEmergencyArea() {
		return emergencyArea;
	}

	public void setEmergencyArea(int emergencyArea) {
		this.emergencyArea = emergencyArea;
	}


	public String getSendkey() {
		return sendkey;
	}

	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}

	
}
