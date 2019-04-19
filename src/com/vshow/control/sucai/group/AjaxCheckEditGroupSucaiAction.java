package com.vshow.control.sucai.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ScGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxCheckEditGroupSucaiAction implements Action {

	private String igname;
	private int type;
	private String info;

	@Override
	public String execute() throws Exception {

		// 获取当前用户
		int urid = (Integer) ActionContext.getContext().getSession()
				.get("urid");
		ScGroup cg = new ScGroup();
		cg.setName(igname);
		cg.setUserid(urid);
		cg.setType(type);
		Integer oldcount = (Integer) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_scg_gname", cg);
		if (oldcount > 0) {
			info = "1";
		} else {
			info = "0";
		}
		return GsonUtil.getGson(info);
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

	public String getIgname() {
		return igname;
	}

	public void setIgname(String igname) {
		this.igname = igname;
	}

}
