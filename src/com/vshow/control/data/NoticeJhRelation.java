package com.vshow.control.data;

public class NoticeJhRelation {
	
	private int id;
	private int jid;
	private int nid;
	private int startid;
	private int pagetype;
	private String tkey;

	public String getTkey() {
		return tkey;
	}

	public void setTkey(String tkey) {
		this.tkey = tkey;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getJid() {
		return jid;
	}

	public void setJid(int jid) {
		this.jid = jid;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public int getStartid() {
		return startid;
	}

	public void setStartid(int startid) {
		this.startid = startid;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
