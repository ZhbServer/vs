package com.vshow.control.kh.cut;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.tool.SqlConnect;

public class UpCaveatsAction implements Action {

	private int caveat;
	@Override
	public String execute() throws Exception {
		Integer caveatint=(Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_caveat");
		if(caveatint==null){
			
			SqlConnect.getSqlMapInstance().insert("add_caveat", caveat);
		}else{
			SqlConnect.getSqlMapInstance().update("up_caveat",caveat);	
		}
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
	    session.put("caveat", caveat);
		return SUCCESS;
	}
	public int getCaveat() {
		return caveat;
	}
	public void setCaveat(int caveat) {
		this.caveat = caveat;
	}

}
