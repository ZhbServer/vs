package com.vshow.control.api.system.fbl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 新增分辨率
 * 
 * @param account账号
 * @param password 密码
 * @param name 分辨率名称
 * @param tx 宽
 * @param ty 高
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiAddFblAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String name;
	private int tx;
	private int ty;

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
			Fbl fbl = new Fbl();
			fbl.setName(name);
			fbl.setTx(tx);
			fbl.setTy(ty);
			if (user.getBan() == 0) {
				try {
					SqlConnect.getSqlMapInstance().insert("add_fbl",fbl);
					LogHandle.insertTheLog(LogType.type59, user.getId(),Constant.LOCAL.getA00174()+":" + fbl.getName(), 1,1);
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTx() {
		return tx;
	}

	public void setTx(int tx) {
		this.tx = tx;
	}

	public int getTy() {
		return ty;
	}

	public void setTy(int ty) {
		this.ty = ty;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
