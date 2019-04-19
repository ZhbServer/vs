package com.vshow.control.kh.queue;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.BindBig;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdQueueBindWinAction implements Action {

	private String point;
	private String name;
	private String win;
	private int bindcid;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
        Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		BindBig bb=new BindBig();
		bb.setCid(bindcid);
		bb.setName(name);
		bb.setPoint(point);
		bb.setWin(win);
		bb.setUid(uid);
		SqlConnect.getSqlMapInstance().insert("add_bindwin",bb);
		LogHandle.insertTheLog(LogType.type92, uid,Constant.LOCAL.getA00706()+":" +name, 1,1);
		return SUCCESS;
	}
	
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	
	public int getBindcid() {
		return bindcid;
	}
	public void setBindcid(int bindcid) {
		this.bindcid = bindcid;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
