package com.vshow.control.protocol;

import java.util.ArrayList;
import java.util.List;

public class ProtocolDataSource {
	
	

	private  String dataSource;    //  数据源  [[{"key":"id","value":"主键"},{"key":"name","value":"姓名"}],[{"key":"id","value":"主键2"},{"key":"name","value":"姓名2"}]] 
	
	private int opt=0;  //0替换  , 1 追加   ,2 清理
	
	private int showPos=0; // 0从上   1从下
	
	
    

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public int getOpt() {
		return opt;
	}

	public void setOpt(int opt) {
		this.opt = opt;
	}

	public int getShowPos() {
		return showPos;
	}

	public void setShowPos(int showPos) {
		this.showPos = showPos;
	}


}
