package com.vshow.control.projection;

import com.opensymphony.xwork.Action;

import com.vshow.control.tool.SqlConnect;

public class DelProjectionAction implements Action {
	
	private int pid;

	public String execute() throws Exception {
		
		//int urid = (Integer) ActionContext.getContext().getSession().get("urid");
		
		SqlConnect.getSqlMapInstance().delete("del_one_projection", pid);
		
		return SUCCESS;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}



	

}
