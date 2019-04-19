package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.SqlConnect;

public class AdJhItemAction implements Action {

	private int jhid;   //计划id
	private String filenames;  //节目ids
	private String itemnames;  //节目名
	private String validitySdate;  //开始时间
	private String validityEdate;  //结束时间
	private String info;
	private String validityXdate="";  //下载节目
	private int  day=0;
	@Override
	public String execute() throws Exception {
		
		JhItem jt=new JhItem();
		jt.setDay(day);
		jt.setSdate(validitySdate);
		jt.setEdate(validityEdate);
		jt.setJhid(jhid);
		jt.setItemids(filenames);
		jt.setXiadate(validityXdate);
		jt.setItemnames(itemnames);
		SqlConnect.getSqlMapInstance().insert("insert_one_jhitem", jt);
		info="add";
		return SUCCESS;
	}
	
	public String getValidityXdate() {
		return validityXdate;
	}

	public void setValidityXdate(String validityXdate) {
		this.validityXdate = validityXdate;
	}

	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getItemnames() {
		return itemnames;
	}
	public void setItemnames(String itemnames) {
		this.itemnames = itemnames;
	}
	public int getJhid() {
		return jhid;
	}
	public void setJhid(int jhid) {
		this.jhid = jhid;
	}
	public String getFilenames() {
		return filenames;
	}
	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}
	public String getValiditySdate() {
		return validitySdate;
	}
	public void setValiditySdate(String validitySdate) {
		this.validitySdate = validitySdate;
	}
	public String getValidityEdate() {
		return validityEdate;
	}
	public void setValidityEdate(String validityEdate) {
		this.validityEdate = validityEdate;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

}
