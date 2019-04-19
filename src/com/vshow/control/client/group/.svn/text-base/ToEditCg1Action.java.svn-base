package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToEditCg1Action implements Action {

	private int gid;
	private String cg1name;
	
	@Override
	public String execute() throws Exception {
		cg1name=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_gname", gid);
		return SUCCESS;
	}
	
	



	public String getCg1name() {
		return cg1name;
	}





	public void setCg1name(String cg1name) {
		this.cg1name = cg1name;
	}





	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	
	

}
