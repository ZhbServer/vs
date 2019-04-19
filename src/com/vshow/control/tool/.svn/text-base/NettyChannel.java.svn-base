package com.vshow.control.tool;

import java.util.Date;

public class NettyChannel {
	   
	
	   private String mark;           //绑定标识 
       private Date createDate;       //录入时间
       private int clientUpState;     //终端是否更新到数据库 (0未更新 1已更新 )
       private int code;              //终端内部版本 >=2 修改新协议
       private boolean checkMsgFlag;  //true 新协议   false 旧协议
       private int initUpState=1;
       

	   public boolean isCheckMsgFlag() {
		   
			return checkMsgFlag;
	   
	   }
	
	   public void setCheckMsgFlag(boolean checkMsgFlag) {
			this.checkMsgFlag = checkMsgFlag;
	   }
	
	   public int getCode() {
			return code;
	   }
	
	   public void setCode(int code) {
			this.code = code;
	   }

	   public NettyChannel(String mark,Date createDate,int clientUpState,boolean checkMsgFlag,int code,int initUpState) {  
	        
		    this.mark = mark;  
	        this.createDate = createDate;
	        this.clientUpState=clientUpState;
	        this.checkMsgFlag=checkMsgFlag;
	        this.code=code;
	        this.initUpState=initUpState;
	    
	   }
	   
	    public int getInitUpState() {
		return initUpState;
	}

	public void setInitUpState(int initUpState) {
		this.initUpState = initUpState;
	}

		public int getClientUpState() {
			return clientUpState;
		}


		public void setClientUpState(int clientUpState) {
			this.clientUpState = clientUpState;
		}


		public String getMark() {
			return mark;
		}


		public void setMark(String mark) {
			this.mark = mark;
		}


		public Date getCreateDate() {
			return createDate;
		}


		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}  
}
