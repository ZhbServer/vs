package com.vshow.control.fbl;

import java.io.File;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;

import com.vshow.control.tool.SqlConnect;

public class DelFblAction implements Action {
	

	private int[] qx;  //分辨率id
	

	

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		/**
		 * 删除节目
		 * 删除互动节目
		 */
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		
		/**
		 * 删除分辨率
		 * */
		
		for (int i = 0; i < qx.length; i++) {
			Fbl fbl=(Fbl)sm.queryForObject("sel_fbl_all_id" ,qx[i]);
			SqlConnect.getSqlMapInstance().delete("del_fbl", qx[i]);
			LogHandle.insertTheLog(LogType.type60, urid,Constant.LOCAL.getA00175()+":" + fbl.getName(), 1,1);
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
