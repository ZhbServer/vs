package com.vshow.control.projection;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Projection;


import com.vshow.control.tool.SqlConnect;

public class AddProjectionAction implements Action {
	
	private Projection pt;

	public String execute() throws Exception {
		
		int urid = (Integer) ActionContext.getContext().getSession().get("urid");
		
		pt.setUid(urid);
		
		if(pt.getBaudrate()==null||pt.getBaudrate().equals("")){
			pt.setBaudrate("0");
		}
		if(pt.getId()==0){			
			SqlConnect.getSqlMapInstance().insert("insert_one_projection", pt);
		}else{
			SqlConnect.getSqlMapInstance().update("update_projection", pt);
		}
		
		return SUCCESS;
	}



	public Projection getPt() {
		return pt;
	}



	public void setPt(Projection pt) {
		this.pt = pt;
	}

}
