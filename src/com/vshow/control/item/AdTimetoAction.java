package com.vshow.control.item;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;

public class AdTimetoAction extends ActionSupport {
	private String a1;
	private String a2;
	private String a3;
	private String a4;
	private String info;
	private int width;
	private int height;
	private int aa;
	private String bb;
	private int datetype;
	private int xy_x=0;
	private int xy_y=0;
	
	

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Local local = (Local) session.get("local");
		if (aa == 1 || aa == 2) {
			a4 = "XX" + local.getA00300() + "XX" + local.getA00301()
					+ "XX" + local.getA00302() + "XX"
					+ local.getA00106();
		} else {
			if (datetype == 2) {
				SimpleDateFormat sf = new SimpleDateFormat("MM/dd/yyyy");
						
				String qian = sf.format(new Date());
				if (a4.split(" ").length == 3) {
					a4 = qian + " " + a4.split(" ")[1] + " " + a4.split(" ")[2];
				}
				aa=3;

			}

		}

		info = aa + "_" + bb + "-" + a1 + "-" + a2 + "-" + a3 + "-" + a4
				+ "-" + width + "-" + height+"-"+xy_x+"-"+xy_y+"-"+datetype;
		return SUCCESS;

	}

	public String getInfo() {
		return info;
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

	public int getAa() {
		return aa;
	}

	public void setAa(int aa) {
		this.aa = aa;
	}

	public String getBb() {
		return bb;
	}

	public void setBb(String bb) {
		this.bb = bb;
	}

	public int getDatetype() {
		return datetype;
	}

	public void setDatetype(int datetype) {
		this.datetype = datetype;
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



	public void setA4(String a4) {
		this.a4 = a4;
	}

	

	public void setA1(String a1) {
		this.a1 = a1;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}

	public void setA3(String a3) {
		this.a3 = a3;
	}

}
