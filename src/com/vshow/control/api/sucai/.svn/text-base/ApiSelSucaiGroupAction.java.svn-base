package com.vshow.control.api.sucai;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.Sucai;

import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 查询素材分组
 * @param account账号
 * @param password 密码 
 * @param type 素材类型
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiSelSucaiGroupAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private int type;

	private List<ScGroup> scgrouplist;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			ScGroup scg = new ScGroup();
			scg.setType(type);
			scg.setTkey(user.getTkey());
			if (user.getBan() == 0) {
				scgrouplist = (List<ScGroup>) SqlConnect.getSqlMapInstance()
						.queryForList("sc_self_group_all", scg);
				if (scgrouplist != null) {
					code = "2";
				} else {
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		map.put("scgrouplist", scgrouplist);
		JSONArray jsons1 = JSONArray.fromObject(map);
		
		content = jsons1.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public List<ScGroup> getScgrouplist() {
		return scgrouplist;
	}

	public void setScgrouplist(List<ScGroup> scgrouplist) {
		this.scgrouplist = scgrouplist;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
