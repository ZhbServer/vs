package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxGetCg2NameAction implements Action {

	private int cg1id;
	@Override
	public String execute() throws Exception {
		
		List<ClientGroup> cg2s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid", cg1id);
		return  GsonUtil.getGson(cg2s);
	}
	public int getCg1id() {
		return cg1id;
	}
	public void setCg1id(int cg1id) {
		this.cg1id = cg1id;
	}

}
