package com.vshow.control.api.log;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Log;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

/**
 * 查询日志
 * @param account账号
 * @param password 密码 
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiSelLogAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private List<Log> loglist;
	
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
				loglist=(List<Log>)SqlConnect.getSqlMapInstance().queryForList("sel_all_logs_out", user.getTkey());
				if (loglist != null) {
					code = "2";
				} else {
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		map.put("loglist", loglist);
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
