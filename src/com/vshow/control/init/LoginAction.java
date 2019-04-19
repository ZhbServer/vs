package com.vshow.control.init;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;

public class LoginAction extends ActionSupport {
	private String password;
	private String account;
	private String yzcode;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		String yzcode = (String) session.get("yzcode");
		Local local= (Local) session.get("local");
		if (!this.yzcode.equals(yzcode)) {
			session.put("error",local.getA00052());
			session.put("url", "tologin.vs");
			return ERROR;
		}
		User usparam = new User();
		account=account.trim();
		password=password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		Power upresult = (Power) SqlConnect.getSqlMapInstance().queryForObject("user_login_check", usparam);
		if (upresult == null) {
			session.put("error", local.getA00053());
			session.put("url", "tologin.vs");
			return ERROR;
		} else {
			
			if(upresult.getBan()==0){
				session.put("tomcat_port",VCommon.port3);
				session.put("urid", upresult.getUserid());
				session.put("urname", upresult.getUsername());
				session.put("urcheck", upresult.getOcheck());
	        	session.put("urtkey",upresult.getUsertkey());
				session.put("ip", Constant.IP);
				
	        	session.put("seesucai", upresult.getSeesucai());
				session.put("addsucai", upresult.getAddsucai());
				session.put("delsucai", upresult.getDelsucai());
				session.put("seeitem", upresult.getSeeitem());
				session.put("additem", upresult.getAdditem());
				session.put("delitem", upresult.getDelitem());
				session.put("publicsucai", upresult.getPublicsucai());
				session.put("publicitem", upresult.getPublicitem());
				session.put("itemsend", upresult.getItemsend());
				session.put("listsend", upresult.getListsend());
				session.put("insertsend", upresult.getInsertsend());
				session.put("dpsend", upresult.getDpsend());			
				session.put("downmanager", upresult.getDownmanager());
				session.put("clientset", upresult.getClientset());
				session.put("clearclient", upresult.getClearclient());		
				session.put("noticesend", upresult.getNoticesend());
				session.put("onoffset", upresult.getOnoffset());			
				session.put("groupmanager", upresult.getGroupmanager());
				session.put("parameterset", upresult.getParameterset());
				session.put("serverip", upresult.getServerip());			
				session.put("usermanager", upresult.getUsermanager());
				session.put("powermanager", upresult.getPowermanager());
				session.put("sysset", upresult.getSysset());		
				session.put("userlog", upresult.getUserlog());
				session.put("clientlog", upresult.getClientlog());
				session.put("statistical", upresult.getStatistical());			
				session.put("checksend", upresult.getChecksend());
				session.put("checkitem", upresult.getDelitem());
				session.put("jhset", upresult.getJhset());
				
				
				
			}else{
				session.put("error", local.getA00554());
				session.put("url", "tologin.vs");
				return ERROR;
			}
			
			return SUCCESS;
		}
		
		
		
		
		
		
		
		
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setYzcode(String yzcode) {
		this.yzcode = yzcode;
	}
}
