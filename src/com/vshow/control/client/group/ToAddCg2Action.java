package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.tool.SqlConnect;

public class ToAddCg2Action implements Action {

	private List<ClientGroup> cg1s;

	@Override
	public String execute() throws Exception {

		// 获取当前用户
		int urid = (Integer) ActionContext.getContext().getSession()
				.get("urid");

		ClientGroup cg = new ClientGroup();
		cg.setUid(urid);
		cg.setLevel(1);
		cg1s = SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level",
				cg);
		return SUCCESS;
	}

	public List<ClientGroup> getCg1s() {
		return cg1s;
	}

	public void setCg1s(List<ClientGroup> cg1s) {
		this.cg1s = cg1s;
	}

}
