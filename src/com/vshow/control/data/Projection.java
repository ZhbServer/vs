package com.vshow.control.data;

import java.util.List;

public class Projection extends PublicData {
	
	private int id;
	private String title;
	private int startid;     
	private int uid;	
	private String pOn;          //投影仪开机
	private String pOff;         //投影仪关机 
	private String pOnConfirm;   //投影仪开机确认 
	private String pOffConfirm;  //投影仪关机确认
	
	private String baudrate;    //波特率    默认为0  不填
	private String device;       //串口号    默认为0
	
	
	public String getBaudrate() {
		return baudrate;
	}
	public void setBaudrate(String baudrate) {
		this.baudrate = baudrate;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getStartid() {
		return startid;
	}
	public void setStartid(int startid) {
		this.startid = startid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getpOn() {
		return pOn;
	}
	public void setpOn(String pOn) {
		this.pOn = pOn;
	}
	public String getpOff() {
		return pOff;
	}
	public void setpOff(String pOff) {
		this.pOff = pOff;
	}
	public String getpOnConfirm() {
		return pOnConfirm;
	}
	public void setpOnConfirm(String pOnConfirm) {
		this.pOnConfirm = pOnConfirm;
	}
	public String getpOffConfirm() {
		return pOffConfirm;
	}
	public void setpOffConfirm(String pOffConfirm) {
		this.pOffConfirm = pOffConfirm;
	}
	


}
