package com.vshow.control.api.system.tq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Power;
import com.vshow.control.data.Tq;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 新增天气
 * 
 * @param account账号
 * @param password 密码
 * @param city 城市名
 * @param citykey 城市标识符
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiAddTqAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String city;
	private String citykey;

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
			Tq tq = new Tq();
			tq.setCity(city);
			tq.setCitykey(citykey);
			tq.setCode(city);
			if (user.getBan() == 0) {
				try {
					String c=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_tq_code", tq.getCode());
				    if(c==null){
				    	SqlConnect.getSqlMapInstance().insert("add_tq", tq);	
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCitykey() {
		return citykey;
	}

	public void setCitykey(String citykey) {
		this.citykey = citykey;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
