package com.vshow.control.zdy.item.factoryplan;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.FactoryPlan;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelFpAction implements Action {

	
	private int[] qx;
	
	@Override
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		String jhnames="";
		String tempjhname="";
		
		//计划id
		for (int i = 0; i < qx.length; i++) {
			tempjhname=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_factoryplan_name",qx[i]);
			if(jhnames.length()==0){
				jhnames=tempjhname;
			}else{
				jhnames=jhnames+","+tempjhname;
			}
			
			SqlConnect.getSqlMapInstance().delete("delete_fp_item_byfid", qx[i]);
			SqlConnect.getSqlMapInstance().delete("delete_factoryplan", qx[i]);
		}
		//添加日志
		LogHandle.insertTheLog(LogType.type16, urid,Constant.LOCAL.getA00651()+"["+Constant.LOCAL.getA01042()+"]:" +jhnames, 1,1);
		
		return SUCCESS;
	}
	
	public int[] getQx() {
		return qx;
	}
	
	public void setQx(int[] qx) {
		this.qx = qx;
	}

}
