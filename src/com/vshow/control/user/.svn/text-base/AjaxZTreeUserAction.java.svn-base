package com.vshow.control.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.User;
import com.vshow.control.data.UserTree;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxZTreeUserAction extends ActionSupport {
	private String uid;
	private String type;
	private List<UserTree> userlist;
	
	public String execute() throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		User su = new User();
		su.setId(Integer.parseInt(uid));
		
		userlist = new ArrayList<UserTree>();
		List<UserTree> utlist = (List<UserTree>) SqlConnect.getSqlMapInstance().queryForList("sel_users_tkey_tree", su);
		UserTree ut;
		for (int i = 0; i < utlist.size(); i++) {
			ut=new UserTree();
			ut.setId(utlist.get(i).getId());
			ut.setPid(utlist.get(i).getPid());
			ut.setName(utlist.get(i).getName());
			ut.setClick("showsonlist("+ut.getId()+")");
			User u = new User();
			u.setId(Integer.parseInt(ut.getId()));
			u.setTkey(uid+"_"+ut.getId()+"_");
			List<User> sonlist = (List<User>) SqlConnect.getSqlMapInstance()
			.queryForList("sel_users_tkey", u);
			if(sonlist.size()>0){
				ut.setIsParent("true");
			}else{
				ut.setIsParent("fasle");
			}
			userlist.add(ut);
		}
		
		JSONArray jsons=JSONArray.fromObject(userlist);
		map.put("userlist", jsons.toString());
		
		return  GsonUtil.getGson(map);
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<UserTree> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<UserTree> userlist) {
		this.userlist = userlist;
	}
	
}
