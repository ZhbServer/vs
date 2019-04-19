package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddCgAction implements Action{
	
	private String cgname;
	private String tid;
	private String lid;
    private String info;
	

	@Override
	public String execute() throws Exception {
	    
		//获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 ClientGroup cg=new ClientGroup();
		 cg.setUid(urid);
		 cg.setGname(cgname);
		 cg.setLevel(Integer.parseInt(lid));
		 cg.setPid(Integer.parseInt(tid));
		 Integer cgroupId=(Integer)SqlConnect.getSqlMapInstance().insert("add_cg",cg);
		 if(tid.equals("0")){
			 cg.setId(cgroupId);
			 cg.setTkey(cgroupId+"_");
		 }else{
			 String ptkey = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_tkey",Integer.parseInt(tid));
			 cg.setId(cgroupId);
			 cg.setTkey(ptkey+cgroupId+"_");
		 }
		 SqlConnect.getSqlMapInstance().update("update_cg_tkey", cg);
		 
		 LogHandle.insertTheLog(LogType.type82, urid,Constant.LOCAL.getA00241()+"[1]:" + cgname, 1,1);
		 
		 info="1";
		 return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCgname() {
		return cgname;
	}

	public void setCgname(String cgname) {
		this.cgname = cgname;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid;
	}
	
}
