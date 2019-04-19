package com.vshow.control.log;

import java.util.Collections;
import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;

public class ClientLogListAction extends ActionSupport {
	
	private List<String> fileZips;
	@Override
	public String execute() throws Exception {
		
		fileZips=FileHandle.readfile(Constant.LOG);
		
		Collections.reverse(fileZips); // 倒序排列 
		
		return SUCCESS;
	}
	public List<String> getFileZips() {
		return fileZips;
	}
	public void setFileZips(List<String> fileZips) {
		this.fileZips = fileZips;
	}
	
}
