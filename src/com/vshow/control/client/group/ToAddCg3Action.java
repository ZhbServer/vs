package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.tool.SqlConnect;

public class ToAddCg3Action implements Action {

	
	private List<ClientGroup> cg1s;
	private List<ClientGroup> cg2s;
	@Override
	public String execute() throws Exception {
		
		//获取当前用户
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		ClientGroup cg1=new ClientGroup();
		cg1.setUid(urid);
		cg1.setLevel(1);
		cg1s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level", cg1);
		if(cg1s.size()>0){
			
			cg2s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid", cg1s.get(0).getId());
		}
		return SUCCESS;
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
	
	
	
}
