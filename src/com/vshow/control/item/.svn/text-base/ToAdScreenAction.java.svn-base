package com.vshow.control.item;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;



public class ToAdScreenAction implements Action {
	private List<Screen> screens;
	private int height;
	private int width;
	private int xy_x=0;
	private int xy_y=0;
	private String ip;
	@Override
	public String execute() throws Exception {
		ip=Constant.IP;
		screens = SqlConnect.getSqlMapInstance().queryForList("gt_scr_one");
		return SUCCESS;
	}
	public List<Screen> getScreens() {
		return screens;
	}
	public void setScreens(List<Screen> screens) {
		this.screens = screens;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

}
