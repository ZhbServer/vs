package com.vshow.control.tq.ch;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.spring.interceptor.ActionAutowiringInterceptor;
import com.vshow.control.tool.SqlConnect;

public class GetTqJsonAction implements Action {

	private String city;
	private String content;
	@Override
	public String execute() throws Exception {
		if(city==null||city.equals("")){
			content="error";
		}else{
			content=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_tq_wdata",city);	
		}
		return SUCCESS;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
