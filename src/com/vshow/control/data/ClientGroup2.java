package com.vshow.control.data;

/**
 * 终端分组2级
 * 
 * @author Administrator
 * 
 */
public class ClientGroup2 extends PublicData {
	private int id;
	private int uid;
	private String g2name; // 二级级终端分组名
	private int g1id; // 外键 一级id
    private String g1name;
    private int g2clientc;//终端总个数
    private int cgtype;


	public int getCgtype() {
		return cgtype;
	}

	public void setCgtype(int cgtype) {
		this.cgtype = cgtype;
	}
	
	public int getG2clientc() {
		return g2clientc;
	}

	public void setG2clientc(int g2clientc) {
		this.g2clientc = g2clientc;
	}

	public String getG1name() {
		return g1name;
	}

	public void setG1name(String g1name) {
		this.g1name = g1name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getG2name() {
		return g2name;
	}

	public void setG2name(String g2name) {
		this.g2name = g2name;
	}

	public int getG1id() {
		return g1id;
	}

	public void setG1id(int g1id) {
		this.g1id = g1id;
	}
}
