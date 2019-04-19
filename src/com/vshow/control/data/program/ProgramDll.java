package com.vshow.control.data.program;

public class ProgramDll extends ProgramPublic {

	private int rows;     //行 
	
	private int columns;  //列
	
	private int type;     //101充电桩
	
	private String city;

	private String happyVal;  //开心最小值
	   
	private String uncomVal;  //难受大值
	
	private String callUrl;   //叫号控件
	
	private String parmeter;  //控件名称

	private String tTargetId;//目标控件
	
	private String ycCount;//轮播 列表 显示行数
	
	public String getYcCount() {
		return ycCount;
	}

	public void setYcCount(String ycCount) {
		this.ycCount = ycCount;
	}

	public String gettTargetId() {
		return tTargetId;
	}

	public void settTargetId(String tTargetId) {
		this.tTargetId = tTargetId;
	}

	public String getParmeter() {
		return parmeter;
	}

	public void setParmeter(String parmeter) {
		this.parmeter = parmeter;
	}

	public String getCity() {
		return city;
	}

	public String getHappyVal() {
		return happyVal;
	}

	public void setHappyVal(String happyVal) {
		this.happyVal = happyVal;
	}

	public String getCallUrl() {
		return callUrl;
	}

	public void setCallUrl(String callUrl) {
		this.callUrl = callUrl;
	}

	public String getUncomVal() {
		return uncomVal;
	}

	public void setUncomVal(String uncomVal) {
		this.uncomVal = uncomVal;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getColumns() {
		return columns;
	}

	public void setColumns(int columns) {
		this.columns = columns;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
