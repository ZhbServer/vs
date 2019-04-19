package com.vshow.control.log;

import java.io.File;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DelClientLogAction extends ActionSupport {
	
	
	private String[] qx;
	
	@Override
	public String execute() throws Exception {
		
		String files="";
		for (int i = 0; i < qx.length; i++) {
			files=qx[i].replace(".zip", "").replace(".ZIP", "");
			FileHandle.delFolder(Constant.LOG+File.separator+files);
			FileHandle.deleteFile(Constant.LOG+File.separator+qx[i]);
		}
		
		return SUCCESS;
	}

	public String[] getQx() {
		return qx;
	}

	public void setQx(String[] qx) {
		this.qx = qx;
	}

	
}
