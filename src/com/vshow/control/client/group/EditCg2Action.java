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

public class EditCg2Action implements Action{
	

    private String info;
	private int cg2id;       //二级分组id
	private String cg2name;  //二级分组名
	private int cg1id;       //一级分组修改id

	@Override
	public String execute() throws Exception {
	     //获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 ClientGroup cg1=(ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id", cg1id);
		 
		 
		 ClientGroup cg2=new ClientGroup();
		 cg2.setPid(cg1id);
		 cg2.setTkey(cg1.getTkey()+cg2id+"_");
		 cg2.setGname(cg2name);
		 cg2.setId(cg2id);
		 SqlConnect.getSqlMapInstance().update("update_cg_pidtkey",cg2);
		 LogHandle.insertTheLog(LogType.type83, urid,Constant.LOCAL.getA00242()+"[2]:" + cg2name, 1,1);
		 info="1";
		 return SUCCESS;
	}

	

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getCg2id() {
		return cg2id;
	}

	public void setCg2id(int cg2id) {
		this.cg2id = cg2id;
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

	
}
