package com.vshow.control.interfaces.view;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelDataAction extends ActionSupport {

	
	private int did;

	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
	
		//删除通知表
		sm.delete("del_dll_txt",did);
		
		return SUCCESS;
		
	}
	
	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

}