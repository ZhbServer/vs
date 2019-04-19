package com.vshow.control.voicebroadcast;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.VoiceBroadcast;
import com.vshow.control.tool.SqlConnect;

public class ToVoiceBroadcastEditAction extends ActionSupport {
	
	//未选择编号
	private List<Integer> noSelectNumberStr;
	
	
	private int voicebid;
	
	private VoiceBroadcast vb;
	
	@Override
	public String execute() throws Exception {
		
		
		//获取当前用户的所有编号
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		List<Integer> selectNumberstrList= sm.queryForList("sel_voicebroadcast_numberstr", uid);
		
		noSelectNumberStr=getNumber1_255(selectNumberstrList);
		
		
		if(voicebid!=0){
			vb=(VoiceBroadcast)sm.queryForObject("sel_voicebroadcast_id_all_property", voicebid);
			
		}
		
		return SUCCESS;
	}
	
	
	
	public static List<Integer> getNumber1_255(List<Integer> selectNumberstrList){
		 
		 List<Integer> noSelectNumberStr=new ArrayList<Integer>();
		 int number16=0;
		 for (int i = 1; i <256; i++) {
			 boolean number16flag=false;
			 
			 number16=i;
			 for (int j = 0; j < selectNumberstrList.size(); j++) {
				if(number16==selectNumberstrList.get(j)){
					number16flag=true;
				}
			 }
			 if(!number16flag){
				 noSelectNumberStr.add(number16);
				 
			 }
			 
		 }
		 return noSelectNumberStr;
	}
	

	public int getVoicebid() {
		return voicebid;
	}

	public List<Integer> getNoSelectNumberStr() {
		return noSelectNumberStr;
	}



	public void setNoSelectNumberStr(List<Integer> noSelectNumberStr) {
		this.noSelectNumberStr = noSelectNumberStr;
	}



	public void setVoicebid(int voicebid) {
		this.voicebid = voicebid;
	}


	public VoiceBroadcast getVb() {
		return vb;
	}


	public void setVb(VoiceBroadcast vb) {
		this.vb = vb;
	}


}
