package com.vshow.control.data;


/***
 * 系统信息类型
 * @author w
 *
 */
public class SystemInfo {
	
	public static final long NEW_MSG_PROTOCOL = 1;// 数据逻辑处理类(letv)
    public static final long NEW_PROTOCOL = 2;// socket通信协议类
    public static final long PROTOCOL_4_B = 3;// 字节长度改为4字节存储
    
   
	private long systemDate;       //系统时间
	private long versionCode=PROTOCOL_4_B;//内部版本号  1开始发布下载接收新的协议 2. byte 接收 1  3 byte接收 4
	private int postType=0;        //执行结果返回方式    0 socket  1 http post

	
	public int getPostType() {
		return postType;
	}

	public void setPostType(int postType) {
		this.postType = postType;
	}
	
	public long getVersionCode() {
		return versionCode;
	}

	public void setVersionCode(long versionCode) {
		this.versionCode = versionCode;
	}

	public long getSystemDate() {
		return systemDate;
	}

	public void setSystemDate(long systemDate) {
		this.systemDate = systemDate;
	}

}
