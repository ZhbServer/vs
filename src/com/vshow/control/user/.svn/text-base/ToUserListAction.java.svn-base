package com.vshow.control.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.data.UserTree;
import com.vshow.control.tool.SqlConnect;

public class ToUserListAction extends ActionSupport {

	private List<UserTree> users;
	private int totalpeople;

	private List<User> userssonlist;
	private String ztree;
	
	private String cidsstr; // 已选终端id,多个以"_"隔开
	
	private String urname;  //用户名
	
	private String checkUserName;  //搜索用户名

    private int urid;  //用户id

	


	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		String tkey=(String) session.get("urtkey");
		
		User checkUser=new User();
		
		checkUser.setName(checkUserName);
		
		checkUser.setTkey(tkey);
		
		checkUser=(User)SqlConnect.getSqlMapInstance().queryForObject("sel_users_like_name", checkUser);
		
		if(checkUser==null){
			 urid = (Integer) session.get("urid");
			 urname = (String) session.get("urname");
		}else{
			 urid=checkUser.getId();
			 urname=checkUser.getName();
			 
		}
		
		//int urid = (Integer) session.get("urid");
		//urname = (String) session.get("urname");
		User su = new User();
		su.setId(urid);
		su.setTkey(urid + "_");

		users = new ArrayList<UserTree>();
		UserTree ut = new UserTree();
		ut.setId(String.valueOf(urid));
		ut.setName(urname);
		ut.setPid("0");
		List<User> userlist = (List<User>) SqlConnect.getSqlMapInstance().queryForList("sel_users_tkey", su);
		if (userlist.size() > 0) {
			ut.setIsParent("true");
		} else {
			ut.setIsParent("false");
		}
		ut.setClick("showsonlist(" + urid + ")");
		users.add(ut);

		JSONArray jsons = JSONArray.fromObject(users);
		ztree = jsons.toString();
		// 获取当前用户下 一级子用户
		userssonlist = (List<User>) SqlConnect.getSqlMapInstance().queryForList("sel_user_son_list1", urid);
		
		return SUCCESS;
	}

	public int getUrid() {
		return urid;
	}


	public void setUrid(int urid) {
		this.urid = urid;
	}
	
	public String getCheckUserName() {
		return checkUserName;
	}

	public void setCheckUserName(String checkUserName) {
		this.checkUserName = checkUserName;
	}
	
	
	public String getUrname() {
		return urname;
	}

	public void setUrname(String urname) {
		this.urname = urname;
	}

	public List<User> getUserssonlist() {
		return userssonlist;
	}

	public void setUserssonlist(List<User> userssonlist) {
		this.userssonlist = userssonlist;
	}

	public List<UserTree> getUsers() {
		return users;
	}

	public void setUsers(List<UserTree> users) {
		this.users = users;
	}

	public int getTotalpeople() {
		return totalpeople;
	}

	public void setTotalpeople(int totalpeople) {
		this.totalpeople = totalpeople;
	}

	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
	}

	public String getCidsstr() {
		return cidsstr;
	}

	public void setCidsstr(String cidsstr) {
		this.cidsstr = cidsstr;
	}
	
}
