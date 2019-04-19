package com.vshow.control.user;

import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Power;
import com.vshow.control.tool.SqlConnect;

public class ToAddUserAction extends ActionSupport {
	private List<Power> powers;   //权限集合
	private int fuid;       //上级用户ID
	private String  funame; //上级用户名
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		//int size=(Integer)SqlConnect.getSqlMapInstance().queryForObject("find_user_power",urid);
		
		//全部权限
		powers = SqlConnect.getSqlMapInstance().queryForList("sel_power_all");
		
		//上级用户名
		funame=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_user_name_id",fuid);
		return SUCCESS;		
	}
	
	public List<Power> getPowers() {
		return powers;
	}
	public void setPowers(List<Power> powers) {
		this.powers = powers;
	}

	public int getFuid() {
		return fuid;
	}

	public void setFuid(int fuid) {
		this.fuid = fuid;
	}

	public String getFuname() {
		return funame;
	}

	public void setFuname(String funame) {
		this.funame = funame;
	}

	
}
