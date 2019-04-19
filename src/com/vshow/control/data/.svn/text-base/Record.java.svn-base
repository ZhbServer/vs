package com.vshow.control.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Record implements Comparable<Record> {
	private int id;
	private int iid;
	private String content;
	private int state;
    private String xiadate;
    private String sdate;
    private String edate;
    private int day;
    private String fonttitle;
    private String fontcontent;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}
 
	public void setContent(String content) {
		this.content = content;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getXiadate() {
		return xiadate;
	}

	public void setXiadate(String xiadate) {
		this.xiadate = xiadate;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getFonttitle() {
		return fonttitle;
	}

	public void setFonttitle(String fonttitle) {
		this.fonttitle = fonttitle;
	}

	public String getFontcontent() {
		return fontcontent;
	}

	public void setFontcontent(String fontcontent) {
		this.fontcontent = fontcontent;
	}
	
	@Override
	public int compareTo(Record arg0) {
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long r1=0L;
		long r2=0L;
		try {
			r1=format2.parse(this.getSdate()).getTime();
			r2=format2.parse(arg0.getSdate()).getTime();
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		
		return (int)(r1-r2);
        //return this.getAge() - o.getAge(); 
	}

	
	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	
}
