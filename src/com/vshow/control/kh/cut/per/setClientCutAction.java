package com.vshow.control.kh.cut.per;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.Action;
import com.vshow.control.kh.cut.CutClientP;
import com.vshow.control.kh.cut.CutD;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSEchoServerHandler;

public class setClientCutAction implements Action {
	Logger logger  =  Logger.getLogger(setClientCutAction.class);
	private String mark; // 终端标识
	private int cutw;    // 切纸长度(1的倍数)
	private int cutstate;// 成功(01)
						 // 缺纸(02)
						 // 卡纸(03)
						 // 切纸机未开启(04)
	                     //**********************
	                     //开机(05)
	                     //关机(06)
	private String sendkey; 

	

	private String content;   //返回值
	@Override
	public String execute() throws Exception {
		logger.info("调试测试:["+mark+"]["+sendkey+"]终端请求"+Constant.getCurrentDate());
		if(cutstate==5||cutstate==6){
			CutClientP ccp = new CutClientP();
			ccp.setCutstate(cutstate);
			ccp.setMark(mark);

			Integer tcutstate = (Integer) SqlConnect.getSqlMapInstance()
					.queryForObject("sel_ccp_cutstate", mark);

			if (tcutstate == null) {
				SqlConnect.getSqlMapInstance().insert("add_ccp", ccp);
			} else {
				SqlConnect.getSqlMapInstance().update("up_ccp", ccp);
			}
			
		}else{
			
			
			//录入库存
			if (cutstate == 1) {
				CutD cutd = new CutD();
				cutd.setCdate(Constant.getCurrentDate());
				cutd.setCmark(mark);
				cutd.setCnum(cutw);
				SqlConnect.getSqlMapInstance().insert("add_cutd", cutd);
			}
			
			String cutstatet="";
			if(cutstate==1){
				cutstatet="切纸成功";
			}else if(cutstate==2){
				cutstatet="缺纸";
			}else if(cutstate==3){
				cutstatet="卡纸";
			}else if(cutstate==4){
				cutstatet="切纸机未开启";
			}
	        System.out.println("后台发送到终端"+mark+"切纸长度:"+cutw+"切纸状态:"+cutstatet);
	        logger.info("后台发送到终端"+mark+"切纸长度:"+cutw+"切纸状态:"+cutstatet);
			//反馈给手机网站服务器信息
			Constant.cutMap.put(sendkey,cutstate+"");
			content=SUCCESS;
			
		}
		return SUCCESS;
	}
	public String getMark() {
		return mark;
	}

	public String getSendkey() {
		return sendkey;
	}
	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}
	
	public void setMark(String mark) {
		this.mark = mark;
	}

	public int getCutw() {
		return cutw;
	}

	public void setCutw(int cutw) {
		this.cutw = cutw;
	}

	public int getCutstate() {
		return cutstate;
	}
	public void setCutstate(int cutstate) {
		this.cutstate = cutstate;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
