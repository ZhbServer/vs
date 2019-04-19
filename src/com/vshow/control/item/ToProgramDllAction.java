package com.vshow.control.item;

import com.opensymphony.xwork.ActionSupport;

public class ToProgramDllAction extends ActionSupport {
	
	private String jsonStr;
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	public String getJsonStr() {
		return jsonStr;
	}
	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}
}
