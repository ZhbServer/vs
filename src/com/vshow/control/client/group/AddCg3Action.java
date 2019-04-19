package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddCg3Action implements Action{
	
	private String cg3name;
    private String info;
	private int cg2id;

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 String urname= (String)  ActionContext.getContext().getSession().get("urname");
		 
		 ClientGroup cg2=(ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id", cg2id);
		 ClientGroup cg3=new ClientGroup();
		 cg3.setUid(urid);
		 cg3.setGname(cg3name);
		 cg3.setPid(cg2.getId());
		 cg3.setLevel(3);
		 Integer cgroupId=(Integer)SqlConnect.getSqlMapInstance().insert("add_cg",cg3);
		 cg2.setId(cgroupId);
		 cg2.setTkey(cg2.getTkey()+cgroupId+"_");
		 SqlConnect.getSqlMapInstance().update("update_cg_tkey", cg2);
		 
		 
		 
		 LogHandle.insertTheLog(LogType.type82, urid,Constant.LOCAL.getA00241()+"[3]:" + cg3name, 1,1);
		 info="1";
		 return SUCCESS;
	}

	

	public String getCg3name() {
		return cg3name;
	}



	public void setCg3name(String cg3name) {
		this.cg3name = cg3name;
	}



	public int getCg2id() {
		return cg2id;
	}



	public void setCg2id(int cg2id) {
		this.cg2id = cg2id;
	}



	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	

}
