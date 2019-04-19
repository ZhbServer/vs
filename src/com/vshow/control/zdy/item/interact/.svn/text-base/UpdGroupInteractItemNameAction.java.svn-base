package com.vshow.control.zdy.item.interact;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItemGroup;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ScGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class UpdGroupInteractItemNameAction extends ActionSupport {

	private String uscgname;
	private int itemgid;
	private String info;

	private int id; // 当前页数
	private int pagetype = 9; // 页码类型(9,20,30)

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");

		InteractItemGroup scg = new InteractItemGroup();
		scg.setId(itemgid);
		scg.setName(uscgname);
		SqlConnect.getSqlMapInstance().update("upd_interactitemgroup_name_id", scg);

		LogHandle.insertTheLog(LogType.type4, urid, Constant.LOCAL.getA00390()
				+ ":" + uscgname, 1, 1);

		info = uscgname;
		return SUCCESS;
	}

	public void setUscgname(String uscgname) {
		this.uscgname = uscgname;
	}

	public int getItemgid() {
		return itemgid;
	}

	public void setItemgid(int itemgid) {
		this.itemgid = itemgid;
	}

	public String getUscgname() {
		return uscgname;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
}
