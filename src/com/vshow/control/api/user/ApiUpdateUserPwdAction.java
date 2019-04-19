package com.vshow.control.api.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 修改用户密码
 * @param account账号
 * @param password 密码
 * @param newpassword 用户新密码
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiUpdateUserPwdAction extends ActionSupport {
	
	private String account;
	private String password;
	private String content;
	
	private String newpassword;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
			
		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用
		
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
				User u = new User();
				u.setId(user.getId());
				u.setPassword(newpassword);
				try {
					SqlConnect.getSqlMapInstance().update("up_user_pwd", u);
					code= "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsonArray = JSONArray.fromObject(map);
		
		content = jsonArray.toString();
		return SUCCESS;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
