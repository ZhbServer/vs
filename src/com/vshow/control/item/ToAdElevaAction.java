package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAdElevaAction implements Action {

	private List list;
	
	private String selfCity="";
		
	

	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		list = sm.queryForList("see_tq_all");
		
	    return SUCCESS;
	}
	
	

	public String getSelfCity() {
		return selfCity;
	}



	public void setSelfCity(String selfCity) {
		this.selfCity = selfCity;
	}



	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	
	
	
}
