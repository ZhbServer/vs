package com.vshow.control.data.program;

public class TouchBasis {
   
	private int tbType;
	  
    //翻书第一页是否显示封面 1显示  0不显示
    private int isShowIndex; 

	public int getIsShowIndex() {
		return isShowIndex;
	}

	public void setIsShowIndex(int isShowIndex) {
		this.isShowIndex = isShowIndex;
	}

	public int getTbType() {
		return tbType;
	}

	public void setTbType(int tbType) {
		this.tbType = tbType;
	}
}
