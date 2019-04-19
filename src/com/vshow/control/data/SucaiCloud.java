package com.vshow.control.data;

public class SucaiCloud {
	private int id;
	private String filename;
	private String videoid;
	private String downurl;
	private String resultdata;
	private int cloudtype;

	public int getId() {
		return id;
	}

	public int getCloudtype() {
		return cloudtype;
	}

	public void setCloudtype(int cloudtype) {
		this.cloudtype = cloudtype;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getVideoid() {
		return videoid;
	}

	public void setVideoid(String videoid) {
		this.videoid = videoid;
	}

	public String getDownurl() {
		return downurl;
	}

	public void setDownurl(String downurl) {
		this.downurl = downurl;
	}

	public String getResultdata() {
		return resultdata;
	}

	public void setResultdata(String resultdata) {
		this.resultdata = resultdata;
	}
}
