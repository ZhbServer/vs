package com.vshow.control.screen;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;

public class GetScreen implements Action {

	private String fname;
	private String ttal;

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getTtal() {
		return ttal; 
	}

	public String execute() throws Exception {
		ttal=""+Constant.JIATOTAL+Constant.TOTAL;
		return SUCCESS;
	} 

}
