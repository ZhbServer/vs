package com.vshow.control.client.set;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.tool.LanSend;

public class SendBroadcastAction implements Action {

	private String ip;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		//session.put("url", "client.vs");
		LanSend.sendIpMsg(ip);
		return SUCCESS;
	}
	
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

}
