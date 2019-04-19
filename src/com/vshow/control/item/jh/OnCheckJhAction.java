package com.vshow.control.item.jh;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;
import com.vshow.control.data.Jh;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Local;

import com.vshow.control.tool.SqlConnect;

public class OnCheckJhAction extends ActionSupport {
	
	
	
	private int qx[];
	
	private int otype;   //1审核通过  3审核不通过    
	
    private int type;    // 1轮播  2插播  
	
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm=SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		session.put("url", "tonoocheckjh.vs?type="+type);
		
		int urid = (Integer) session.get("urid");
		
		Local local= (Local) session.get("local");
		
		// 追加审核的节目名字
		String logcontent = "";
		
		Jh jh;
		
		String jhName="";
		for (int i = 0; i < qx.length; i++) {
			
			jhName=(String)sm.queryForObject("sel_jh_name", qx[i]);
		    if (logcontent == "") {
				logcontent = jhName;
			} else {
				logcontent = logcontent + "," + jhName;
			}
		    jh=new Jh();
		    jh.setId(qx[i]);
		    jh.setOcheck(otype);
		    sm.update("upd_jh_ocheck", jh);
		}
		
		String logt="";
		
		if(otype==1){
			
			logt=local.getA00596();
		
		}else if(otype==3){
			
			logt=local.getA00592();
		
		}
		
		String ocheckTypeName="";
		
		if(type==1){
			
			ocheckTypeName=local.getA00647();
				
		}else if(type==2){
			
			ocheckTypeName=local.getA00648();
			
		}
		
		LogHandle.insertTheLog(LogType.type39, urid, logt+"["+ocheckTypeName+"]"+":"+logcontent, 1,1);
		
		return SUCCESS;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int[] getQx() {
		return qx;
	}

	public int getOtype() {
		return otype;
	}

	public void setOtype(int otype) {
		this.otype = otype;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
}
