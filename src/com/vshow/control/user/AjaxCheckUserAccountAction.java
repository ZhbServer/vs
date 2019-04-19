package com.vshow.control.user;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


public class AjaxCheckUserAccountAction extends ActionSupport {
	
	public String getcAccount() {
		return cAccount;
	}
	public void setcAccount(String cAccount) {
		this.cAccount = cAccount;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	private String cAccount;     //验证的登陆名
	private String rcontent="";  //返回写入区内容
	public String execute() throws Exception {
	
		List<User> tempr=(List<User>)SqlConnect.getSqlMapInstance().queryForList("sel_user_check_account",cAccount);
		if(tempr.size() == 0){
			rcontent="1";
		}else{
			rcontent="0";
		}
		return  GsonUtil.getGson(rcontent);
		
	}
}
