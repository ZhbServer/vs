package com.vshow.control.data;

/***
 * 终端绑定
 * 
 * @author Administrator
 * 
 */
public class ClientBind extends PublicData {
	private int id;
	private String name; // 绑定名称
	private int cid; // 终端Id
	private int uid; //用户id

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
