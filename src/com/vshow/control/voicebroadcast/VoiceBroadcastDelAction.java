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

public class VoiceBroadcastDelAction extends ActionSupport {
	

	
	private int[] qx;
	
	@Override
	public String execute() throws Exception {
		
		//获取当前用户的所有编号
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		VoiceBroadcast vb;
		String logContent="";
		for (int i = 0; i < qx.length; i++) {
			vb=(VoiceBroadcast)sm.queryForObject("sel_voicebroadcast_id_all_property", qx[i]);
			if(vb!=null){
				if(logContent.length()==0){
					logContent=vb.getNumberstr()+"";
				}else{
					logContent=logContent+","+vb.getNumberstr();
				}
			}
			
			sm.delete("del_voicebroadcast_id", qx[i]);
		}
		
		
		
		
		
		LogHandle.insertTheLog(LogType.type99, uid,Constant.LOCAL.getA00703()+"["+Constant.LOCAL.getA00025()+":"+ logContent +"]", 1,1);
		
		
		
		
		
		return SUCCESS;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}

	
	

	


	
}
