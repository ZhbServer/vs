package com.vshow.control.user;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.EditUserPwdHistory;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;


public class AjaxCheckUserPwdAction extends ActionSupport {
	
	private String account;  //账户
	private String pwd;     //验证的登陆名
	private String rcontent="0";  //返回写入区内容
	public String execute() throws Exception {
	
		 if(VVersion.flagJmPwd==1){
			 pwd=MD5Util.string2password(pwd);	 
		 }else{
			
		 }
		
		 //验证密码不能与最近三次相同
		List<EditUserPwdHistory> ephs=SqlConnect.getSqlMapInstance().queryForList("sel_edit_pwd_history_zj", account);
		
		EditUserPwdHistory tempEph;
		for (int i = 0; i < ephs.size(); i++) {
			tempEph=ephs.get(i);
			if(tempEph!=null){
				if(tempEph.getPwd().equals(pwd)){
					rcontent="1";
					break;
				}
			}
		}
		
		return  GsonUtil.getGson(rcontent);
		
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	
	
	
}
