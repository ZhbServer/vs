package com.vshow.control.sucai.group;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToEditScgAction implements Action {

	private int scgid;
	private int type;
	private String uscgname;

	@Override
	public String execute() throws Exception {
		uscgname = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_scg_gid", scgid);
		return SUCCESS;
	}

	public int getScgid() {
		return scgid;
	}

	public void setScgid(int scgid) {
		this.scgid = scgid;
	}

	public String getUscgname() {
		return uscgname;
	}

	public void setUscgname(String uscgname) {
		this.uscgname = uscgname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
