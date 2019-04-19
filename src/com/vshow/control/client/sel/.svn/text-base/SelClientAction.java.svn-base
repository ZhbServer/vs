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
public class SelClientAction implements Action {


	private String content;

	private List<Client> clientlist;
	
	public String execute() throws Exception {
		
		clientlist = (List<Client>) SqlConnect.getSqlMapInstance().queryForList("tdxs_sel_client_all");
		
		JSONArray jsons1 = JSONArray.fromObject(clientlist);
		
		content = jsons1.toString();
		
		return SUCCESS;
		
	}

	public List<Client> getClientlist() {
		return clientlist;
	}

	public void setClientlist(List<Client> clientlist) {
		this.clientlist = clientlist;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
