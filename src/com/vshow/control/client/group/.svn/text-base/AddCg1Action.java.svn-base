package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddCg1Action implements Action{
	
	private String cg1name;
    private String info;
	

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 String urname= (String)  ActionContext.getContext().getSession().get("urname");
		 ClientGroup cg=new ClientGroup();
		 cg.setUid(urid);
		 cg.setGname(cg1name);
		 cg.setLevel(1);
		 cg.setPid(0);
		 Integer cgroupId=(Integer)SqlConnect.getSqlMapInstance().insert("add_cg",cg);
		 cg.setId(cgroupId);
		 cg.setTkey(cgroupId+"_");
		 SqlConnect.getSqlMapInstance().update("update_cg_tkey", cg);
		 
		 LogHandle.insertTheLog(LogType.type82, urid,Constant.LOCAL.getA00241()+"[1]:" + cg1name, 1,1);
		 
		 info="1";
		 return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getCg1name() {
		return cg1name;
	}

	public void setCg1name(String cg1name) {
		this.cg1name = cg1name;
	}

}
