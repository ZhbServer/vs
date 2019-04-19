package com.vshow.control.item;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAdRssAction implements Action {

	private String ip;
	private List list;
	private int width;
	private int height;
	private int xy_x = 0;
	private int xy_y = 0;

	private float sf;

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ip = Constant.IP;
		list = sm.queryForList("find_idname_rss");
		return SUCCESS;
	}

	public List getList() {
		return list;
	}

	public String getIp() {
		return ip;
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

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setList(List list) {
		this.list = list;
	}

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}

}
