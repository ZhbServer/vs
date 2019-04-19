package com.vshow.control.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.data.UserTree;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxZTreeRootAction extends ActionSupport {

	private List<UserTree> users;
	private String ztree;
	
	private int urid;  //用户id
	  
	  


	public String execute() throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		//int urid = (Integer) session.get("urid");
		//String urname = (String) session.get("urname");
		
		String urname="";
		
        User checkUser=(User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id", urid);
		
		if(checkUser==null){
			 
			 urid = (Integer) session.get("urid");
			 urname = (String) session.get("urname");
			 
		}else{
			
			 urid=checkUser.getId();
			 urname=checkUser.getName();
		}
		
		
		
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

		JSONArray jsons=JSONArray.fromObject(users);
		
		map.put("userlist", jsons.toString());
		
		return  GsonUtil.getGson(map);
	}

	public List<UserTree> getUsers() {
		return users;
	}

	public void setUsers(List<UserTree> users) {
		this.users = users;
	}

	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
	}
	
	public int getUrid() {
		return urid;
	}

	public void setUrid(int urid) {
		this.urid = urid;
	}
}
