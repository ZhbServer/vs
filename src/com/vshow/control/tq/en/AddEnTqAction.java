package com.vshow.control.tq.en;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Tq;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddEnTqAction implements Action {
	
	private Tq tq;

	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		tq.setCode(tq.getCitykey());
		tq.setCity(tq.getCitykey());
		tq.setType(1);
		SqlConnect.getSqlMapInstance().insert("add_tq_en", tq);
		EnTqxml tx = new EnTqxml();
		try {
			tx.doTq();
		} catch (Exception e) {

		}
		LogHandle.insertTheLog(LogType.type61, urid,Constant.LOCAL.getA00186()+":" + tq.getCity(), 1,1);
		return SUCCESS;
	}
	
	public Tq getTq() {
		return tq;
	}



	public void setTq(Tq tq) {
		this.tq = tq;
	}

}
