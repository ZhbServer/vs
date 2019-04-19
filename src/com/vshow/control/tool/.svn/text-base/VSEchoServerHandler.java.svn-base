/*
 * Copyright 2012 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package com.vshow.control.tool;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;



import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler.Sharable;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.util.Attribute;
import io.netty.util.ReferenceCountUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import com.vshow.control.data.Client;
import com.vshow.control.data.SystemInfo;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolType;
@Sharable
public class VSEchoServerHandler extends ChannelInboundHandlerAdapter {
	
	private String mark="";
	
	private int  initUpState=0;  //初始化在线状态    1第一次登陆 0登陆心跳    2待机   3待机心跳 
	
	private String clientIP="";
	
	private String initMark="";
	
	Log logger = LogFactory.getLog(VSEchoServerHandler.class);
	
	int msgPos=0;
	
	int msgLength=0;
	
	ByteArrayOutputStream baos=new ByteArrayOutputStream();
	
	boolean checkMsgFlag=false;
	
    int versionCode;
	
    @Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) {
	       
		    //读取数据
			ByteBuf buf = (ByteBuf) msg;
			int readlen = buf.readableBytes();
			byte[] bytemsg = new byte[readlen];
			buf.readBytes(bytemsg, 0, readlen);
			ReferenceCountUtil.release(msg);
			
		    //System.out.println("checkMsgFlag: "+checkMsgFlag );
			if(checkMsgFlag){
				    int write = 0;
		            while (write < readlen) {
		                 if (msgPos < msgLength) {

		                     int count = msgLength - msgPos;
		                     count = (write + count) > readlen ? readlen - write : count;
		                     baos.write(bytemsg, write, count);
		                     write += count;
		                     msgPos += count;

		                 } else {
		                     if (bytemsg[write] == '@') {
		                    	 //msgLength = bytemsg[++write];
		                         msgLength = bytemsg[++write]&0xff;
		                         if(versionCode>=SystemInfo.PROTOCOL_4_B){
		                        	 msgLength += (bytemsg[++write] & 0xff) << 8;
			                         msgLength += (bytemsg[++write] & 0xff) << 16;
			                         msgLength += (bytemsg[++write] & 0xff) << 24;	 
		                         }
		                       
		                         msgPos = 0;
		                         baos.reset();
		                     } else if (bytemsg[write] == '#' && msgPos == msgLength && msgPos > 0) {
		                    	 String msgs=new String(baos.toByteArray());
		                    	 msgAnalysis(ctx, msg, msgs);
		                     }
		                     write++;
		                 }
		             }
		             //sendmsg(ctx,"53+");
		             
		             
			}else{
				msgAnalysis(ctx, msg, new String(bytemsg));
				
			}
			
			
	}

	private void msgAnalysis(ChannelHandlerContext ctx, Object msg, String msgs) {
		//System.out.println("加密后:" + msgs);
		if (new VVersion().pwdPloy.equals("1")){
		       try {
		    	   msgs=DesUtil.decrypt(msgs,DesUtil.keyStatic);
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
	    }
		
		//ReferenceCountUtil.release(msg);
		//System.out.println(msgs);
		//System.out.println("解密后:" + msgs);
		//分割接收的数据放到消息队列
		//msgs="B8:FC:9A:CE:57:67_1_100.0_2017-06-29-16:03:17-1-1045";
		// msgs="96:9D:36:98:9B:26_24_47.08_2018-07-05-12:34:17-1-8561";
		String msgss[]=msgs.split("\\_");
		if(msgss.length>0){
			mark=msgss[0];
			if(mark.equals("0")||mark.equals("00:00:00:00:00:00")){
				
				if(mark.equals("00:00:00:00:00:00")){
					
					if(initMark.length()==0){
						
						initMark=Constant.createMark();
					}
					
					
					Protocol protocol=new Protocol(); 
					
					protocol.setType(ProtocolType.TYPE59);
					
					Map<String, String> map=new HashMap<String, String>();
					
					map.put("mac_address", initMark);
					
					protocol.setProtocolPlayBaseList(map);
					
					JSONObject jsonObject = JSONObject.fromObject(protocol);
			     	
					//System.out.println(jsonObject.toString());
					
					sendmsg(ctx,jsonObject.toString());
				}
			}else{
				
				
				if(msgss[0].trim().length()==17){
					//if(initUpState==1){
						if(VSNettyChannelMap.get((msgss[0]))==null){
					         //把channel存到服务端的map中
							 VSNettyChannelMap.add(msgss[0],ctx);
					    }else{
					    	 VSNettyChannelMap.remove(msgss[0]);
					    	 VSNettyChannelMap.add(msgss[0],ctx);
					    }
						initUpState=0;
						
					//}
					
				    NettyChannelUtil.channelHandlerContextBindMark(mark, ctx,checkMsgFlag,versionCode,initUpState);
				}
				
			}
			
		}
		//获取终端IP
		InetSocketAddress insocket = (InetSocketAddress) ctx.channel().remoteAddress();
		clientIP = insocket.getAddress().getHostAddress();
		logger.info("接收:["+clientIP+"]"+msgs);
		
		
		if(msgss.length==4&&!mark.equals("00:00:00:00:00:00")){
			if(msgss[1].equals("1")&&msgss[2].equals("100.")&&msgss[3].equals("0")){
				
					Constant.zxstates.add(mark+"@"+1+"@"+clientIP);
				
			}else if(msgss[1].equals("1")&&msgss[2].equals("0.0")&&msgss[3].equals("0")){
				
					Constant.zxstates.add(mark+"@"+1+"@"+clientIP);
				
			}else if(msgss[1].equals("1")&&msgss[2].equals("100.0")&&msgss[3].equals("0")){
				
				    Constant.zxstates.add(mark+"@"+1+"@"+clientIP);
				    
		    } else if(msgss[1].equals("3")){
		    	
					Constant.zxstates.add(mark+"@"+2+"@"+clientIP);
					
			}else if(msgss[1].equals("100")){
				//System.out.println("msgss[3]:"+msgss[3]);
				msgss[3]=msgss[3].replaceAll("\\#", "");
				//System.out.println(msgss[3]);
				checkMsgFlag=true;
				try {
					versionCode=Integer.parseInt(msgss[3]);
				} catch (Exception e) {
					versionCode=0;
				}
				sendmsg(ctx,"53+");
			} else{
				
				    //验证消息是否已经存入消息队列未处理
				    
	            	//存入放入消息队列验证
		            //String newsStr=Constant.depositedMapCheck.get(msgs);
		            
		            //if(newsStr==null){
		            	//放入消息队列
				       
			            Constant.recemsgs.add(msgs+"@"+clientIP);
			            //存入放入消息队列验证
			            //Constant.depositedMapCheck.put(msgs, msgs);
		            //}
		            
			}
         }
		
		 if(mark!=null&&mark.length()==17&&!mark.equals("00:00:00:00:00:00")){
			    //操作终端在线时长
				//TODO 起始时间
				if(Constant.itemMap.get(mark) == null){
					Constant.itemMap.put(mark, new Date());
				}
		 }
         System.out.println(mark+"["+clientIP+"]");
      
      
         //收到消息回传z
         sendmsg(ctx,"z");
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) {
		ctx.flush();
	}

	
	//netty异常时处理
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
		
		
		//获取标识
		String tempMark=NettyChannelUtil.getChannelHandlerContextMark(ctx);
		
		VSNettyChannelMap.remove(tempMark);
		
		initUpState=1;
		
		Constant.zxstates.add(tempMark+"@"+0+"@"+clientIP);
		//System.out.println("handlerRemoved删除移除队列remove:"+mark+":"+VSNettyChannelMap.size());
	    System.out.println(tempMark+"[exceptionCaught][offline]");
	    
	    Constant.downloadQueue.remove(tempMark);
	    
	     //TODO 终端离线
		new MainLxTimeStatics().run(tempMark);
		
	    ctx.close();
	
		//cause.printStackTrace();
		
	}

	@Override
	public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
		
		super.handlerAdded(ctx);
		
		initUpState=1;
		
		System.out.println("handlerAdded");
		
		//ctx.attr()		
		SystemInfo systemInfo=new SystemInfo();
		
		systemInfo.setSystemDate(System.currentTimeMillis());
		
		systemInfo.setPostType(0);
		
		JSONArray jsonArray = JSONArray.fromObject(systemInfo);
	
	    sendmsg(ctx,"21+"+jsonArray.toString());
		
	}

	@Override
	public void handlerRemoved(ChannelHandlerContext ctx) {
		
		try {
			super.handlerRemoved(ctx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//获取标识
		String tempMark=NettyChannelUtil.getChannelHandlerContextMark(ctx);
		VSNettyChannelMap.remove(tempMark);
		initUpState=1;
		Constant.zxstates.add(tempMark+"@"+0+"@"+clientIP);
		//System.out.println("handlerRemoved删除移除队列remove:"+mark+":"+VSNettyChannelMap.size());
	    System.out.println(tempMark+"[handlerRemoved][offline]");
	    
	    Constant.downloadQueue.remove(tempMark);
	    
	    //TODO 终端离线
		new MainLxTimeStatics().run(tempMark);
		
		ctx.close();
		
		
	}
	
	//发送消息
	public synchronized void sendmsg(ChannelHandlerContext ctx,String msg){
		
		//System.out.println("发送:"+msg);
		try {
			 if (new VVersion().pwdPloy.equals("1")){
			       msg=DesUtil.encrypt(msg,DesUtil.keyStatic);
		     }
			
			 byte[] req;
			 if(checkMsgFlag){
				  req =	getSendMsgNew(msg,versionCode);
			 }else{
				  req = msg.getBytes("UTF-8");
			 }
			 //System.out.println(new String(req));
			 ByteBuf pingMessage = Unpooled.buffer();
			 
			 //ByteBuf pingMessage=PooledByteBufAllocator.DEFAULT.directBuffer(1024);
			 
			 pingMessage.writeBytes(req);
			 
			 ctx.writeAndFlush(pingMessage);
			 
			 //pingMessage.release();
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}
	
    public  static byte[] getSendMsgNew(String sendMsg,int versionCode) throws UnsupportedEncodingException {
        
    	byte[] bytes1 = sendMsg.getBytes("UTF-8");
        
        byte[] bytes = new byte[(versionCode >= SystemInfo.PROTOCOL_4_B ? 6 : 3) + bytes1.length];
        
        int write = 0;
        
        bytes[write] = '@';
        
        bytes[++write] = (byte) (bytes1.length & 0xff);
        
        if(versionCode >= SystemInfo.PROTOCOL_4_B) {
        	
            bytes[++write] = (byte) (bytes1.length >> 8 & 0xff);
            bytes[++write] = (byte) (bytes1.length >> 16 & 0xff);
            bytes[++write] = (byte) (bytes1.length >> 24 & 0xff);
     
        }        
        System.arraycopy(bytes1, 0, bytes, ++write,bytes1.length);
        
        bytes[bytes.length - 1] = '#';
        
        return bytes;
    }
	
	
	 @Override
	 public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
		 
	        if (evt instanceof IdleStateEvent) {
	        	
	            IdleStateEvent e = (IdleStateEvent) evt;
	            
	            if (e.state() == IdleState.READER_IDLE) { //readerIdleTime	an IdleStateEvent whose state is IdleState.READER_IDLE will be triggered when no read was performed for the specified period of time. Specify 0 to disable.
	            	
	            	//NTLog.Tracelog("","","Reader Idle! " + mConnectionManager.count());
	            	
	        		//获取标识
	        		String tempMark=NettyChannelUtil.getChannelHandlerContextMark(ctx);
	        		
	        		VSNettyChannelMap.remove(tempMark);
	        		
	        		initUpState=1;
	        		
	        		Constant.zxstates.add(tempMark+"@"+0+"@"+clientIP);
	        		//System.out.println("handlerRemoved删除移除队列remove:"+mark+":"+VSNettyChannelMap.size());
	        	    System.out.println(tempMark+"[userEventTriggered][offline]");
	        	    
	        	    Constant.downloadQueue.remove(tempMark);
	        	    
	        	    //TODO 终端离线
	        		new MainLxTimeStatics().run(tempMark);
	        		
	        		ctx.close();
	        		
	        		
	        		//System.out.println("userEventTriggered删除移除队列remove:"+mark+":"+VSNettyChannelMap.size());
	        		
	            } else if (e.state() == IdleState.WRITER_IDLE) {// an IdleStateEvent whose state is IdleState.WRITER_IDLE will be triggered when no write was performed for the specified period of time. Specify 0 to disable.
	            	
	               //   ctx.writeAndFlush(new PingMessage());
	            	
	            }else if (e.state() == IdleState.ALL_IDLE){ //an IdleStateEvent whose state is IdleState.ALL_IDLE will be triggered when neither read nor write was performed for the specified period of time. Specify 0 to disable.
	            	
	            }
	        }
	    }

	 
	 
	  
	 
	  public static void main(String[] args) {
		    Protocol protocol=new Protocol(); 
			
			protocol.setType(ProtocolType.TYPE53);
			
			Map<String, String> map=new HashMap<String, String>();
			
			map.put("play_mode", "mode_normal");
			
			protocol.setProtocolPlayBaseList(map);
			
			JSONObject jsonObject = JSONObject.fromObject(protocol);
	     	
			System.out.println(jsonObject.toString());
	}
	 
}
