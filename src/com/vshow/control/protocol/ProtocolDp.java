package com.vshow.control.protocol;

import java.util.ArrayList;
import java.util.List;

public class ProtocolDp   {
	
	private int jdNum; // 节点编号
	
	private List<String> playList = new ArrayList<String>(); // 播放列表
	
	public int getJdNum() {
		return jdNum;
	}

	public void setJdNum(int jdNum) {
		this.jdNum = jdNum;
	}

	public List<String> getPlayList() {
		return playList;
	}

	public void setPlayList(List<String> playList) {
		this.playList = playList;
	}

	
}
