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

public class ToCameraTAction implements Action {

	

	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	private String ctitle;
	private String cdid;
	private String cusername;
	private String cpwd;
	private String cfactory;
	
	
	public String execute() throws Exception {
		
		//X*Y*宽*高*设备ID*用户名*密码*厂商
		String cts[]=ctitle.split("\\*");
		if(cts.length==4){
			cdid=cts[0];
			cusername=cts[1];
			cpwd=cts[2];
			cfactory=cts[3];         
		}
		
		return SUCCESS;
	}


	public String getCtitle() {
		return ctitle;
	}


	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}



	public String getCdid() {
		return cdid;
	}




	public void setCdid(String cdid) {
		this.cdid = cdid;
	}




	public String getCusername() {
		return cusername;
	}



	public void setCusername(String cusername) {
		this.cusername = cusername;
	}




	public String getCpwd() {
		return cpwd;
	}



	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}


	public String getCfactory() {
		return cfactory;
	}


	public void setCfactory(String cfactory) {
		this.cfactory = cfactory;
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
