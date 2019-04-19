package com.vshow.control.user;

import java.io.File;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.PropertiesHandle;
import com.vshow.control.tool.SqlConnect;

public class UpTimeUpatePwdAction extends ActionSupport {
	
	private int editPwdDay;
	private int editSuccess;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
        
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		int urid = (Integer) session.get("urid");
		
		String path=Constant.VSCONFIG+File.separator+"vs.ini";
		
		PropertiesHandle.WriteProperties(path,"editPwdDay",editPwdDay+"");
		
		LogHandle.insertTheLog(LogType.type107, urid, Constant.LOCAL.getB00245()+ ":" + editPwdDay, 1,1);
			
		editSuccess=1;
		
		return SUCCESS;
	}
	
	public int getEditSuccess() {
		return editSuccess;
	}

	public void setEditSuccess(int editSuccess) {
		this.editSuccess = editSuccess;
	}

	public int getEditPwdDay() {
		return editPwdDay;
	}

	public void setEditPwdDay(int editPwdDay) {
		this.editPwdDay = editPwdDay;
	}
}
