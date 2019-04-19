package com.vshow.control.kh.bus;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.BindBig;
import com.vshow.control.data.BindBus;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdBindBusAction implements Action {

	private String deviceId;
	private String name;
	private int bindcid;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
        Map session = ctx.getSession();
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		BindBus bb=new BindBus();
		bb.setCid(bindcid);
		bb.setName(name);
		bb.setDeviceId(deviceId);
		bb.setUid(uid);
		SqlConnect.getSqlMapInstance().insert("add_bindbus",bb);
		LogHandle.insertTheLog(LogType.type96, uid,Constant.LOCAL.getA00772()+":" +name, 1,1);
		return SUCCESS;
	}
	public int getBindcid() {
		return bindcid;
	}
	public void setBindcid(int bindcid) {
		this.bindcid = bindcid;
	}
	
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
