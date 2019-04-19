package com.vshow.control.client.set;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class ToClientUpAction extends ActionSupport {
	private int cid;
	private String cName;
	
	@Override
	public String execute() throws Exception {
		
		//获取终端名称
		cName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_id_name_client", cid);
		
		return SUCCESS;
	}
	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
