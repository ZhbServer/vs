package com.vshow.control.zdy.item.interact;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.InteractItemGroup;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxInteractItemAddCheckAction implements Action {

	private String igname;
	private String tid;
	private String info;

	@Override
	public String execute() throws Exception {

		// 获取当前用户
		int urid = (Integer) ActionContext.getContext().getSession()
				.get("urid");
		InteractItemGroup cg = new InteractItemGroup();
		cg.setUserid(urid);
		cg.setName(igname);
		Integer oldcount = (Integer) SqlConnect.getSqlMapInstance()
				.queryForObject("check_iitgname", cg);
		if (oldcount > 0) {
			info = "1";
		} else {
			info = "0";
		}
		return GsonUtil.getGson(info);
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getIgname() {
		return igname;
	}

	public void setIgname(String igname) {
		this.igname = igname;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

}
