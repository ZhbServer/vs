package com.vshow.control.data;

public class InteractItemShare {
	private int id;
	private int userid;
	private int itemid;
	private String shareid;
	private int startid;
	private String tkey;
	private Integer pagetype;
	private int type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getShareid() {
		return shareid;
	}

	public void setShareid(String shareid) {
		this.shareid = shareid;
	}

	public int getStartid() {
		return startid;
	}

	public void setStartid(int startid) {
		this.startid = startid;
	}

	public String getTkey() {
		return tkey;
	}

	public void setTkey(String tkey) {
		this.tkey = tkey;
	}

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
