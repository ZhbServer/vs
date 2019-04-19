package com.vshow.control.user;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.data.UserCheck;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class UpUserAction extends ActionSupport {
	
	private User user;
	
	private String info;
	
	public String execute() throws Exception {
		
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		 SqlConnect.getSqlMapInstance().update("up_user_property_up2", user);
		
		 LogHandle.insertTheLog(LogType.type51, urid,Constant.LOCAL.getA00234()+":" + user.getAccount(), 1,1);
		 
		 if(user.getBan()==0){
			 UserCheck uc=new UserCheck();
			 uc.setAccount(user.getAccount());
			 uc.setFailState(0);
			 SqlConnect.getSqlMapInstance().update("up_user_check", uc);
		 }
		 
		 info=user.getFatherid()+"";
		 
		 return SUCCESS;
	}
	
	
	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
