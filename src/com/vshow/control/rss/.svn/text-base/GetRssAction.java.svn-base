package com.vshow.control.rss;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class GetRssAction implements Action {

	private int speed;
	private int dx;
	private String ys;
	private int id;
	private String content;
	private int gd;
	private String url;

	public int getGd() {
		return gd;
	}

	public void setGd(int gd) {
		this.gd = gd;
	}

	public String getContent() {
		return content;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDx() {
		return dx;
	}

	public void setDx(int dx) {
		this.dx = dx;
	}

	public String getYs() {
		return ys;
	}

	public void setYs(String ys) {
		this.ys = ys;
	}

	public int getId() {
		return id;
	}

	public String execute() throws Exception {
		ys = "#" + ys;
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		content = (String) sm.queryForObject("gt_nds_one_url",url);
		return SUCCESS;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
