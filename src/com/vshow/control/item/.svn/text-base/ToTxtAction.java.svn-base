package com.vshow.control.item;

import com.opensymphony.xwork.Action;

public class ToTxtAction implements Action {

	private int height;
	private int width;
    private String title="";
    private int sspeed=3;
    private int stype=0;
    private int xy_x=0;
	private int xy_y=0;
	
	public String execute() throws Exception {
		String titles[]=title.split("\\-");
		if(titles.length==2){
			sspeed=Integer.parseInt(titles[1]);
			stype=Integer.parseInt(titles[0]);
		}
		return SUCCESS;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSspeed() {
		return sspeed;
	}

	public void setSspeed(int sspeed) {
		this.sspeed = sspeed;
	}

	public int getStype() {
		return stype;
	}

	public void setStype(int stype) {
		this.stype = stype;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

}
