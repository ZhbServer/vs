package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxDelJhItemAction implements Action {

	private int jhitemid; // 计划明细id
	private String info = "0";

	@Override
	public String execute() throws Exception {

		try {
			SqlConnect.getSqlMapInstance().delete("del_jh_item", jhitemid);
		} catch (Exception e) {
			// TODO: handle exception 
			info = "1";
		}
		
		return GsonUtil.getGson(info);
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getJhitemid() {
		return jhitemid;
	}

	public void setJhitemid(int jhitemid) {
		this.jhitemid = jhitemid;
	}

}
