package com.vshow.control.screen;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Screen;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelScreenAction implements Action {
  
	private int[] qx;   


	


	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		Screen screen;
		for (int i = 0; i < qx.length; i++) {
			screen=(Screen)SqlConnect.getSqlMapInstance().queryForObject("sel_screen_all_id", qx[i]);
			LogHandle.insertTheLog(LogType.type66, urid,Constant.LOCAL.getA00197()+":" + screen.getName(), 1,1);
			SqlConnect.getSqlMapInstance().delete("del_screen",qx[i]);	
		}
		
		
		return SUCCESS;
	}
	
	
	public int[] getQx() {
		return qx;
	}


	public void setQx(int[] qx) {
		this.qx = qx;
	}

}
