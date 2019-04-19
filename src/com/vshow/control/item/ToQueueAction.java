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

public class ToQueueAction implements Action {

	
    private int qtype;
	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	private String ctitle;
	private String stype;
	private String sline;
	private String sdx;
	private String sys;
	private String svoice;
	
	private int sbyst;
	private String sbys;
	
	
	public String execute() throws Exception {
		
		String returns="";
		//样式(1,2,3)*显示行数*字体大小*字体颜色*语音播放(0关 1开)*背景色 (0透明)
		String cts[]=ctitle.split("\\*");
		if(qtype==1){
			if(cts.length==6){
				stype=cts[0];
				sline=cts[1];
				sdx=cts[2];
				sys=cts[3];
				svoice=cts[4];
				if(cts[5].equals("0")){
					sbyst=1;	
				}else{
					sbys=cts[5];
				}
			}
			returns="successm";
		}else if(qtype==2){
			if(cts.length==6){
				stype=cts[0];
			    sdx=cts[2];
				sys=cts[3];
				svoice=cts[4];
				if(cts[5].equals("0")){
					sbyst=1;	
				}else{
					sbys=cts[5];
				}
			}
			returns="successs";
		}
		
		
		
		return returns;
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

	public int getQtype() {
		return qtype;
	}

	public void setQtype(int qtype) {
		this.qtype = qtype;
	}

	public String getCtitle() {
		return ctitle;
	}


	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getStype() {
		return stype;
	}


	public void setStype(String stype) {
		this.stype = stype;
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


	public String getSvoice() {
		return svoice;
	}


	public void setSvoice(String svoice) {
		this.svoice = svoice;
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
