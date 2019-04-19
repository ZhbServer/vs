package com.vshow.control.data;

public class CountClientTimeApi {


	private int clientid;
	private String date;

	private int bcount;


	private int uid;

	public int getUid() {
		return uid;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}



	public int getClientid() {
		return clientid;
	}

	public void setClientid(int clientid) {
		this.clientid = clientid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


}
