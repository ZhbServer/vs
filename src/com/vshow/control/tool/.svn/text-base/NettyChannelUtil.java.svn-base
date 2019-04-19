package com.vshow.control.tool;

import java.util.Date;

import io.netty.channel.ChannelHandlerContext;
import io.netty.util.Attribute;

public class NettyChannelUtil {

	
	//ChannelHandlerContext 绑定标识码
	public static void channelHandlerContextBindMark(String mark ,ChannelHandlerContext ctx,boolean checkMsgFlag,int versionCode,int initUpState){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
        NettyChannel nChannel = attr.get();  
	    if (nChannel == null) {   	  
	            NettyChannel newNChannel = new NettyChannel(mark, new Date(),0,checkMsgFlag,versionCode,initUpState);  
	            nChannel = attr.setIfAbsent(newNChannel);  
	    } else {  
	            //System.out.println("attributeMap 中是有值的");  
	            //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate()+"====="+nChannel.getClientUpState()); 
	    	    //System.out.println("checkMsgFlag:"+checkMsgFlag+"      nChannel.isCheckMsgFlag():"+nChannel.isCheckMsgFlag());
	 	       if(checkMsgFlag!=nChannel.isCheckMsgFlag()){
	 	    	   //System.out.println("更新ctx:   "+checkMsgFlag);
	 	    	   setChannelHandlerContextClientUpMsgFlag(ctx,checkMsgFlag);
	 	       }
	 	       if(versionCode!=nChannel.getCode()){
	 	    	   
	 	    	   setChannelHandlerContextClientUpCode(ctx,versionCode);
	 	    	   
	 	       }
	 	       
	 	      
	    }
	    
	   
	}
	
	//ChannelHandlerContext 获取标识
	public static String getChannelHandlerContextMark(ChannelHandlerContext ctx){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
		
        NettyChannel nChannel = attr.get();  
	    
        if (nChannel == null) {   	  
	           
        	   return ""; 
	    
        } else {  
	            //System.out.println("attributeMap 中是有值的");  
	            //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate());
	    	   return nChannel.getMark();
	    }  	
	}
	
	//ChannelHandlerContext修改状态
	public static int setChannelHandlerContextClientUpState(ChannelHandlerContext ctx,int clientUpState){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
        NettyChannel nChannel = attr.get();  
	    if (nChannel == null) {   	  
	           return -1; 
	    } else {  
	           //System.out.println("attributeMap 中是有值的");  
	           //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate());
	    	   nChannel.setClientUpState(clientUpState);
	    	   return clientUpState;
	    }  	
	}
	
	
	//ChannelHandlerContext 获取NettyChannel
	public static NettyChannel getChannelHandlerContextNettyChannel(ChannelHandlerContext ctx){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
        NettyChannel nChannel = attr.get();  
	    if (nChannel == null) {   	  
	           return null; 
	    } else {  
	            //System.out.println("attributeMap 中是有值的");  
	            //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate());
	    	   return nChannel;
	    }  	
	}
	
	
	//ChannelHandlerContext修改发布模式
	public static void setChannelHandlerContextClientUpMsgFlag(ChannelHandlerContext ctx,boolean checkMsgFlag){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
        
		NettyChannel nChannel = attr.get();  
	    
		if (nChannel == null) {   	  
	         
	    } else {  
	           //System.out.println("attributeMap 中是有值的");  
	           //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate());
	    	   nChannel.setCheckMsgFlag(checkMsgFlag);
	    }
		
	}
	
	
	
	//ChannelHandlerContext修改发布模式
	public static void setChannelHandlerContextClientUpCode(ChannelHandlerContext ctx,int code){
		 
		Attribute<NettyChannel> attr = ctx.attr(Constant.NETTY_CHANNEL_KEY);  
        
		NettyChannel nChannel = attr.get();  
	    
		if (nChannel == null) {   	  
	         
	    } else {  
	            //System.out.println("attributeMap 中是有值的");  
	            //System.out.println(nChannel.getMark() + "=======" + nChannel.getCreateDate());
	    	    nChannel.setCode(code);
	    	  
	    }  	
	}
	
	
}
