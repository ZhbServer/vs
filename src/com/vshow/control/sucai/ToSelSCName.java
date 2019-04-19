package com.vshow.control.sucai;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class ToSelSCName extends ActionSupport {
	private int id;
	private String scname;
	
	@Override
	public String execute() throws Exception {
		
		//获取素材名称
		scname=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_id_scname", id);
		
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getScname() {
		return scname;
	}

	public void setScname(String scname) {
		this.scname = scname;
	}

	
	
	
	
}
