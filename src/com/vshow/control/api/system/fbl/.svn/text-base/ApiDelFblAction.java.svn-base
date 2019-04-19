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
 * 删除分辨率
 * 
 * @param account账号
 * @param password 密码
 * @param ids 删除的分辨率id
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiDelFblAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String ids;

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
				String [] qid = ids.split("_");
				try {
					for (int i = 0; i < qid.length; i++) {
						Fbl fbl=(Fbl)SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id" ,Integer.parseInt(qid[i]));
						SqlConnect.getSqlMapInstance().delete("del_fbl", Integer.parseInt(qid[i]));
						LogHandle.insertTheLog(LogType.type60, user.getId(),Constant.LOCAL.getA00175()+":" + fbl.getName(), 1,1);
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
