package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxAdJhDpItemAction implements Action {

	private int jhid;   //计划id
	private String filenames;  //节目ids
	private String itemnames;  //节目名
	
	private String info;
	private int  day=0;
	
	private int jhitemId;
	
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
		
		JhItem jt=new JhItem();
		jt.setId(jhitemId);
		jt.setItemids(filenames);
	    jt.setItemnames(itemnames);
		
		SqlConnect.getSqlMapInstance().update("upd_jhitem_itemid", jt);
		
		return GsonUtil.getGson(info);
	}

	public int getJhitemId() {
		return jhitemId;
	}

	public void setJhitemId(int jhitemId) {
		this.jhitemId = jhitemId;
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
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

}
