package com.vshow.control.api.v1.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 用户登录
 * @param account账号
 * @param password 密码
 * @author w
 * @version 6.1 API接口
 *
 */
public class LoginUserAction extends BaseAction {

	
	private String password;
	
	private String account;
	
	@Override
	public String execute() throws Exception {
		
		
		//参数为空不合法
		if(account==null||password==null||account.equals("")||password.equals("")) {
			
			responseEntity = ResponseEntity.err0004();
			
		} else {
			
			//验证账号密码是否正确
			User usparam = new User();
	        usparam.setAccount(account.trim());
			usparam.setPassword(password.trim());
			
			//查询账户
			User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_check_user_login", usparam);
			if (user == null) {
				
				responseEntity = ResponseEntity.err0001();
			
			} else {
				
				//ban 账户是否禁用  0正常  1已禁用
				if (user.getBan() == 0) {
					
					responseEntity = ResponseEntity.err0000();
					
					String token=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_user_token", user.getAccount());
					
					//获取用户token (如果token为null 或者 '' 当前用户禁用 或者 用户无token)
					responseEntity.putDataValue("access_token", token);
					
				} else if (user.getBan() == 1) {
				  
					responseEntity = ResponseEntity.err0002();
					
				} else {
				  
					responseEntity = ResponseEntity.err0003();
					
				}
				
			}
			
		}
		
        return Action.SUCCESS;

	}

	public static void main(String[] args) {
		System.out.println(Action.SUCCESS);
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

	
	
	
}
