package com.vshow.control.data;

import java.util.List;

/***
 * 终端分组一级
 * 
 * @author Administrator
 * 
 */
public class ClientGroup extends PublicData {
	
	private int id;
	private int uid;
	private String gname; // 一级终端分组名
	private int gclientc;//终端总个数
    private int level;   //分组级别
    private String tkey;  
    private int pid;     //父级id
    private String pname;  //父级分组名
    private String p1name; //父级父级分组名
    
    private List<Client> clients;  //终端集合
    
	public List<Client> getClients() {
		return clients;
	}
	public void setClients(List<Client> clients) {
		this.clients = clients;
	}
	public String getP1name() {
		return p1name;
	}
	public void setP1name(String p1name) {
		this.p1name = p1name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGclientc() {
		return gclientc;
	}
	public void setGclientc(int gclientc) {
		this.gclientc = gclientc;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getTkey() {
		return tkey;
	}
	public void setTkey(String tkey) {
		this.tkey = tkey;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}


	

}
