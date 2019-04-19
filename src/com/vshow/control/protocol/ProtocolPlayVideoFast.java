package com.vshow.control.protocol;

public class ProtocolPlayVideoFast {
	
	private  int playVideoFastType;     //前进后退类型  1按秒  2 跳转时间点
	
	private  int playVideoFast;         // 1前进  2 后退  

	private  int playVideoFastTime=5;   //前进后退间隔  秒默认为5秒  
	 
	private  String playVideoFastIn;    //跳转时分秒   xx:xx
	
	

	public int getPlayVideoFastType() {
		return playVideoFastType;
	}

	public void setPlayVideoFastType(int playVideoFastType) {
		this.playVideoFastType = playVideoFastType;
	}

	public int getPlayVideoFast() {
		return playVideoFast;
	}

	public void setPlayVideoFast(int playVideoFast) {
		this.playVideoFast = playVideoFast;
	}

	public int getPlayVideoFastTime() {
		return playVideoFastTime;
	}

	public void setPlayVideoFastTime(int playVideoFastTime) {
		this.playVideoFastTime = playVideoFastTime;
	}

	public String getPlayVideoFastIn() {
		return playVideoFastIn;
	}

	public void setPlayVideoFastIn(String playVideoFastIn) {
		this.playVideoFastIn = playVideoFastIn;
	}
	   
	
}
