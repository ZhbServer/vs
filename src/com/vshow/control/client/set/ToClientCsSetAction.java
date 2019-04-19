package com.vshow.control.client.set;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Apk;
import com.vshow.control.tool.SqlConnect;

public class ToClientCsSetAction implements Action {

	private String clientids; //终端ids
	private String cgids;     //分组ids 
	
	private List<Apk> apks;
 	
	
	@Override
	public String execute() throws Exception {
		
		apks=SqlConnect.getSqlMapInstance().queryForList("sel_apk_all");
		return SUCCESS;
	}
	
	
	public String getClientids() {
		return clientids;
	}
	public void setClientids(String clientids) {
		this.clientids = clientids;
	}
	public String getCgids() {
		return cgids;
	}
	public void setCgids(String cgids) {
		this.cgids = cgids;
	}


	public List<Apk> getApks() {
		return apks;
	}


	public void setApks(List<Apk> apks) {
		this.apks = apks;
	}
	
}
