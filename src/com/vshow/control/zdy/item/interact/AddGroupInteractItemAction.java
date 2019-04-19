package com.vshow.control.zdy.item.interact;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItemGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddGroupInteractItemAction extends ActionSupport {

	private String itemgname; // 分组名
	private String info;
	private int pagetype; // 显示页数类型

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		InteractItemGroup itg = new InteractItemGroup();
		itg.setName(itemgname);

		int urid = (Integer) session.get("urid");
		itg.setUserid(urid);

		SqlConnect.getSqlMapInstance().insert("add_interactitem_group", itg);

		// 添加日志
		LogHandle.insertTheLog(LogType.type3, urid, Constant.LOCAL.getA00389()
				+ ":" + itg.getName(), 1, 1);
		info = "1";
		return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getItemgname() {
		return itemgname;
	}

	public void setItemgname(String itemgname) {
		this.itemgname = itemgname;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
