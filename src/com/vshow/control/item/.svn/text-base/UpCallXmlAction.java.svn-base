package com.vshow.control.item;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class UpCallXmlAction implements Action {

	private File callFile;
	private String mfile;
	private String callFileFileName;
	
	private int fileExist;
	private String info;
	private String parmeter;

	public String execute() throws Exception {
		
		FileHandle.deleteFile(Constant.FILES + File.separator +mfile+File.separator+"myCall.xml");

		File temfs = new File(Constant.FILES + File.separator +mfile+File.separator+"myCall.xml");
	
		callFile.renameTo(temfs);
		
		info="mycall|"+fileExist+"|"+parmeter;

		return SUCCESS;
	}

	public String getParmeter() {
		return parmeter;
	}

	public void setParmeter(String parmeter) {
		this.parmeter = parmeter;
	}

	public int getFileExist() {
		return fileExist;
	}

	public void setFileExist(int fileExist) {
		this.fileExist = fileExist;
	}

	public File getCallFile() {
		return callFile;
	}

	public void setCallFile(File callFile) {
		this.callFile = callFile;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public String getCallFileFileName() {
		return callFileFileName;
	}

	public void setCallFileFileName(String callFileFileName) {
		this.callFileFileName = callFileFileName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	
	
	
	
}
