package com.vshow.control.user;





import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.UserCheck;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.SqlConnect;

/**退出系统，进入登陆页面*/
public class OutAction implements Action {
	
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		String account = (String) session.get("account");
		
		if(account==null){
			
		}else{
			
			HttpServletRequest request=(HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);  
			 
			String ip=Constant.getIp(request);
			 
			//插入用户注销记录
			UserCheck  uc=new UserCheck();
			
			uc.setIp(ip);
			
			uc.setAccount(account);
			
			uc.setSdate(DateUtil.getTime());
			
			uc.setType(2);
			
			uc.setState(1);
			
			uc.setFailState(0);
			
			SqlConnect.getSqlMapInstance().insert("add_user_check", uc);
			
		}
		
		ActionContext.getContext().getSession().clear();
		
		
		
		
		return SUCCESS;
	}

}
