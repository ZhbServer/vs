package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelJhItemAction implements Action {

	
	private int[] qx;
	
	private int jhid;
	private int jhtype=3;
	
	@Override
	public String execute() throws Exception {
		//计划id
		for (int i = 0; i < qx.length; i++) {
		   SqlConnect.getSqlMapInstance().delete("del_jh_item", qx[i]);
		}
		String result=SUCCESS;
		if(jhtype==1){
			result= "success2";
		}else if(jhtype==2){
			result= "success3";
		}
		return result;
		
	}
	public int getJhtype() {
		return jhtype;
	}
	public void setJhtype(int jhtype) {
		this.jhtype = jhtype;
	}
	public int[] getQx() {
		return qx;
	}
	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	public int getJhid() {
		return jhid;
	}
	public void setJhid(int jhid) {
		this.jhid = jhid;
	}
	
	
 

}
