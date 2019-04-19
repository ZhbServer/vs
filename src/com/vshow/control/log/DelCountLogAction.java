package com.vshow.control.log;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelCountLogAction extends ActionSupport {
	
	
	private int[] qx;
	
	@Override
	public String execute() throws Exception {
		for (int i = 0; i < qx.length; i++) {
			SqlConnect.getSqlMapInstance().delete("del_log_id",qx[i]);
		}
		return SUCCESS;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
