package com.vshow.control.client.set;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientNumber;
import com.vshow.control.tool.SqlConnect;

public class ToClientUpNumberAction extends ActionSupport {
	private int cid;

	private ClientNumber clientNumber;
	@Override
	public String execute() throws Exception {
		
		//获取终端名称
		clientNumber=(ClientNumber)SqlConnect.getSqlMapInstance().queryForObject("select_clientid_all", cid);
		
		return SUCCESS;
	}
	
	
	public ClientNumber getClientNumber() {
		return clientNumber;
	}


	public void setClientNumber(ClientNumber clientNumber) {
		this.clientNumber = clientNumber;
	}


	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
