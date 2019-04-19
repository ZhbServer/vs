package com.vshow.control.user;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;


public class AdUserAction extends ActionSupport {
	private User user;
	private int fuid;
	
	public String execute() throws Exception {
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 user.setFatherid(fuid);
		 
		 if(VVersion.flagJmPwd==1){
			 user.setPassword(MD5Util.string2password(user.getPassword()));	 
		 }else{
			 user.setPassword(user.getPassword());	 
		 }
		 
		 
		 Integer cuid=(Integer)SqlConnect.getSqlMapInstance().insert("adduser2", user);
		 
	    User fatheruser = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id", fuid);
		
		
		user.setId(cuid);
		user.setTkey(fatheruser.getTkey() + user.getId() + "_");
		SqlConnect.getSqlMapInstance().update("up_user_tkey", user);
		
		LogHandle.insertTheLog(LogType.type50, urid,Constant.LOCAL.getA00705()+":" + user.getAccount(), 1,1);
			
		return SUCCESS;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getFuid() {
		return fuid;
	}
	public void setFuid(int fuid) {
		this.fuid = fuid;
	}
}
