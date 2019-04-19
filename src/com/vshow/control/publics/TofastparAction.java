package com.vshow.control.publics;

import com.opensymphony.xwork.ActionSupport;

public class TofastparAction extends ActionSupport {
	
	private int returnType;   //1分辨率
	
	private int subType;     //提交类型
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		subType=1;
		if(returnType==1){
			
			return "fblsuccess";
		}
		
		return super.execute();
	}
	public int getReturnType() {
		return returnType;
	}
	public void setReturnType(int returnType) {
		this.returnType = returnType;
	}
	public int getSubType() {
		return subType;
	}
	public void setSubType(int subType) {
		this.subType = subType;
	}
}
