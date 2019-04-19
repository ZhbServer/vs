package com.vshow.control.apk;



import java.io.File;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Apk;
import com.vshow.control.data.Fbl;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;

import com.vshow.control.tool.SqlConnect;

public class DelApkAction implements Action {
	

	private int[] qx;  //分辨率id

	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		/**
		 * 删除apk
		 * */
		
		Apk apk;
		
		for (int i = 0; i < qx.length; i++) {
		
			apk=(Apk)SqlConnect.getSqlMapInstance().queryForObject("sel_apk_all_id",qx[i]);
			
			if(apk!=null){
			
				FileHandle.deleteFile(Constant.FILES+File.separator+apk.getFilename());
				
				SqlConnect.getSqlMapInstance().delete("del_apk", qx[i]);
			
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
