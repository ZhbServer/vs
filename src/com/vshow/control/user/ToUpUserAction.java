package com.vshow.control.user;

import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

public class ToUpUserAction extends ActionSupport {
	private List<Power> powers;   //权限集合
	private int fuid;       //上级用户ID
	private String  funame; //上级用户名
	private int suid;       //选择用户ID  
	private User showuser;      //用户显示信息
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		//int size=(Integer)SqlConnect.getSqlMapInstance().queryForObject("find_user_power",urid);
		
		//全部权限
		powers = SqlConnect.getSqlMapInstance().queryForList("sel_power_all");
		
		//当前用户详细信息
		showuser=(User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id",suid);
		
		//上级用户名
		funame=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_user_name_id",showuser.getFatherid());
		
		
		
		return SUCCESS;		
	}
	
	public int getSuid() {
		return suid;
	}

	public void setSuid(int suid) {
		this.suid = suid;
	}

	public User getShowuser() {
		return showuser;
	}

	public void setShowuser(User showuser) {
		this.showuser = showuser;
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
