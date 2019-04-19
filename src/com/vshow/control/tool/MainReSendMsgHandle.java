package com.vshow.control.tool;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import com.vshow.control.data.Client;

public class MainReSendMsgHandle extends Thread {
	
	
	
	private static Log logger = LogFactory.getLog(MainReSendMsgHandle.class);
	
	@Override
	public void run() {
		while (true) {
			try {
				//遍历消息队列
				Client cli;
				MyMsg  myMsg;
				String key;
				for(Iterator itr = Constant.messageMapCache.keySet().iterator(); itr.hasNext();){
			    	
			    	   key = (String) itr.next();
			    
			    	   //0 标识   1sendkey
			    	   String keys[]=key.split("\\@");
			    	 
			    	   
			    	   Mlt msgList = Constant.messageMap.get(keys[0]);
			    	   
			    	   if (msgList != null) {
			    		   
			    		   myMsg= Constant.messageMapCache.get(key);
				    	   
				    	   ChannelHandlerContext ctx=VSNettyChannelMap.get(keys[0]);
			    		   //System.out.println("ctx:"+ctx);
			    		   if(ctx!=null){
			    			   
			    			    System.out.println("在线重发["+keys[0]+"]:"+keys[1]);
			    			    
			    			    logger.info("在线重发["+keys[0]+"]:"+keys[1]);
			    			   
			    				String cmd = myMsg.msg;
			    				cli=new Client();
			    				cli.setName(myMsg.sendkey);
				   				cli.setMark(key);
				   				cli.setState(1);
				   				
			    			    //send
			   					sendmsg(ctx,cmd);
			   					
			   					//存入消息缓存集合
			   					Constant.messageMapCache.put(keys[0]+"@"+myMsg.sendkey,myMsg);
			   					
			   					try {
			   						if(myMsg.sendkey.equals("")){
			   							
			   						}else{
			   							
			   							//更新结果result
			   							SqlConnect.getSqlMapInstance().update("up_on_result_suc", cli);
			   							
			   							//更新最后一次播放状态
			   							SqlConnect.getSqlMapInstance().update("up_cp_state",cli);
			   							
			   						}
			   					
			   						
			   					} catch (Exception e) {
			   						logger.error(e);
			   					}
			   					
			   					
			    		   }
			    		   
			    	   }
			    	   
				}
				
				sleep(1000*60);
			} catch (Exception e) {
				logger.error(e);
			}
			
			
		}
	}
	
	//发送消息
	public synchronized void sendmsg(ChannelHandlerContext ctx,String msg){
		
		try {
			
			     if (new VVersion().pwdPloy.equals("1")){
			    	 
				       msg=DesUtil.encrypt(msg,DesUtil.keyStatic);
				       
			     }
			     //System.out.println("发送:"+msg);
			     NettyChannel nettyChannel=NettyChannelUtil.getChannelHandlerContextNettyChannel(ctx);  		 
			     
			     byte[] req;
				 
			     if(nettyChannel.isCheckMsgFlag()){
					 
					  req =VSEchoServerHandler.getSendMsgNew(msg,nettyChannel.getCode());
				 
				 }else{
					 
					  req = msg.getBytes("UTF-8");
					  
				 }
				 //logger.info("发送终端协议[开始]:"+new String(req));
				 
				 logger.info("发送终端协议[开始]:"+msg);
				 
				 ByteBuf pingMessage = Unpooled.buffer();
				 //ByteBuf pingMessage=PooledByteBufAllocator.DEFAULT.directBuffer(1024);
				 pingMessage.writeBytes(req);
				 
				 ctx.writeAndFlush(pingMessage);
				 
				 //pingMessage.release();
				 
				 logger.info("发送终端协议[结束]");
				
		} catch (Exception e) {
			
		   e.printStackTrace();
		}
		 
	}
}
