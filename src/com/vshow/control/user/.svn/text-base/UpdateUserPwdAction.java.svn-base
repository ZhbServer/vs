package com.vshow.control.user;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.EditUserPwdHistory;
import com.vshow.control.data.User;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class UpdateUserPwdAction extends ActionSupport {
	private String newpwd;
    private String info;
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String account=session.get("account")+"";
		User u = new User();
		u.setId(urid);
		//u.setPassword(newpwd);
		if(VVersion.flagJmPwd==1){
			 u.setPassword(MD5Util.string2password(newpwd));	 
		}else{
			 u.setPassword(newpwd);
		}
		 
		 
		 //插入修改历史
		 if (new VVersion().pwdPloy.equals("1")){
			 
			 
			 //验证密码不能与最近三次相同
			//List<EditUserPwdHistory> ephs=SqlConnect.getSqlMapInstance().queryForList("sel_edit_pwd_history_zj", account);
			
			//EditUserPwdHistory tempEph;
			//for (int i = 0; i < ephs.size(); i++) {
			//	tempEph=ephs.get(i);
			//	if(tempEph!=null){
			//		if(tempEph.getPwd().equals(u.getPassword())){
						//System.out.println("密码相同");
			//		}
			//	}
			//}
			 
			 EditUserPwdHistory eph=new EditUserPwdHistory();
			 eph.setSdate(DateUtil.getTime());
			 eph.setPwd(u.getPassword());
			 eph.setAccount(account);
			 eph.setHandleaccount(account);
			 SqlConnect.getSqlMapInstance().insert("ad_edit_pwd_history", eph);
			 
		 }
		
		 sm.update("up_user_pwd", u);
		 info="1";
		 return SUCCESS;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
}
