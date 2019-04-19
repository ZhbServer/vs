package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

/**
 * 
 * @author w
 * 互动列表
 *
 */
public class 	TouchInteractive {
   
	//当前元素id
	private String tCurrentId;
	
	//目标元素id(目标显示区域)
	private String tTargetId;
	
	//目标触摸类型  1.图片 2.视频 3.网页 4 链接节目 5 事件/动作  6跳转app  10广播跳转   11文本    12发送串口  15链接终端 
	private int tType;
	
	//目标触摸事件  1.下一个 2.上一个  3.播放  4.暂停  5.停止  6.快退  7.快进  8恢复  9替换资源     11全屏 12 状态栏  13投射 14轮播 16显示
	private int tOnclick;
	 
	//无触摸返回时间(秒) 默认为0 无效   , -1 智能返回
	private int tTouchReturnTime=0;
	
	//视频文件集合 1.mp4|2.mp4|3.mp4|4.mp4
	private String tVideoPaths;
	
	//资源集合
	private List<TouchBasis> tResourcesList=new ArrayList<TouchBasis>();
	
	//记录ID不重复
	private String tTouchKey;
	
	
	//跳转地址
	private String tResources;
	
	//触发类型   0单击 1串口接收
	private int  triggerType;
	
	//串口接收值比对
	private String portReceive;
	
	
	//显示串口接收数据(0不显示 1显示)
	private int portReceiveCheckboxV;
	
	//显示串口接收头
	private String portReceiveHead;
	
	//显示串口接收尾
	private String portReceiveTail;
	
	
	//链接终端类型 1互动节目 2待机  3唤醒;
	private int clientClickType;
	
	//链接终端集合
	private List<TouchClient> targetClients=new ArrayList<TouchClient>();
	
	
	  
    public int getClientClickType() {
		return clientClickType;
	}

	public void setClientClickType(int clientClickType) {
		this.clientClickType = clientClickType;
	}

	public List<TouchClient> getTargetClients() {
		return targetClients;
	}

	public void setTargetClients(List<TouchClient> targetClients) {
		this.targetClients = targetClients;
	}

	//翻书第一页是否显示封面 1显示  0不显示
    private int isShowIndex; 
	
    private String mOclickPwd;   //密码
	
    private int mOclickPwdFlag;   //0不设密码  1设置密码
	
	public int getmOclickPwdFlag() {
		return mOclickPwdFlag;
	}

	public void setmOclickPwdFlag(int mOclickPwdFlag) {
		this.mOclickPwdFlag = mOclickPwdFlag;
	}

	public String getmOclickPwd() {
		return mOclickPwd;
	}

	public void setmOclickPwd(String mOclickPwd) {
		this.mOclickPwd = mOclickPwd;
	}

	


	public int getIsShowIndex() {
		return isShowIndex;
	}

	public void setIsShowIndex(int isShowIndex) {
		this.isShowIndex = isShowIndex;
	}

	public int getPortReceiveCheckboxV() {
		return portReceiveCheckboxV;
	}

	public void setPortReceiveCheckboxV(int portReceiveCheckboxV) {
		this.portReceiveCheckboxV = portReceiveCheckboxV;
	}

	public String getPortReceiveHead() {
		return portReceiveHead;
	}

	public void setPortReceiveHead(String portReceiveHead) {
		this.portReceiveHead = portReceiveHead;
	}

	public String getPortReceiveTail() {
		return portReceiveTail;
	}

	public void setPortReceiveTail(String portReceiveTail) {
		this.portReceiveTail = portReceiveTail;
	}

	public int getTriggerType() {
		return triggerType;
	}

	public void setTriggerType(int triggerType) {
		this.triggerType = triggerType;
	}

	public String getPortReceive() {
		return portReceive;
	}

	public void setPortReceive(String portReceive) {
		this.portReceive = portReceive;
	}

	public String gettResources() {
		return tResources;
	}

	public void settResources(String tResources) {
		this.tResources = tResources;
	}

	public String gettTouchKey() {
		return tTouchKey;
	}

	public void settTouchKey(String tTouchKey) {
		this.tTouchKey = tTouchKey;
	}

	
	
	
	
	
	
	public String gettVideoPaths() {
		return tVideoPaths;
	}

	public void settVideoPaths(String tVideoPaths) {
		this.tVideoPaths = tVideoPaths;
	}
	
	public String gettCurrentId() {
		return tCurrentId;
	}

	public void settCurrentId(String tCurrentId) {
		this.tCurrentId = tCurrentId;
	}

	public String gettTargetId() {
		return tTargetId;
	}

	public void settTargetId(String tTargetId) {
		this.tTargetId = tTargetId;
	}

	public int gettType() {
		return tType;
	}

	public void settType(int tType) {
		this.tType = tType;
	}

	public int gettOnclick() {
		return tOnclick;
	}

	public void settOnclick(int tOnclick) {
		this.tOnclick = tOnclick;
	}

	public int gettTouchReturnTime() {
		return tTouchReturnTime;
	}

	public void settTouchReturnTime(int tTouchReturnTime) {
		this.tTouchReturnTime = tTouchReturnTime;
	}

	public List<TouchBasis> gettResourcesList() {
		return tResourcesList;
	}

	public void settResourcesList(List<TouchBasis> tResourcesList) {
		this.tResourcesList = tResourcesList;
	}
	
	
	
	
	
	
}
