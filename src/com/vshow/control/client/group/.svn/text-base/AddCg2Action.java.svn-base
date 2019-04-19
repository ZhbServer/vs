package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddCg2Action implements Action{
	
	private String cg2name;
    private String info;
	private int cg1id;

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 String urname= (String)  ActionContext.getContext().getSession().get("urname");
		 
		 ClientGroup cg1=(ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id", cg1id);
		 
		 
		 ClientGroup cg2=new ClientGroup();
		 cg2.setUid(urid);
		 cg2.setGname(cg2name);
		 cg2.setPid(cg1.getId());
		 cg2.setLevel(2);
		 Integer cgroupId=(Integer)SqlConnect.getSqlMapInstance().insert("add_cg",cg2);
		 cg2.setId(cgroupId);
		 cg2.setTkey(cg1.getTkey()+cgroupId+"_");
		 SqlConnect.getSqlMapInstance().update("update_cg_tkey", cg2);
		 
		 
		 LogHandle.insertTheLog(LogType.type82, urid,Constant.LOCAL.getA00241()+"[2]:" + cg2name, 1,1);
		 
		 info="1";
		 
		 return SUCCESS;
	}

	public String getCg2name() {
		return cg2name;
	}

	public void setCg2name(String cg2name) {
		this.cg2name = cg2name;
	}

	public int getCg1id() {
		return cg1id;
	}

	public void setCg1id(int cg1id) {
		this.cg1id = cg1id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	

}
