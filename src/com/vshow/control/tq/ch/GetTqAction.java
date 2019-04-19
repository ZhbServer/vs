package com.vshow.control.tq.ch;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.Tq;
import com.vshow.control.tool.SqlConnect;

public class GetTqAction implements Action {

	private String citykey;
	private Tq tq;
	private Tq tq2;
	private int dx;
	private String ys;
	private int id;
	private String ys2;
	private int imgsize;
	private float sf;
	private int tqtype;

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
		Tq tqs = (Tq) sm.queryForObject("g_wotq_value", id);
		if (tqs != null) {
			tq=new Tq();
			tq.setCity(tqs.getCity());
			tq.setDay(tqs.getDay().split("\\|")[0]);
			tq.setGif(tqs.getGif().split("\\|")[0]);
			tq.setContent(tqs.getContent().split("\\|")[0]);
			tq2 = new Tq();
			tq2.setDay(tqs.getDay().split("\\|")[1]);
			tq2.setGif(tqs.getGif().split("\\|")[1]);
			tq2.setContent(tqs.getContent().split("\\|")[1]);
		}
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

	public int getTqtype() {
		return tqtype;
	}

	public void setTqtype(int tqtype) {
		this.tqtype = tqtype;
	}

	public Tq getTq2() {
		return tq2;
	}

	public void setTq2(Tq tq2) {
		this.tq2 = tq2;
	}

}
