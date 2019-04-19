package com.vshow.control.item;

import com.opensymphony.xwork.ActionSupport;

public class AdTxttoAction extends ActionSupport {
	private int type;
	private String info;
	private int speed;
    private int width;
    private int height;
    private int xy_x=0;
	private int xy_y=0;
	public void setSpeed(int speed) {
		this.speed = speed;
	}

	

	
	public void setType(int type) {
		this.type = type;
	}

	public String execute() throws Exception {
		info = type+"-"+speed+"|"+width+"|"+height+"|"+xy_x+"|"+xy_y;
		return SUCCESS;
	}

	public int getXy_x() {
		return xy_x;
	}




	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}




	public String getInfo() {
		return info;
	}




	public void setInfo(String info) {
		this.info = info;
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
