package com.vshow.control.kh.queue;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelQueueBigAction extends ActionSupport {
	
	
	private int[] qx;
	
	@Override
	public String execute() throws Exception {
		for (int i = 0; i < qx.length; i++) {
			SqlConnect.getSqlMapInstance().delete("del_bindbig",qx[i]);
		}
		return SUCCESS;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
