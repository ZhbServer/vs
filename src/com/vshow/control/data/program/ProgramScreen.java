package com.vshow.control.data.program;

/**
 * 
 * @author w
 * 截屏
 *
 */
public class ProgramScreen extends ProgramPublic {

	private String surl;        //获取截屏地址
    private int refreshTime;    //刷新时间(秒S)
	
    
    public String getSurl() {
		return surl;
	}
	public void setSurl(String surl) {
		this.surl = surl;
	}
	public int getRefreshTime() {
		return refreshTime;
	}
	public void setRefreshTime(int refreshTime) {
		this.refreshTime = refreshTime;
	}
  
	
	
	
}
