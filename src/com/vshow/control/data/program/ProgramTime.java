package com.vshow.control.data.program;

/**
 * 
 * @author w 时间
 * 
 */
public class ProgramTime extends ProgramPublic {
	
	private int tType;   //1.当前时间显示 2.正计时 3倒计时
	private int tsType;  //当前时间显示 
	                     //1.yyyy-MM-dd
	                     //2.yyyy年MM月dd日
	                     //3.MM-dd-yyyy
	                     //4.HH:mm:ss
	                     //5.HH:mm
	                     //6.HH时mm分ss秒
	                     //7.星期
	                     //8.yyyy年MM月dd日 EEEE HH:mm:ss
	                     //9.MM月dd日yyyy年 EEEE HH:mm:ss
	
    private int  ttDa;   //计时显示  天	(0不显示 1显示)
    private int  ttHo;   //计时显示  时	(0不显示 1显示)
    private int  ttMi;   //计时显示  分	(0不显示 1显示)
    private int  ttSs;   //计时显示  秒	(0不显示 1显示)
    private String ttTimePoint;   // 计时时间点  yyyy-MM-dd HH:mm:ss
    private int  fs;     //字体大小
    private String  fcolor;//字体颜色
    
    private int  unitShow;//单位显示   0显示  不显示
    
    
    
    
    
   
	public int getUnitShow() {
		return unitShow;
	}
	public void setUnitShow(int unitShow) {
		this.unitShow = unitShow;
	}
	public String getTtTimePoint() {
		return ttTimePoint;
	}
	public void setTtTimePoint(String ttTimePoint) {
		this.ttTimePoint = ttTimePoint;
	}
	
    
    
    public int gettType() {
		return tType;
	}
	public void settType(int tType) {
		this.tType = tType;
	}
	public int getTsType() {
		return tsType;
	}
	public void setTsType(int tsType) {
		this.tsType = tsType;
	}
	public int getTtDa() {
		return ttDa;
	}
	public void setTtDa(int ttDa) {
		this.ttDa = ttDa;
	}
	public int getTtHo() {
		return ttHo;
	}
	public void setTtHo(int ttHo) {
		this.ttHo = ttHo;
	}
	public int getTtMi() {
		return ttMi;
	}
	public void setTtMi(int ttMi) {
		this.ttMi = ttMi;
	}
	public int getTtSs() {
		return ttSs;
	}
	public void setTtSs(int ttSs) {
		this.ttSs = ttSs;
	}
	public int getFs() {
		return fs;
	}
	public void setFs(int fs) {
		this.fs = fs;
	}
	public String getFcolor() {
		return fcolor;
	}
	public void setFcolor(String fcolor) {
		this.fcolor = fcolor;
	}
	
}
