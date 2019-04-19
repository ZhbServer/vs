package com.vshow.control.data;

public class Dish extends PublicData {
 
	private int id;
	private int uid;
	private String content;
	private String create_time;
	private String last_edit_time;
	private String title;
	
	private int oncheck;   //审核状态  0未审核  1审核
	
	private String uname;
	private String tkey;
	
	
	
	
	public String getTkey() {
		return tkey;
	}
	public void setTkey(String tkey) {
		this.tkey = tkey;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOncheck() {
		return oncheck;
	}
	public void setOncheck(int oncheck) {
		this.oncheck = oncheck;
	}
	
	
}
