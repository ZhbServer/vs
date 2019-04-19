package com.vshow.control.item.check;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Local;

import com.vshow.control.tool.SqlConnect;

public class OnCheckInteractItemAction extends ActionSupport {
	
	private int qx[];
	private int otype;
	

	
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm=SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "tonoocheckitem.vs");
		int urid = (Integer) session.get("urid");
		Local local= (Local) session.get("local");
		// 追加审核的节目名字
		String logcontent = "";
		InteractItem item;
		
		for (int i = 0; i < qx.length; i++) {
		    item=(InteractItem)sm.queryForObject("sel_id_interactitem", qx[i]);
		    if (logcontent == "") {
				logcontent = item.getName();
			} else {
				logcontent = logcontent + "," + item.getName();
			}
		    
		    item.setOcheck(otype);
		    sm.update("upd_intetact_item_ocheck", item);
		}
		String logt="";
		if(otype==1){
			logt=local.getA00596();
		}else if(otype==2){
			logt=local.getA00592();
		}
		LogHandle.insertTheLog(LogType.type38, urid, logt+"["+local.getA00434()+"]"+":"+logcontent, 1,1);
		
		return SUCCESS;
	}
	
	public void setOtype(int otype) {
		this.otype = otype;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
