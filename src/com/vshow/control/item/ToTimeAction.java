package com.vshow.control.item;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

public class ToTimeAction implements Action {

	
	
	private int tType=1;     //1.当前时间显示 2.正计时 3倒计时
	private int tsType=1;    //当前时间显示 
	                         //1.yyyy-MM-dd
	                         //2.yyyy年MM月dd日
	                         //3.MM-dd-yyyy
	                         //4.HH:mm:ss
	                         //5.HH:mm
	                         //6.HH时mm分ss秒
	                         //7.星期	
	private int  ttDa=1;     //计时显示  天	(0不显示 1显示)
    private int  ttHo=1;     //计时显示  时	(0不显示 1显示)
    private int  ttMi=1;     //计时显示  分	(0不显示 1显示)
    private int  ttSs=1;     //计时显示  秒	(0不显示 1显示)
    private String ttTimePoint;   // 计时时间点  yyyy-MM-dd HH:mm:ss
    private int  fs=24;       //字体大小
    private String  fcolor="000000";//字体颜色
	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	private int tKtype=2;  //计时类型
	
	private int advancedType;  //字体显示类型  0默认 1高级
	
	private int unitShow=0;      //倒计时单位是否显示  0不显示 1显示
	
	



	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Local local= (Local) session.get("local");
		
		if(ttTimePoint==null||ttTimePoint.equals("0")){			
			ttTimePoint=Constant.getCurrentDate();
		}
		
		if(tType==1){
			tKtype=2;
		}else if(tType==2){
			tKtype=2;
		}else if(tType==3){
			tKtype=3;
		}
		return SUCCESS;
	}

	public int gettKtype() {
		return tKtype;
	}

	public void settKtype(int tKtype) {
		this.tKtype = tKtype;
	}

	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}

	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
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

	public String getTtTimePoint() {
		return ttTimePoint;
	}

	public int getAdvancedType() {
		return advancedType;
	}

	public void setAdvancedType(int advancedType) {
		this.advancedType = advancedType;
	}

	public void setTtTimePoint(String ttTimePoint) {
		this.ttTimePoint = ttTimePoint;
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
	
	public int getUnitShow() {
		return unitShow;
	}

	public void setUnitShow(int unitShow) {
		this.unitShow = unitShow;
	}
	
	
}
