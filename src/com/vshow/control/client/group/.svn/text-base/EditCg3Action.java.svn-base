package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class EditCg3Action implements Action{
	

    private String info;
	private int cg3id;       //三级分组id
	private String cg3name;  //三级分组名
	private int cg2id;       //二级分组修改id

	@Override
	public String execute() throws Exception {
	     //获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 
		 
		 ClientGroup3 cg3=new ClientGroup3();
		 cg3.setG2id(cg2id);
		 cg3.setG3name(cg3name);
		 cg3.setId(cg3id);
		
		 SqlConnect.getSqlMapInstance().update("update_cg3",cg3);
		 LogHandle.insertTheLog(LogType.type83, urid,Constant.LOCAL.getA00242()+"[3]:" + cg3name, 1,1);
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



	public int getCg3id() {
		return cg3id;
	}



	public void setCg3id(int cg3id) {
		this.cg3id = cg3id;
	}



	public String getCg3name() {
		return cg3name;
	}



	public void setCg3name(String cg3name) {
		this.cg3name = cg3name;
	}

	

	
}
