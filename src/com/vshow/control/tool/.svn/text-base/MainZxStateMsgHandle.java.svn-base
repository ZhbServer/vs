package com.vshow.control.tool;

import io.netty.channel.ChannelHandlerContext;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.jfree.util.Log;

import com.vshow.control.data.Client;

public class MainZxStateMsgHandle extends Thread {

	private static final long serialVersionUID = 1L;
    private String tanme; 
    public MainZxStateMsgHandle(String tnamer) {
    	tanme=tnamer;
		// TODO Auto-generated constructor stub
	}
    
    Logger logger  =  Logger.getLogger(MainZxStateMsgHandle.class);
    
	public void run() {
		 //SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSSS");
		 //System.out.println(msg+"传递时间:"+sdf.format(new Date()));
		 //long btime=0L;
		 //long etime=0L;
		try {
			  String zxmsg="";
			  ChannelHandlerContext ctx;
			  NettyChannel nettyChannel;
			  int clientUpState=0;
			  while(true){
				  //logger.info("Constant.zxstates" +":"+Constant.zxstates.size());
				  if(Constant.zxstates.size()>0){
					  //btime=System.currentTimeMillis();
					  zxmsg=Constant.zxstates.poll();  
					
					  if(zxmsg!=null){
						    
						   if(VVersion.debug_messageMap==1){
							   
							    String keys="";
							    
							    for(Iterator itr = Constant.messageMap.keySet().iterator(); itr.hasNext();){
						    	   
							    	String key = (String) itr.next();
							    	
						    	    keys=keys+" "+key;
						    	  
						        }
							    
							    logger.info("Constant.messageMap: "+keys);
							    
							    System.out.println("Constant.messageMap: "+keys);
							    
						   }
						   
						   String[] boss =zxmsg.split("\\@");
						   
						   Mlt msgList = Constant.messageMap.get(boss[0]);
						    //logger.info("msgList:"+msgList);
						   if (msgList != null) {
									Client cli = new Client();
									cli.setMark(boss[0]);
									//0离线 1在线 2待机
									if(Integer.parseInt(boss[1])==0||Integer.parseInt(boss[1])==1){
										//获取到channel的状态
										ctx=VSNettyChannelMap.get(boss[0]);
										if(ctx!=null){
											nettyChannel=NettyChannelUtil.getChannelHandlerContextNettyChannel(ctx);
											if(nettyChannel!=null){
												clientUpState=nettyChannel.getClientUpState();
												if(clientUpState==0){

													//cli.setZxstate(Integer.parseInt(boss[1]));
													//cli.setIp(boss[2]);
													//try{
														//更新终端在线状态
													//	SqlConnect.getSqlMapInstance().update("update_client_zxstate", cli);
													//} catch (Exception e) {
														// TODO: handle exception
													//}
													NettyChannelUtil.setChannelHandlerContextClientUpState(ctx, 1);
													
												}
											}
										}else{
											
											//cli.setZxstate(Integer.parseInt(boss[1]));
											//cli.setIp(boss[2]);
											//try{
											//更新终端在线状态
											//	SqlConnect.getSqlMapInstance().update("update_client_zxstate", cli);
											//} catch (Exception e) {
												// TODO: handle exception
											//}
											
										}
										
										cli.setZxstate(Integer.parseInt(boss[1]));
										
										cli.setIp(boss[2]);
										
										try{
											//更新终端在线状态
											cli.setLast(Constant.getCurrentDate());
											SqlConnect.getSqlMapInstance().update("update_client_zxstate_last", cli);
										} catch (Exception e) {
											// TODO: handle exception
										}
										
										
									}else if(Integer.parseInt(boss[1])==2){
										cli.setZxstate(1);
										cli.setIp(boss[2]);
										cli.setStandbystate(1);
										try{
											//更新终端在线状态/待机
											SqlConnect.getSqlMapInstance().update("update_client_zxstate_standby", cli);
										} catch (Exception e) {
											// TODO: handle exception
										}
									}
									
									
									if(Integer.parseInt(boss[1])==0){
										
									}else{
										
										//操作终端在线时长
										//TODO 内存插入终端时长 
										//if(Constant.itemMap.get(boss[0]) == null){
										//	Constant.itemMap.put(boss[0], new Date());
										//}
										
										/**String keys="";
										   String values="";
										   for(Iterator itr = Constant.itemMap.keySet().iterator(); itr.hasNext();){
									    	   String key = (String) itr.next();
									    	   String value=Constant.itemMap.get(key).toString();
									    	   keys=keys+" "+key;
									    	   values=values+"  "+value;
									    	  
									        }
										    logger.info("Constant.itemMap: "+keys);
										    System.out.println("Constant.itemMap: "+keys);
										    
										    logger.info("Constant.itemMap: "+values);
										    System.out.println("Constant.itemMap: "+values);
										    
										    **/
									 }
				            }else{
				              
				            	if(VVersion.le_enter==1){
				            		
				            		if (boss[0].length() == 17) {
										try {
											//long sqls_time=System.currentTimeMillis();
											Object occ=SqlConnect.getSqlMapInstance().queryForObject("sel_client_bymark", boss[0]);
											
											if(occ==null){
												
												Object oc = SqlConnect.getSqlMapInstance().queryForObject("s_ajk_ip", boss[0]);
												
												if (oc == null) {
													
													SqlConnect.getSqlMapInstance().insert("insert_inip_down", boss[0]);
													
													logger.info("未录入终端:"+boss[0]);
													
												}
												
											}else{
												System.out.println(boss[0]+"点位不够或未认证");
												logger.info("未录入Constant.messageMap:"+boss[0]);
												Client cli = new Client();
												cli.setMark(boss[0]);
												cli.setStandbystate(2);
												try{
													//更新终端状态为未录入
													SqlConnect.getSqlMapInstance().update("update_client_standbystate", cli);
												} catch (Exception e) {
													// TODO: handle exception
												}
												
											}
											
										 } catch (Exception e) {
											 logger.error("未录入终端错误",e);
										 }
									}
				            		
				            	}
				            
				            } 
					  }
					  
			           /*etime=System.currentTimeMillis()-btime;
			           if(VDeBugConfig.mainReCeMsgHandle==1){
			        	   System.out.println("MainReCeMsgHandle:"+etime);
						   logger.info("MainReCeMsgHandle---"+tanme+"---"+etime);   
			           }*/
				  }else{
					  sleep(1000);
				  }
				  
				   
			  }
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}