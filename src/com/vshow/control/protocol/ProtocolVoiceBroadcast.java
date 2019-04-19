package com.vshow.control.protocol;

public class ProtocolVoiceBroadcast extends ProtocolPlayBase {
	    
	private int numberStr;  //  编号
	private int  voiceType;    //  0 取消  1开启
    private String fileName;   //  播放的文件
	 

	public int getVoiceType() {
			return voiceType;
	}

	public void setVoiceType(int voiceType) {
			this.voiceType = voiceType;
	}
		
		
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getNumberStr() {
		return numberStr;
	}

	public void setNumberStr(int numberStr) {
		this.numberStr = numberStr;
	}
}
