package com.vshow.control.api.system.rss;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Rss;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 删除RSS
 * 
 * @param account账号
 * @param password 密码
 * @param ids 删除的RSS id
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiDelRssAction implements Action {
	
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
						Rss rss=(Rss)SqlConnect.getSqlMapInstance().queryForObject("find_rss_byid",Integer.parseInt(qid[i]));
						SqlConnect.getSqlMapInstance().delete("del_rss", Integer.parseInt(qid[i]));
						LogHandle.insertTheLog(LogType.type64, user.getId(),Constant.LOCAL.getA00199()+":" + rss.getName(), 1,1);
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
