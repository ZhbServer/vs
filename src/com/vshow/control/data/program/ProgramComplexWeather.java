package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author w 天气
 * 
 */
public class ProgramComplexWeather extends ProgramPublic {

	private int fresh;  //刷新时间
	private int dx;     //字体大小
	private String wfcolor; //字体颜色
	private List<ProgramWeather> mWeatherList=new ArrayList<ProgramWeather>(); //城市列表
	private int wtype=1;  //天气样式 默认为1

	public int getWtype() {
		return wtype;
	}

	public void setWtype(int wtype) {
		this.wtype = wtype;
	}

	public int getFresh() {
		return fresh;
	}

	public void setFresh(int fresh) {
		this.fresh = fresh;
	}

	public int getDx() {
		return dx;
	}

	public void setDx(int dx) {
		this.dx = dx;
	}

	public String getWfcolor() {
		return wfcolor;
	}

	public void setWfcolor(String wfcolor) {
		this.wfcolor = wfcolor;
	}

	public List<ProgramWeather> getmWeatherList() {
		return mWeatherList;
	}

	public void setmWeatherList(List<ProgramWeather> mWeatherList) {
		this.mWeatherList = mWeatherList;
	}
	

}
