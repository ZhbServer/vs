package com.vshow.control.tb;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Tb;
import com.vshow.control.tool.SqlConnect;

public class DeleteTbAction extends ActionSupport {
	
	
   
    
	private int tbId;
	
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		
		SqlConnect.getSqlMapInstance().delete("del_tb", tbId);
		
		return SUCCESS;
	}



	public int getTbId() {
		return tbId;
	}



	public void setTbId(int tbId) {
		this.tbId = tbId;
	}

	
}
