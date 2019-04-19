package com.vshow.control.api.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 未录入终端
 * @param account账号
 * @param password 密码 
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiNoEnterClientAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private List noclients;

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
			if (user.getBan() == 0) {
				noclients=SqlConnect.getSqlMapInstance().queryForList("api_see_unclient");
				if (noclients != null) {
					code = "2";
				} else {
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		map.put("noclients", noclients);
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
