package com.vshow.control.item;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Scene;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


public class AjaxCheckSceneSubAccountAction extends ActionSupport {
	
	
	private String fileName;
	
	private String rcontent="";  //返回写入区内容
	
	public String execute() throws Exception {
	
		Scene tempScenesub=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scfilename_scene_sub",fileName);
		if(tempScenesub==null){
			rcontent="0";
		}else{
			rcontent="1";
		}
		return  GsonUtil.getGson(rcontent);
		
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	
	
}
