package com.vshow.control.api.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 用户登录
 * @param account账号
 * @param password 密码
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiLoginUserAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private Power upresult;

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2查询成功 3查询失败 4用户被禁用

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
				upresult = (Power) SqlConnect.getSqlMapInstance().queryForObject("user_login_check", usparam);
				if(upresult!=null){
					
					 //获取拓展权限
					 PowerExpand  ped=(PowerExpand)SqlConnect.getSqlMapInstance().queryForObject("sel_powerExpand_all", upresult.getId());
					 
					 if(ped!=null){
						 
						 String expandContent=ped.getExpandContent();
						 
						 JSONArray array = JSONArray.fromObject(expandContent);
						 
						 for (int i = 0; i < array.size(); i++) {
							 
							    JSONObject jsonObject = array.getJSONObject(i); 
							    
							    PowerExpand ti=(PowerExpand)JSONObject.toBean(jsonObject, PowerExpand.class);
							   
							    if(ti.getPowerName().equals("dllItemSend")){
							    	upresult.setDllItemSend(ti.getPowerState());
							    }
								
						 }
						 
					 }else{
						 upresult.setDllItemSend(0);
						 
					 }
					 
					 
					code = "2";
				}else{
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		//JSONArray jsons = JSONArray.fromObject(upresult);
		map.put("upresult", upresult);
		JSONArray jsons1 = JSONArray.fromObject(map);

		content=jsons1.toString();
		//System.out.println(content);
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

	public Power getUpresult() {
		return upresult;
	}

	public void setUpresult(Power upresult) {
		this.upresult = upresult;
	}
	
}
