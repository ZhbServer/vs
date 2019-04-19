package com.vshow.control.tq.ch;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Tq;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelTqAction implements Action {
	private int[] qx;  
	
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		Tq tq;
		for (int i = 0; i < qx.length; i++) {
			tq=(Tq)SqlConnect.getSqlMapInstance().queryForObject("g_wotq_value",qx[i]);
			SqlConnect.getSqlMapInstance().delete("del_tq", qx[i]);
			LogHandle.insertTheLog(LogType.type62, urid,Constant.LOCAL.getA00185()+":" + tq.getCity(), 1,1);
		}
		
		
		return SUCCESS;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}

}
