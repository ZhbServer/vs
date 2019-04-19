package com.vshow.control.tool;



import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork.ActionSupport;

public class GetTbTime extends ActionSupport {
	private String content;

	@Override
	public String execute() throws Exception {
		content = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(new Date());		
	    return SUCCESS;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

}
