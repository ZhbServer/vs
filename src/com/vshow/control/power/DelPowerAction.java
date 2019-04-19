package com.vshow.control.power;


import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;


public class DelPowerAction implements Action {
	
	
	private int[] qx;  //权限id
	

	@Override
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
        List<Integer> pusers;
		for (int i = 0; i < qx.length; i++) {
			//获取关联用户
			pusers=SqlConnect.getSqlMapInstance().queryForList("sel_user_id_powerid", qx[i]);
			for (int j = 0; j < pusers.size(); j++) {
				//权限id更新为0
				SqlConnect.getSqlMapInstance().update("update_user_powerid", pusers.get(j));
			}
			
			String pname=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_power_name_id", qx[i]);
			SqlConnect.getSqlMapInstance().delete("del_power", qx[i]);
			
			SqlConnect.getSqlMapInstance().delete("del_powerExpand", qx[i]);
			
			if (pname != null) {
				LogHandle.insertTheLog(LogType.type58, urid,Constant.LOCAL.getA00173() + ":" + pname,1,1);
			}
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
