package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.tool.SqlConnect;

public class ToEditCg3Action implements Action {

	private int gid;          //三级级分组id
	private List<ClientGroup> cg1s;     //一级分组集合
	private List<ClientGroup> cg2s;     //二级分组集合
	private ClientGroup cg3;
	
	@Override
	public String execute() throws Exception {
		
		//获取当前用户的所有一级分组
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		
		//获取当前用户的所有一级分组
	
		ClientGroup cg1=new ClientGroup();
		cg1.setLevel(1);
		cg1.setUid(urid);
		cg1s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level", cg1);
		
		
		
		//获取当前用户的所有二级分组
		
		cg1.setLevel(2);
		cg2s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level",cg1);
		
		
		//获取当前分组下的二级分组属性
		cg3=(ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id", gid);
		
		
		return SUCCESS;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public List<ClientGroup> getCg1s() {
		return cg1s;
	}

	public void setCg1s(List<ClientGroup> cg1s) {
		this.cg1s = cg1s;
	}

	public List<ClientGroup> getCg2s() {
		return cg2s;
	}

	public void setCg2s(List<ClientGroup> cg2s) {
		this.cg2s = cg2s;
	}

	public ClientGroup getCg3() {
		return cg3;
	}

	public void setCg3(ClientGroup cg3) {
		this.cg3 = cg3;
	}
	
	


	



	

}
