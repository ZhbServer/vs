package com.vshow.control.data.client.interact;

import java.util.List;

public class ResourceData {
	
	
	private String code; // 返回值
    // 00000 认证成功      00001点位不够无法认证      00002已经认证
    // 00003 账户或者密码不合法      00004 参数不合法
    // 00005 当前用户人脸识别 未分配点位
	
    private String mark; // 终端标识
    private String content; // 内容说明
    private String username; // 用户名账户
    private String password; // 密码 已加密
    
    private List<String> marks;  //验证的标识
    
    private int allPoint;   //总点位
	private int relPoint;  //剩余点位
    
    
    public int getAllPoint() {
		return allPoint;
	}

	public void setAllPoint(int allPoint) {
		this.allPoint = allPoint;
	}

	public int getRelPoint() {
		return relPoint;
	}

	public void setRelPoint(int relPoint) {
		this.relPoint = relPoint;
	}


    
    public List<String> getMarks() {
		return marks;
	}

	public void setMarks(List<String> marks) {
		this.marks = marks;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

}
