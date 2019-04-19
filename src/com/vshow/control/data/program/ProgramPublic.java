package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

public class ProgramPublic {

	// 元素Id
	private String mId;

	// 坐标x
	private int mLeft;

	// 坐标y
	private int mTop;

	// 宽
	private int mWidth;

	// 高
	private int mHeight;

	// 类型 详细类型说明 见ResourceType
	private int type;

	// 显示层(越大越靠上)
	private int showZindex;

	// 控件初始化隐藏(true为隐藏)
	private String elementHide;
	// 元素是否与叫号控件关联
	private String relationCall;

	// 触摸列表
	private List<TouchInteractive> mTouchList = new ArrayList<TouchInteractive>();

	// 区域背景 （新增）
	private String bgnameUrl;

	//轮播列表显示数
	private String ycCount;
	

	public String getYcCount() {
		return ycCount;
	}

	public void setYcCount(String ycCount) {
		this.ycCount = ycCount;
	}

	public String getBgnameUrl() {
		return bgnameUrl;
	}

	public void setBgnameUrl(String bgnameUrl) {
		this.bgnameUrl = bgnameUrl;
	}

	public int getShowZindex() {
		return showZindex;
	}

	public void setShowZindex(int showZindex) {
		this.showZindex = showZindex;
	}

	public String getElementHide() {
		return elementHide;
	}

	public void setElementHide(String elementHide) {
		this.elementHide = elementHide;
	}

	public String getRelationCall() {
		return relationCall;
	}

	public void setRelationCall(String relationCall) {
		this.relationCall = relationCall;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<TouchInteractive> getmTouchList() {
		return mTouchList;
	}

	public void setmTouchList(List<TouchInteractive> mTouchList) {
		this.mTouchList = mTouchList;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getmLeft() {
		return mLeft;
	}

	public void setmLeft(int mLeft) {
		this.mLeft = mLeft;
	}

	public int getmTop() {
		return mTop;
	}

	public void setmTop(int mTop) {
		this.mTop = mTop;
	}

	public int getmWidth() {
		return mWidth;
	}

	public void setmWidth(int mWidth) {
		this.mWidth = mWidth;
	}

	public int getmHeight() {
		return mHeight;
	}

	public void setmHeight(int mHeight) {
		this.mHeight = mHeight;
	}
}
