package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

public class OpenAddClientAction implements Action {

	private String fuid;    //(分组id,分组类型)
	private int cgid;    //分组Id
	private int gtype;	 //分组类型	
	private String cgname; //分组名
	
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		

		cgid = Integer.parseInt(fuid.split("\\,")[0]);
		gtype = Integer.parseInt(fuid.split("\\,")[1]);
		
		if(gtype == 0){
			cgname = "全部";
		}else if(gtype == 1){
			cgname = (String) SqlConnect.getSqlMapInstance().queryForObject("sel_cg1_g1name_id", cgid);
		}else if(gtype == 2){
			cgname = (String) SqlConnect.getSqlMapInstance().queryForObject("sel_cg2_g2name_id", cgid);
		}else if(gtype == 3){
			cgname = (String) SqlConnect.getSqlMapInstance().queryForObject("sel_cg3_g3name_id", cgid);
		}
		return SUCCESS;		

	}

	public String getFuid() {
		return fuid;
	}

	public void setFuid(String fuid) {
		this.fuid = fuid;
	}

	public int getGtype() {
		return gtype;
	}

	public void setGtype(int gtype) {
		this.gtype = gtype;
	}

	public int getCgid() {
		return cgid;
	}

	public void setCgid(int cgid) {
		this.cgid = cgid;
	}

	public String getCgname() {
		return cgname;
	}

	public void setCgname(String cgname) {
		this.cgname = cgname;
	}

}
