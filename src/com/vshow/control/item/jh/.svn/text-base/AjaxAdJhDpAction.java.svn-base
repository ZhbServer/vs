package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxAdJhDpAction implements Action {

	private int jhid;   //计划id

	private String info;

	private int  day=0;
	
	private String  sdate;
	@Override
	public String execute() throws Exception {
		
		//更新计划审核状态
		Jh jh = new Jh();
		jh.setId(jhid);
		Integer jhocheck = (Integer)  ActionContext.getContext().getSession().get("jhocheck");
		if(jhocheck==null){
			jhocheck=2;
		}
		jh.setOcheck(jhocheck);
		
		SqlConnect.getSqlMapInstance().update("upd_jh_ocheck",jh);
		
		//int jdNum=60/Integer.parseInt(sdate);
		
		JhItem jt;
		
		for (int i = 0; i <Integer.parseInt(sdate); i++) {
			
			jt=new JhItem();
			jt.setDay(day);
			jt.setSdate(sdate);
			jt.setEdate((i+1)+"");
			jt.setJhid(jhid);
			jt.setItemids("");
			jt.setXiadate("");
			jt.setItemnames("");
			SqlConnect.getSqlMapInstance().insert("insert_one_jhitem", jt);
			
		}
	
		return GsonUtil.getGson(info);
	}
	
	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	public int getJhid() {
		return jhid;
	}
	public void setJhid(int jhid) {
		this.jhid = jhid;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

}
