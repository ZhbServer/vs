package com.vshow.control.tool;

import com.opensymphony.xwork.ActionSupport;

public class EnterLicensesAction extends ActionSupport {
	
	private String mark;
	
	private String rcontent="";  //返回写入区内容
	@Override
	public String execute() throws Exception {
		
		Constant.resolveVsLicenses();
		
		mark=(String)Constant.vsLicensesMap.get(mark);
		
		if(mark!=null){
			
			Mlt msgList;
			
			msgList = new Mlt();
			
			Constant.messageMap.put(mark, msgList);
		
			rcontent="1";
			
		}else{
			
			rcontent="0";
			
		}
		
		return  GsonUtil.getGson(rcontent);
	
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	
}
