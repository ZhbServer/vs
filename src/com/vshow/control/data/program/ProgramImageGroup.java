package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

public class ProgramImageGroup extends ProgramPublic{

	
	
	
	//播放列表
    private List<ProgramImageGroupMedia> mMediaImageGroupMediaList=new ArrayList<ProgramImageGroupMedia>();

	//图片组显示方式  0平铺  1等比列
    private int imageGroupShowType;
    
    //图片组滚动方式  0静态 1向左  2向右
    private int imageGroupScrollType;
    
    //图片组
    //private int imageGroupShowNumber;
    
    //翻书第一页是否显示封面 1显示  0不显示
    private int isShowIndex; 
    

	public int getIsShowIndex() {
		return isShowIndex;
	}

	public void setIsShowIndex(int isShowIndex) {
		this.isShowIndex = isShowIndex;
	}

	public List<ProgramImageGroupMedia> getmMediaImageGroupMediaList() {
		return mMediaImageGroupMediaList;
	}

	public void setmMediaImageGroupMediaList(
			List<ProgramImageGroupMedia> mMediaImageGroupMediaList) {
		this.mMediaImageGroupMediaList = mMediaImageGroupMediaList;
	}

	public int getImageGroupShowType() {
		return imageGroupShowType;
	}

	public void setImageGroupShowType(int imageGroupShowType) {
		this.imageGroupShowType = imageGroupShowType;
	}

	public int getImageGroupScrollType() {
		return imageGroupScrollType;
	}

	public void setImageGroupScrollType(int imageGroupScrollType) {
		this.imageGroupScrollType = imageGroupScrollType;
	}
    
    
    
	
}
