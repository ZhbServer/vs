package com.vshow.control.sucai;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.SqlConnect;

public class UpSCNameAction extends ActionSupport {
	private int id;
	private String scname;
	
	@Override
	public String execute() throws Exception {
		
		Sucai su=new Sucai();
		su.setId(id);
		su.setName(scname);
		//修改终端名称
		SqlConnect.getSqlMapInstance().update("up_id_scname", su);
		
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
