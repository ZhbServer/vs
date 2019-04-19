package com.vshow.control.data.program;

/**
 * 
 * @author w
 * 公交巴士集中显示
 *
 */
public class ProgramBus extends ProgramPublic {
     
	
	private int sline;//显示行数
	private int sdx;//字体大小
	private String sys;//字体颜色

	private String sbys;//背景颜色
	
	
	
	public int getSline() {
		return sline;
	}
	public void setSline(int sline) {
		this.sline = sline;
	}
	public int getSdx() {
		return sdx;
	}
	public void setSdx(int sdx) {
		this.sdx = sdx;
	}
	public String getSys() {
		return sys;
	}
	public void setSys(String sys) {
		this.sys = sys;
	}
	
	public String getSbys() {
		return sbys;
	}
	public void setSbys(String sbys) {
		this.sbys = sbys;
	}
	
}
