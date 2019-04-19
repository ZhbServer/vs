package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToEditCgAction implements Action {

	private String tid;
	private String lid;
	private String cgname;

	@Override
	public String execute() throws Exception {
		cgname = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_cg_gname", Integer.parseInt(tid));
		return SUCCESS;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCgname() {
		return cgname;
	}

	public void setCgname(String cgname) {
		this.cgname = cgname;
	}

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid;
	}

}
