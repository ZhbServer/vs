package com.vshow.control.terminalfb;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class DelNoticeAction extends ActionSupport {

	private int nid;
	private int jid;

	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
	
		//删除通知表
		sm.delete("del_notice",nid);
		//删除通知计划关系表
		sm.delete("del_one_noticejh_relation_nid",nid);
		
		
		
		return SUCCESS;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public int getJid() {
		return jid;
	}

	public void setJid(int jid) {
		this.jid = jid;
	}

	

	
}