package com.vshow.control.data;

public class DownLoad {
	private int id;
	private String downstatus;
	private String downkey;
	private String namesub;
	private int uid;
	private int lid;
	private int cid;
	private int rid;
	private String sdate; // 更新时间
	private int startid; // 分页
	private String content; // 执行内容
	private String contentsub;  //执行结果;
	private String name; // 终端名
	private String mark;
	private String ip;
	private String last; // 终端最后连接时间
	private int zxstate;    //在线状态
	private int state;    //执行状态
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDownstatus() {
		return downstatus;
	}

	public void setDownstatus(String downstatus) {
		this.downstatus = downstatus;
	}

	public String getDownkey() {
		return downkey;
	}

	public void setDownkey(String downkey) {
		this.downkey = downkey;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public int getStartid() {
		return startid;
	}

	public void setStartid(int startid) {
		this.startid = startid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLast() {
		return last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public int getZxstate() {
		return zxstate;
	}

	public void setZxstate(int zxstate) {
		this.zxstate = zxstate;
	}

	public String getContentsub() {
		return contentsub;
	}

	public void setContentsub(String contentsub) {
		this.contentsub = contentsub;
	}

	public String getNamesub() {
		return namesub;
	}

	public void setNamesub(String namesub) {
		this.namesub = namesub;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

}
