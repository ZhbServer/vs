package com.vshow.control.dish;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Dish;
import com.vshow.control.data.Item;
import com.vshow.control.data.Jh;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Local;

import com.vshow.control.tool.SqlConnect;

public class OnCheckDataAction extends ActionSupport {
	
	
	
	private int qx[];
	
	private int otype;   //1审核通过  2审核不通过    
	

	
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm=SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		session.put("url", "tonoocheckdata.vs");
		
		int urid = (Integer) session.get("urid");
		
		Local local= (Local) session.get("local");
		
		// 追加审核的节目名字
		String logcontent = "";
		
		Dish dish;
		String dataName="";
		for (int i = 0; i < qx.length; i++) {
			
			dataName=(String)sm.queryForObject("sel_dish_title_id", qx[i]);
		    if (logcontent == "") {
				logcontent = dataName;
			} else {
				logcontent = logcontent + "," + dataName;
			}
		    dish=new Dish();
		    dish.setId(qx[i]);
		    dish.setOncheck(otype);
		    sm.update("up_data_oncheck", dish);
		}
		
		String logt="";
		
		if(otype==1){
			
			logt=local.getA00596();
		
		}else if(otype==2){
			
			logt=local.getA00592();
		
		}
		
		String ocheckTypeName="";
		
	
		
		LogHandle.insertTheLog(LogType.type115, urid, logt+":"+logcontent, 1,1);
		
		return SUCCESS;
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
