package com.vshow.control.sucai;

import java.io.File;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;

public class SeeImgBi implements Action {

	private String fname;

	private String seewidth="678.5";
	private String seeheight="526.5";
	public String getSeewidth() {
		return seewidth;
	}

	public void setSeewidth(String seewidth) {
		this.seewidth = seewidth;
	}

	public String getSeeheight() {
		return seeheight;
	}

	public void setSeeheight(String seeheight) {
		this.seeheight = seeheight;
	}

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
