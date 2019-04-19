package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

public class ProgramDataSource extends ProgramPublic {
	
	
	private int rows;  //行号

	private int cols;  //列

	private int showType;  //显示方式  1 横向  ， 2 纵向    （标题横向   ， 标题纵向） 

	private int titleState;  //是否显示标题  (0不显示  1显示)

	private int borderState;  //边框显示像素 (0不显示)
	
	private String borderColor;  //边框显示颜色
	
    private int refresh;  //切换时间(秒)
	
	private int scrollType; //滚动方式  1翻页  2向上
	
	public int getRefresh() {
		return refresh;
	}

	public void setRefresh(int refresh) {
		this.refresh = refresh;
	}

	public int getScrollType() {
		return scrollType;
	}

	public void setScrollType(int scrollType) {
		this.scrollType = scrollType;
	}

	
	
	
	
	
	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	private List<ProgramDataSourceUnit> title = new ArrayList<ProgramDataSourceUnit>();  //资源集合
	
	

	public List<ProgramDataSourceUnit> getTitle() {
		return title;
	}

	public void setTitle(List<ProgramDataSourceUnit> title) {
		this.title = title;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getCols() {
		return cols;
	}

	public void setCols(int cols) {
		this.cols = cols;
	}

	public int getShowType() {
		return showType;
	}

	public void setShowType(int showType) {
		this.showType = showType;
	}

	public int getTitleState() {
		return titleState;
	}

	public void setTitleState(int titleState) {
		this.titleState = titleState;
	}

	public int getBorderState() {
		return borderState;
	}

	public void setBorderState(int borderState) {
		this.borderState = borderState;
	}
	
	

	


}
