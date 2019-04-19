package com.vshow.control.item;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.tool.Local;

public class ToCodeTAction implements Action {

	private String codeurl="";
	
	private int codep=1;
	
	

	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	
	
	
	public String execute() throws Exception {
		
		return SUCCESS;
	}




	public String getCodeurl() {
		return codeurl;
	}




	public void setCodeurl(String codeurl) {
		this.codeurl = codeurl;
	}




	public int getCodep() {
		return codep;
	}




	public void setCodep(int codep) {
		this.codep = codep;
	}




	public int getXy_x() {
		return xy_x;
	}




	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}




	public int getXy_y() {
		return xy_y;
	}




	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}




	public int getWidth() {
		return width;
	}




	public void setWidth(int width) {
		this.width = width;
	}




	public int getHeight() {
		return height;
	}




	public void setHeight(int height) {
		this.height = height;
	}
	
	
	

	

}
