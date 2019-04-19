package com.vshow.control.data.client.interact;

public class Report {
    private String mMac;
	private int mType;   //1 人数统计
    private long mDatetime;
	private Object mReportObject;
 

	public long getmDatetime() {
		return mDatetime;
	}

	public void setmDatetime(long mDatetime) {
		this.mDatetime = mDatetime;
	}

	public Object getmReportObject() {
		return mReportObject;
	}

	public void setmReportObject(Object mReportObject) {
		this.mReportObject = mReportObject;
	}

	public String getmMac() {
		return mMac;
	}

	public void setmMac(String mMac) {
		this.mMac = mMac;
	}

	public int getmType() {
		return mType;
	}

	public void setmType(int mType) {
		this.mType = mType;
	}
}
