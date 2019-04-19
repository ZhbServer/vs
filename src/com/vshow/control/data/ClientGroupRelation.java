package com.vshow.control.data;

/**
 * 终端分组关系表
 * 
 * @author Administrator
 * 
 */
public class ClientGroupRelation extends PublicData {
	
	private int id;
	private int cid; // 终端id
	private int gtype; // 分组类型(1一级 2 二级 3 三级)
	private int gid; // 分组id
	private int uid;

	private String sname; //过滤名称
    private String ser;// 搜索条件
    private String orderv="id"; //排序条件
    private String tkey; 
    
    private String account;
    private String mark;
	private String ip;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getTkey() {
		return tkey;
	}

	public void setTkey(String tkey) {
		this.tkey = tkey;
	}

	public String getOrderv() {
		return orderv;
	}

	public void setOrderv(String orderv) {
		this.orderv = orderv;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public String getSer() {
		return ser;
	}

	public void setSer(String ser) {
		this.ser = ser;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getGtype() {
		return gtype;
	}

	public void setGtype(int gtype) {
		this.gtype = gtype;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}
}
