package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class EditCgAction implements Action{
	
	private String cgname;
    private String info;
	private String tid;

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 ClientGroup cg1=new ClientGroup();
		 cg1.setUid(urid);
		 cg1.setGname(cgname);
		 cg1.setId(Integer.parseInt(tid));
		 SqlConnect.getSqlMapInstance().update("update_cg",cg1);
		 LogHandle.insertTheLog(LogType.type83, urid,Constant.LOCAL.getA00242()+"[1]:" + cgname, 1,1);
		 info=cgname;
		 return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCgname() {
		return cgname;
	}

	public void setCgname(String cgname) {
		this.cgname = cgname;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

}
