package com.vshow.control.voicebroadcast;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.VoiceBroadcast;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class VoiceBroadcastAddAction extends ActionSupport {
	
	private int numberstr;
	private String voiceFileName;
	
	private int voicebid;
   
	private String info;
	
	@Override
	public String execute() throws Exception {
		
		//获取当前用户的所有编号
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		VoiceBroadcast vb=new VoiceBroadcast();
		vb.setNumberstr(numberstr);
		vb.setResourcefilename(voiceFileName);
		vb.setUid(uid);
		
		String logContent="";
		if(voicebid==0){
			logContent=Constant.LOCAL.getA00021();
			sm.insert("insert_voicebroadcast", vb);	
		}else{
			logContent=Constant.LOCAL.getA00017()+":"+numberstr;
			vb.setId(voicebid);
			sm.update("update_voicebroadcast", vb);
		}
		
		LogHandle.insertTheLog(LogType.type99, uid,Constant.LOCAL.getA00703()+"["+ logContent +"]", 1,1);
		
		
		
		info="update";
		
		return SUCCESS;
	}

	
	
	public int getVoicebid() {
		return voicebid;
	}



	public void setVoicebid(int voicebid) {
		this.voicebid = voicebid;
	}
	
	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}



	

	public int getNumberstr() {
		return numberstr;
	}



	public void setNumberstr(int numberstr) {
		this.numberstr = numberstr;
	}



	public String getVoiceFileName() {
		return voiceFileName;
	}

	public void setVoiceFileName(String voiceFileName) {
		this.voiceFileName = voiceFileName;
	}
	
	
	


	
}
