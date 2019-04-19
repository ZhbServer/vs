package com.vshow.control.client.sel;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;

import com.vshow.control.data.User;

import com.vshow.control.tool.SqlConnect;


/**
 * 获取到全部终端
 */
public class SelClientMobileAction implements Action {


	private String itemIds;
	
	private int sendType;  //0发布节目  1发布菜价信息
	
	public String execute() throws Exception {
		
		
		return SUCCESS;
		
		
	}

	public int getSendType() {
		return sendType;
	}

	public void setSendType(int sendType) {
		this.sendType = sendType;
	}

	public String getItemIds() {
		return itemIds;
	}

	public void setItemIds(String itemIds) {
		this.itemIds = itemIds;
	}
	
	
	

	
}
