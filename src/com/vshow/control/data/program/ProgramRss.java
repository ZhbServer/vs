package com.vshow.control.data.program;
/**
 * 
 * @author w
 * RSS
 *
 */
public class ProgramRss extends ProgramPublic {

	private String rurl;        //获取rss数据源地址 json格式
	private String dx;          //字体大小
	private String ys;          //字体颜色
	private String speed;       //滚动速度
	private int refreshTime;    //刷新时间(秒S)
	private int gdfs;           //滚动方式 1从下往上,2从右往左  
	
	
	public int getGdfs() {
		return gdfs;
	}
	public void setGdfs(int gdfs) {
		this.gdfs = gdfs;
	}
	public String getRurl() {
		return rurl;
	}
	public void setRurl(String rurl) {
		this.rurl = rurl;
	}
	public String getDx() {
		return dx;
	}
	public void setDx(String dx) {
		this.dx = dx;
	}
	public String getYs() {
		return ys;
	}
	public void setYs(String ys) {
		this.ys = ys;
	}
	public String getSpeed() {
		return speed;
	}
	public void setSpeed(String speed) {
		this.speed = speed;
	}
	public int getRefreshTime() {
		return refreshTime;
	}
	public void setRefreshTime(int refreshTime) {
		this.refreshTime = refreshTime;
	}
}
