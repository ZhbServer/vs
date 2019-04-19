package com.vshow.control.rss;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Rss;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelRssAction implements Action {
	
	
	private int[] qx;   
	

	public String execute() throws Exception {
	    int urid = (Integer)ActionContext.getContext().getSession().get("urid");
	    
	    for (int i = 0; i < qx.length; i++) {
	    	Rss rss=(Rss)SqlConnect.getSqlMapInstance().queryForObject("find_rss_byid",qx[i]);
			SqlConnect.getSqlMapInstance().delete("del_rss", qx[i]);
			LogHandle.insertTheLog(LogType.type64, urid,Constant.LOCAL.getA00199()+":" + rss.getName(), 1,1);
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
