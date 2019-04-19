package com.vshow.control.api.system.rss;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Tq;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.rss.Rssxml;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 新增RSS
 * 
 * @param account账号
 * @param password 密码
 * @param name RSS名称
 * @param freshtime 刷新时间
 * @param url 地址
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiAddRssAction implements Action {
	
	private String password;
	private String account;
	private String content;
	
	private String name;
	private int freshtime;
	private String url;

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
				Rss rss = new Rss();
				rss.setName(name);
				rss.setFreshtime(freshtime);
				rss.setUrl(url);
				Integer rid = (Integer)SqlConnect.getSqlMapInstance().insert("add_rss", rss);
				try{
					Rssxml nt = new Rssxml();
					nt.doNews(rss.getUrl(), rid);
					LogHandle.insertTheLog(LogType.type63, 1,Constant.LOCAL.getA00198()+":" + rss.getName(), 1,1);
					
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

	public int getFreshtime() {
		return freshtime;
	}

	public void setFreshtime(int freshtime) {
		this.freshtime = freshtime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
