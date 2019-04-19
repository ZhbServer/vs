package com.vshow.control.sucai.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroup;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxCheckAddGroupSucaiAction implements Action{

	
	private String scgname;
	private int type;
	private String info;

	@Override
	public String execute() throws Exception {

		// 获取当前用户
		int urid = (Integer) ActionContext.getContext().getSession()
				.get("urid");
		ScGroup cg = new ScGroup();
		cg.setUserid(urid);
		cg.setName(scgname);
		cg.setType(type);
		Integer oldcount = (Integer) SqlConnect.getSqlMapInstance()
				.queryForObject("check_scgname", cg);
		if (oldcount > 0) {
			info = "1";
		} else {
			info = "0";
		}
		return GsonUtil.getGson(info);
	}

	public String getScgname() {
		return scgname;
	}

	public void setScgname(String scgname) {
		this.scgname = scgname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
}
