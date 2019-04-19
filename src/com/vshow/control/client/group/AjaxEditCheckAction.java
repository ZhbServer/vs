package com.vshow.control.client.group;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxEditCheckAction implements Action{
	
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
		 Integer oldcount=(Integer)SqlConnect.getSqlMapInstance().queryForObject("check_edit_cgname",cg);
		 if(oldcount > 0){
			 info="1";
		 }else{
			 info="0";
		 }
		 return GsonUtil.getGson(info);
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