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

public class ToBusAction implements Action {

	

	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	private String ctitle;
	
	private String sline;
	private String sdx;
	private String sys;
	
	
	private int sbyst;
	private String sbys;
	
	
	public String execute() throws Exception {
		
		
		//显示行数*字体大小*字体颜色*背景色 (0透明 )
		String cts[]=ctitle.split("\\*");
		
			if(cts.length==4){
				
				sline=cts[0];
				sdx=cts[1];
				sys=cts[2];
				
				if(cts[3].equals("0")){
					sbyst=1;	
				}else{
					sbys=cts[3];
				}
			}
		
	
		
		
		
		return SUCCESS;
	}

	public int getSbyst() {
		return sbyst;
	}

	public void setSbyst(int sbyst) {
		this.sbyst = sbyst;
	}

	public String getSbys() {
		return sbys;
	}

	public void setSbys(String sbys) {
		this.sbys = sbys;
	}

	
	public String getCtitle() {
		return ctitle;
	}


	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	

	public String getSline() {
		return sline;
	}


	public void setSline(String sline) {
		this.sline = sline;
	}


	public String getSdx() {
		return sdx;
	}


	public void setSdx(String sdx) {
		this.sdx = sdx;
	}


	public String getSys() {
		return sys;
	}


	public void setSys(String sys) {
		this.sys = sys;
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
