package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class EditCg1Action implements Action{
	
	private String cg1name;
    private String info;
	private int gid;

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 String urname= (String)  ActionContext.getContext().getSession().get("urname");
		 ClientGroup cg1=new ClientGroup();
		 cg1.setUid(urid);
		 cg1.setGname(cg1name);
		 cg1.setId(gid);
		 SqlConnect.getSqlMapInstance().update("update_cg",cg1);
		 LogHandle.insertTheLog(LogType.type83, urid,Constant.LOCAL.getA00242()+"[1]:" + cg1name, 1,1);
		 info="1";
		 return SUCCESS;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getCg1name() {
		return cg1name;
	}

	public void setCg1name(String cg1name) {
		this.cg1name = cg1name;
	}

}
