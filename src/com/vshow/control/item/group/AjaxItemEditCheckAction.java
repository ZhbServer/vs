package com.vshow.control.item.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxItemEditCheckAction implements Action {

	private String igname;
	private String info;

	@Override
	public String execute() throws Exception {

		// 获取当前用户
		int urid = (Integer) ActionContext.getContext().getSession()
				.get("urid");
		ItemGroup cg = new ItemGroup();
		cg.setName(igname);
		cg.setUserid(urid);
		Integer oldcount = (Integer) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_ig_gname", cg);
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

}
