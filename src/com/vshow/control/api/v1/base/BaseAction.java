package com.vshow.control.api.v1.base;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.User;

public class BaseAction extends ActionSupport {
	
	protected ResponseEntity responseEntity;
	
	private String access_token;
	
	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public ResponseEntity getResponseEntity() {
		return responseEntity;
	}

	public void setResponseEntity(ResponseEntity responseEntity) {
		this.responseEntity = responseEntity;
	}

}
