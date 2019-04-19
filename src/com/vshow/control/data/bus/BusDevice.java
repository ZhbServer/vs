package com.vshow.control.data.bus;

import java.util.ArrayList;
import java.util.List;

public class BusDevice {

	private String deviceId; // 设备号

	private int arrivalTime; //到站时间
	
	private String lineName;  //(车辆号码)
	
	private int arrivalStation; //到站站数(暂不用)
	
	private int publishType;   //(暂不用)
	
	
	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public int getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(int arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public int getArrivalStation() {
		return arrivalStation;
	}

	public void setArrivalStation(int arrivalStation) {
		this.arrivalStation = arrivalStation;
	}

	public int getPublishType() {
		return publishType;
	}

	public void setPublishType(int publishType) {
		this.publishType = publishType;
	}


	
	

}
