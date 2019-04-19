package com.vshow.control.kh.bus;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelBusAction extends ActionSupport {
	
	
	private int[] qx;
	
	@Override
	public String execute() throws Exception {
		for (int i = 0; i < qx.length; i++) {
			SqlConnect.getSqlMapInstance().delete("del_bindbus",qx[i]);
		}
		return SUCCESS;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
