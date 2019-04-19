package com.vshow.control.api.power;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 删除权限
 * 
 * @param account账号
 * @param password 密码
 * @param ids 删除权限的id
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiDelPowerAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String ids; // 权限id

	@Override
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
				List<Integer> pusers;
				String [] pid = ids.split("_");
				try {
					for (int i = 0; i < pid.length; i++) {
						// 获取关联用户
						pusers = SqlConnect.getSqlMapInstance().queryForList(
								"sel_user_id_powerid", Integer.parseInt(pid[i]));
						for (int j = 0; j < pusers.size(); j++) {
							// 权限id更新为0
							SqlConnect.getSqlMapInstance().update("update_user_powerid",
									pusers.get(j));
						}

						String pname = (String) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_power_name_id", Integer.parseInt(pid[i]));
						SqlConnect.getSqlMapInstance().delete("del_power", Integer.parseInt(pid[i]));
						if (pname != null) {
							LogHandle.insertTheLog(LogType.type58, user.getId(),
									Constant.LOCAL.getA00173() + ":" + pname, 1, 1);
						}
					}
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);

		content = jsons.toString();
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
