package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.data.JhItem;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelJhDpItemAction implements Action {

	
	
	
	
	private int jhitemId;
	
	@Override
	public String execute() throws Exception {
		
		JhItem jhitem=new JhItem();
		jhitem.setId(jhitemId);
		jhitem.setItemids("");
		jhitem.setItemnames("");
		SqlConnect.getSqlMapInstance().update("upd_jhitem_itemid", jhitem);
		
		return SUCCESS;
		
	}

	public int getJhitemId() {
		return jhitemId;
	}

	public void setJhitemId(int jhitemId) {
		this.jhitemId = jhitemId;
	}
	
 

}
