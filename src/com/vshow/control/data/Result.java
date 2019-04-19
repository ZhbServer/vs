package com.vshow.control.data;

public class Result extends PublicData {
	private int id;
	private int clid;
	private int type;
	

	private int state;      //0未发送
	                        //1已发送
	                        //2操作成功
	                        //10正在下载
	                        //20下载节目 磁盘已满  
	                        //21版本不符无法下载  
	                        //22协议文件无法下载 
	                        //23未知错误 
	                        //24下载节目失败,重启app
	                        //25节目协议解析失败
	                        //26 终端不支持此协议
	                        //27已接收  
	                        //28下载完成 部分文件未下载 
	
	                        
	private int logid;
	private String name;
	private String ip;
	private String mark;

	
	
	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getClid() {
		return clid;
	}

	public void setClid(int clid) {
		this.clid = clid;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getLogid() {
		return logid;
	}

	public void setLogid(int logid) {
		this.logid = logid;
	}

	

	

}
