package com.vshow.control.zdy.item.interact;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToEditIitgAction implements Action {

	private String itemgid;
	private String uscgname;

	@Override
	public String execute() throws Exception {
		uscgname = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_iitg_gid", Integer.parseInt(itemgid));
		return SUCCESS;
	}

	public String getItemgid() {
		return itemgid;
	}

	public void setItemgid(String itemgid) {
		this.itemgid = itemgid;
	}

	public String getUscgname() {
		return uscgname;
	}

	public void setUscgname(String uscgname) {
		this.uscgname = uscgname;
	}

}
