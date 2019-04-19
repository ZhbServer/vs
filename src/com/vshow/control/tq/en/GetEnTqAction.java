package com.vshow.control.tq.en;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.Tq;

import com.vshow.control.tool.SqlConnect;

public class GetEnTqAction implements Action {

	private String citykey;
	private Tq tq;
	private int dx;
	private String ys;
	private int id;
	private String ys2;
	private int imgsize;
	private float sf;
	public String getYs2() {
		return ys2;
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
		ys2 = ys;
		ys = "#" + ys;
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		tq = (Tq) sm.queryForObject("g_enwotq_value", id);
		return SUCCESS;
	}

	

	public Tq getTq() {
		return tq;
	}

	public void setTq(Tq tq) {
		this.tq = tq;
	}

	public void setYs2(String ys2) {
		this.ys2 = ys2;
	}

	public String getCitykey() {
		return citykey;
	}

	public void setCitykey(String citykey) {
		this.citykey = citykey;
	}

	public int getImgsize() {
		return imgsize;
	}

	public void setImgsize(int imgsize) {
		this.imgsize = imgsize;
	}

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}

}
