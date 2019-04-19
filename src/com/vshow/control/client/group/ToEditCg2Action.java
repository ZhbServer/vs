package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.tool.SqlConnect;

public class ToEditCg2Action implements Action {

	private int gid;          //二级分组id
	private List<ClientGroup> cg1s;     //一级分组集合
	private ClientGroup cg2;
	
	@Override
	public String execute() throws Exception {
		
		//获取当前用户的所有一级分组
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		ClientGroup cg1=new ClientGroup();
		cg1.setLevel(1);
		cg1.setUid(urid);
		cg1s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level", cg1);
		//获取当前分组下的二级分组属性
		cg2=(ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id", gid);
		return SUCCESS;
	}
	
	


	


	

	public List<ClientGroup> getCg1s() {
		return cg1s;
	}









	public void setCg1s(List<ClientGroup> cg1s) {
		this.cg1s = cg1s;
	}









	public ClientGroup getCg2() {
		return cg2;
	}









	public void setCg2(ClientGroup cg2) {
		this.cg2 = cg2;
	}









	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	
	

}
