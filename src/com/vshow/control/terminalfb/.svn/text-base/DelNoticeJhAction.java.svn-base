package com.vshow.control.terminalfb;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelNoticeJhAction extends ActionSupport {

	private int id;

	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		//删除通知计划表
		sm.delete("del_one_noticejh", id);
		//删除通知表
		sm.delete("del_notice_relation",id);
		//删除通知计划关系表
		sm.delete("del_one_noticejh_relation",id);
		
		
		
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}