package com.vshow.control.zdy.item.factoryplan;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelFpItemAction implements Action {

	private int[] qx;

	private int fid;
	@Override
	public String execute() throws Exception {
		// 计划id
		for (int i = 0; i < qx.length; i++) {
			SqlConnect.getSqlMapInstance().delete("delete_factoryplan_item", qx[i]);
		}
		return SUCCESS;

	}

	
	public int getFid() {
		return fid;
	}


	public void setFid(int fid) {
		this.fid = fid;
	}


	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}

}
