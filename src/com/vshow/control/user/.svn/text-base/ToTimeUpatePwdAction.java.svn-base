package com.vshow.control.user;

import java.io.File;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.PropertiesHandle;

public class ToTimeUpatePwdAction extends ActionSupport {
	
	private int editPwdDay;

    private int editSuccess;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String path=Constant.VSCONFIG+File.separator+"vs.ini";
		String editPwdDayStr = PropertiesHandle.GetValueByKey(path,"editPwdDay");
		
		if(editPwdDayStr==null||editPwdDayStr.equals("")){
			editPwdDay=30;
		}else{
			editPwdDay=Integer.parseInt(editPwdDayStr);
		}
		
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
