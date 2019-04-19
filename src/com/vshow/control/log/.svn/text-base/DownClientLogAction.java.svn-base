package com.vshow.control.log;



import java.io.File;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DownClientLogAction extends ActionSupport {

	private String filename;
	

	public String execute() throws Exception {
              
		return SUCCESS;
	}

	

	

	public static void main(String[] args) {
		DoZip zip = new DoZip();
		String olddir = "E:" + File.separator + "camera";
		try {
			zip.zip(olddir, olddir + ".zip");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
