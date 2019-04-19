package com.vshow.control.index;

import java.util.Arrays;


import com.opensymphony.xwork.ActionSupport;




import com.vshow.control.tool.SqlConnect;

public class ClearNoenterClientAction extends ActionSupport {
	private int qx[];

	@Override
	public String execute() throws Exception {
		
		String qxString=Arrays.toString(qx);
		qxString=qxString.replace("[","");
		qxString=qxString.replace("]","");
		
		SqlConnect.getSqlMapInstance().delete("del_allmark", qxString);
		
		return SUCCESS;
	}
	public int[] getQx() {
		return qx;
	}
	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
