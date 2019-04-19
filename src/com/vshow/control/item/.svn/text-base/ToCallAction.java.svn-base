package com.vshow.control.item;

import java.io.File;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;

public class ToCallAction implements Action {

	private int height;
	private int width;
    private int xy_x=0;
	private int xy_y=0;
	private String mfile;
	private String yxSucaiListJson="";
	private String myCallFile="";
	int fileExist;
	private String parmeter;
	public String getParmeter() {
		return parmeter;
	}


	public void setParmeter(String parmeter) {
		this.parmeter = parmeter;
	}


	public String execute() throws Exception {
		
		
		//检测myCall的xml文件是否存在
		fileExist=FileHandle.fileExists(Constant.FILES + File.separator +mfile+File.separator+"myCall.xml");
		
		if(fileExist==1){
			myCallFile="myCall.xml";
		}
		
		
		
		return SUCCESS;
		
		
	}

	
	public String getMyCallFile() {
		return myCallFile;
	}


	public void setMyCallFile(String myCallFile) {
		this.myCallFile = myCallFile;
	}


	public int getFileExist() {
		return fileExist;
	}


	public void setFileExist(int fileExist) {
		this.fileExist = fileExist;
	}


	public String getYxSucaiListJson() {
		return yxSucaiListJson;
	}



	public void setYxSucaiListJson(String yxSucaiListJson) {
		this.yxSucaiListJson = yxSucaiListJson;
	}



	
	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}

	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}

	
	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}


	public String getMfile() {
		return mfile;
	}


	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

}
