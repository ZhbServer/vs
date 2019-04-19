package com.vshow.control.data;

/** 用户 */
public class UserCheck extends PublicData {
	
	private int id;
	private String account;
	private String sdate;
	private String ip;
	private int type;      // 1 登陆 2注销退出
	private int state;     // 登陆状态 1 成功 2失败
	private int failState; //失败后禁用状态 1禁用 0取消

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getFailState() {
		return failState;
	}

	public void setFailState(int failState) {
		this.failState = failState;
	}

}
