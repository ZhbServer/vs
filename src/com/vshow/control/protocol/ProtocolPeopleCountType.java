package com.vshow.control.protocol;

public class ProtocolPeopleCountType extends ProtocolPlayBase {
	    
	private int peopleCountType; // 0关闭 1人脸识别 2红外感应

	public int getPeopleCountType() {
		return peopleCountType;
	}

	public void setPeopleCountType(int peopleCountType) {
		this.peopleCountType = peopleCountType;
	}
}
