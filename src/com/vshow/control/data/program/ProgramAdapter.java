package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;


/**
 * 
 * @author w
 * 资源
 *
 */
public class ProgramAdapter  {

	private String path; // 图片默认显示路径
	private String mBackgroundFocused;  // 获取焦点显示图片
	private String mBackgroundSelected; // 选中效果显示图片
	private String mBackgroundPressed;  // 按下效果显示图片
	
	private String igPid;//父级Node Id
	private String igId; //当前Node Id
	private int    igType;  //node显示类型  1事件  2播放资源 
	
	
	
	//触摸列表
    private List<TouchInteractive> mTouchList=new ArrayList<TouchInteractive>();
	

	public List<TouchInteractive> getmTouchList() {
		return mTouchList;
	}

	public void setmTouchList(List<TouchInteractive> mTouchList) {
		this.mTouchList = mTouchList;
	}

	public String getIgPid() {
		return igPid;
	}

	public void setIgPid(String igPid) {
		this.igPid = igPid;
	}

	public String getIgId() {
		return igId;
	}

	public void setIgId(String igId) {
		this.igId = igId;
	}

	public int getIgType() {
		return igType;
	}

	public void setIgType(int igType) {
		this.igType = igType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getmBackgroundFocused() {
		return mBackgroundFocused;
	}

	public void setmBackgroundFocused(String mBackgroundFocused) {
		this.mBackgroundFocused = mBackgroundFocused;
	}

	public String getmBackgroundSelected() {
		return mBackgroundSelected;
	}

	public void setmBackgroundSelected(String mBackgroundSelected) {
		this.mBackgroundSelected = mBackgroundSelected;
	}

	public String getmBackgroundPressed() {
		return mBackgroundPressed;
	}

	public void setmBackgroundPressed(String mBackgroundPressed) {
		this.mBackgroundPressed = mBackgroundPressed;
	}
}
