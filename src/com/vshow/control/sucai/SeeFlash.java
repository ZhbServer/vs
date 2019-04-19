package com.vshow.control.sucai;

import java.io.File;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;

public class SeeFlash implements Action {

	private String fname;

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String execute() throws Exception {
		
		return SUCCESS;
	}

}
