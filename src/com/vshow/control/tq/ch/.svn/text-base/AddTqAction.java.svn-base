package com.vshow.control.tq.ch;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Tq;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddTqAction implements Action {
	private Tq tq;

	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
	    tq.setCode(tq.getCity());
	    //判断天气存在不存在,存在则跳过
		String code=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_tq_code", tq.getCode());
	    if(code==null){
	    	SqlConnect.getSqlMapInstance().insert("add_tq", tq);	
	    }
	    Tqxml tx = new Tqxml();
		try {
			tx.doTq();
		} catch (Exception e) {

		}
		LogHandle.insertTheLog(LogType.type61, urid,Constant.LOCAL.getA00184()+":" + tq.getCity(), 1,1);
		return SUCCESS;
	}
	
	
	
	public Tq getTq() {
		return tq;
	}



	public void setTq(Tq tq) {
		this.tq = tq;
	}

}
