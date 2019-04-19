package com.vshow.control.data;

public class UserToken {
	
	private int id;
	private String token;
	private String account;
	private String create_time;
	private String last_edit_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getLast_edit_time() {
		return last_edit_time;
	}
	public void setLast_edit_time(String last_edit_time) {
		this.last_edit_time = last_edit_time;
	}

}
