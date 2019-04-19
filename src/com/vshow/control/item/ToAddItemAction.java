package com.vshow.control.item;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Fbl;
import com.vshow.control.tool.SqlConnect;

public class ToAddItemAction implements Action {

	private List<Fbl> fbls;
	@Override
	public String execute() throws Exception {
		fbls=SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all");
		return SUCCESS;
	}
	public List<Fbl> getFbls() {
		return fbls;
	}
	public void setFbls(List<Fbl> fbls) {
		this.fbls = fbls;
	}

}
