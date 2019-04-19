package com.vshow.control.data;

import java.util.ArrayList;
import java.util.List;

import com.vshow.control.data.program.ProgramComplexMediaManager;

public class SendPlayBasis {
	private int fbmode;  //发布模式 0 替换 1追加
	private int fbtype;  //发布类型 0普通发布  1有效期发布 
	
	private String validitySdate;  //有效期开始时间
	private String validityEdate;  //有效期结束时间
	private List<Item> itemPlayList = new ArrayList<Item>();  //节目单
	
	private int inductionTime;//无感应节目返回播放时长(秒)

	
	
	
	

	public int getInductionTime() {
		return inductionTime;
	}

	public void setInductionTime(int inductionTime) {
		this.inductionTime = inductionTime;
	}

	public int getFbmode() {
		return fbmode;
	}

	public void setFbmode(int fbmode) {
		this.fbmode = fbmode;
	}

	public int getFbtype() {
		return fbtype;
	}

	public void setFbtype(int fbtype) {
		this.fbtype = fbtype;
	}


	

	public String getValiditySdate() {
		return validitySdate;
	}

	public void setValiditySdate(String validitySdate) {
		this.validitySdate = validitySdate;
	}

	public String getValidityEdate() {
		return validityEdate;
	}

	public void setValidityEdate(String validityEdate) {
		this.validityEdate = validityEdate;
	}

	public List<Item> getItemPlayList() {
		return itemPlayList;
	}

	public void setItemPlayList(List<Item> itemPlayList) {
		this.itemPlayList = itemPlayList;
	}
}
