package com.vshow.control.user;

import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.tool.DesUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.PropertiesHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class UpdateJdbcPwdAction extends ActionSupport {
	private String newpwd;
    private String info;
	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		String encStr=DesUtil.encrypt(newpwd,DesUtil.keyStatic);
		
		PropertiesHandle.WriteProperties(Resources.getResourceAsFile("jdbc.properties").getPath(), "password", encStr);
		
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
