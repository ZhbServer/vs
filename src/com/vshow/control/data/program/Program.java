package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author w 节目
 * 
 */
public class Program {
	// x坐标
	private int mProgramLeft;
	// y坐标
	private int mProgramTop;
	// 宽
	private int mProgramWidth = -1;
	// 高
	private int mProgramHeight = -1;
	// 节目时间(秒/节目时长只针对于普通节目有效)
	private int mProgramTimeout = -1;
	// 播放次数(未定)
	private int mProgramTimes = 1;
	// 节目文件夹名
	private String mProgram;
	// 背景图片( 0表示无背景)
	private String mBackground = "0";
	// 节目名
	private String mProgramName;
	// 节目大小(参考数据)
	private long mProgramSize;
	// 节目类型(1普通节目 2互动 节目)
	private int mPtype;
	//背景颜色
	private String bgColor;


	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	// 图片 视频 音频
	private List<ProgramComplexMediaManager> mComplexMediaManagerList = new ArrayList<ProgramComplexMediaManager>();

	// rss
	private List<ProgramRss> mRssList = new ArrayList<ProgramRss>();

	// 截屏集合
	private List<ProgramScreen> mScreenList = new ArrayList<ProgramScreen>();

	// 网络摄像头
	private List<ProgramNetCamera> mNetCameraList = new ArrayList<ProgramNetCamera>();

	// 叫号
	private List<ProgramQueue> mQueueList = new ArrayList<ProgramQueue>();

	// 文本
	private List<ProgramTxt> mTxtList = new ArrayList<ProgramTxt>();

	// 汇率
	private List<ProgramHl> mHlList = new ArrayList<ProgramHl>();

	// 天气
	private List<ProgramComplexWeather> mComplexWeatherList = new ArrayList<ProgramComplexWeather>();

	// 网页
	private List<ProgramComplexHtml> mComplexHtmlList = new ArrayList<ProgramComplexHtml>();

	// 时间
	private List<ProgramTime> mTimeList = new ArrayList<ProgramTime>();

	// 公交巴士
	private List<ProgramBus> mBusList = new ArrayList<ProgramBus>();

	// 互动组
	private List<ProgramRecyder> mRecyclerList = new ArrayList<ProgramRecyder>();

	
	// 插件集  
	private List<ProgramPublic> mDlls = new ArrayList<ProgramPublic>();

	
	
	// 数据接口
	private List<ProgramDataSource> mDsource = new ArrayList<ProgramDataSource>();


	public List<ProgramDataSource> getmDsource() {
		return mDsource;
	}

	public void setmDsource(List<ProgramDataSource> mDsource) {
		this.mDsource = mDsource;
	}

	public List<ProgramPublic> getmDlls() {
		return mDlls;
	}

	public void setmDlls(List<ProgramPublic> mDlls) {
		this.mDlls = mDlls;
	}

	public List<ProgramRecyder> getmRecyclerList() {
		return mRecyclerList;
	}

	public void setmRecyclerList(List<ProgramRecyder> mRecyclerList) {
		this.mRecyclerList = mRecyclerList;
	}

	public List<ProgramBus> getmBusList() {
		return mBusList;
	}

	public void setmBusList(List<ProgramBus> mBusList) {
		this.mBusList = mBusList;
	}

	public List<ProgramTime> getmTimeList() {
		return mTimeList;
	}

	public void setmTimeList(List<ProgramTime> mTimeList) {
		this.mTimeList = mTimeList;
	}

	public List<ProgramComplexHtml> getmComplexHtmlList() {
		return mComplexHtmlList;
	}

	public void setmComplexHtmlList(List<ProgramComplexHtml> mComplexHtmlList) {
		this.mComplexHtmlList = mComplexHtmlList;
	}

	public List<ProgramComplexWeather> getmComplexWeatherList() {
		return mComplexWeatherList;
	}

	public void setmComplexWeatherList(
			List<ProgramComplexWeather> mComplexWeatherList) {
		this.mComplexWeatherList = mComplexWeatherList;
	}

	public List<ProgramHl> getmHlList() {
		return mHlList;
	}

	public void setmHlList(List<ProgramHl> mHlList) {
		this.mHlList = mHlList;
	}

	public List<ProgramTxt> getmTxtList() {
		return mTxtList;
	}

	public void setmTxtList(List<ProgramTxt> mTxtList) {
		this.mTxtList = mTxtList;
	}

	public List<ProgramQueue> getmQueueList() {
		return mQueueList;
	}

	public void setmQueueList(List<ProgramQueue> mQueueList) {
		this.mQueueList = mQueueList;
	}

	public List<ProgramNetCamera> getmNetCameraList() {
		return mNetCameraList;
	}

	public void setmNetCameraList(List<ProgramNetCamera> mNetCameraList) {
		this.mNetCameraList = mNetCameraList;
	}

	public List<ProgramScreen> getmScreenList() {
		return mScreenList;
	}

	public void setmScreenList(List<ProgramScreen> mScreenList) {
		this.mScreenList = mScreenList;
	}

	public List<ProgramRss> getmRssList() {
		return mRssList;
	}

	public void setmRssList(List<ProgramRss> mRssList) {
		this.mRssList = mRssList;
	}

	public int getmPtype() {
		return mPtype;
	}

	public void setmPtype(int mPtype) {
		this.mPtype = mPtype;
	}

	public int getmProgramLeft() {
		return mProgramLeft;
	}

	public void setmProgramLeft(int mProgramLeft) {
		this.mProgramLeft = mProgramLeft;
	}

	public int getmProgramTop() {
		return mProgramTop;
	}

	public void setmProgramTop(int mProgramTop) {
		this.mProgramTop = mProgramTop;
	}

	public int getmProgramWidth() {
		return mProgramWidth;
	}

	public void setmProgramWidth(int mProgramWidth) {
		this.mProgramWidth = mProgramWidth;
	}

	public int getmProgramHeight() {
		return mProgramHeight;
	}

	public void setmProgramHeight(int mProgramHeight) {
		this.mProgramHeight = mProgramHeight;
	}

	public int getmProgramTimeout() {
		return mProgramTimeout;
	}

	public void setmProgramTimeout(int mProgramTimeout) {
		this.mProgramTimeout = mProgramTimeout;
	}

	public int getmProgramTimes() {
		return mProgramTimes;
	}

	public void setmProgramTimes(int mProgramTimes) {
		this.mProgramTimes = mProgramTimes;
	}

	public String getmProgram() {
		return mProgram;
	}

	public void setmProgram(String mProgram) {
		this.mProgram = mProgram;
	}

	public String getmBackground() {
		return mBackground;
	}

	public void setmBackground(String mBackground) {
		this.mBackground = mBackground;
	}

	public String getmProgramName() {
		return mProgramName;
	}

	public void setmProgramName(String mProgramName) {
		this.mProgramName = mProgramName;
	}

	public long getmProgramSize() {
		return mProgramSize;
	}

	public void setmProgramSize(long mProgramSize) {
		this.mProgramSize = mProgramSize;
	}

	public List<ProgramComplexMediaManager> getmComplexMediaManagerList() {
		return mComplexMediaManagerList;
	}

	public void setmComplexMediaManagerList(
			List<ProgramComplexMediaManager> mComplexMediaManagerList) {
		this.mComplexMediaManagerList = mComplexMediaManagerList;
	}

}
