package com.vshow.control.data.bus;

public class BusData {
	
	private String vehiclesNum;      // 车辆号
	private String ArrivalTime;      // 到站时间(倒计时分钟)
	private int    ArrivalStation;   // 距离几站到站
  

	
	public int getArrivalStation() {
		return ArrivalStation;
	}

	public void setArrivalStation(int arrivalStation) {
		ArrivalStation = arrivalStation;
	}

	public String getVehiclesNum() {
		return vehiclesNum;
	}

	public void setVehiclesNum(String vehiclesNum) {
		this.vehiclesNum = vehiclesNum;
	}

	public String getArrivalTime() {
		return ArrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		ArrivalTime = arrivalTime;
	}
}
