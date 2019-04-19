package com.vshow.control.tool;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import com.vshow.control.data.Client;

public class MainReCeMsgHandle extends Thread {

	private static final long serialVersionUID = 1L;
    private String tanme; 
    public MainReCeMsgHandle(String tnamer) {
    	tanme=tnamer;
		// TODO Auto-generated constructor stub
	}
    Logger logger  =  Logger.getLogger(MainReCeMsgHandle.class);
	public void run() {
		//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSSS");
		 //System.out.println(msg+"传递时间:"+sdf.format(new Date()));
		//long btime=0L;
		//long etime=0L;
		try {
			  String recemsg="";
			  while(true){
				  //System.out.println("Constant.recemsgs:"+Constant.recemsgs.size());
				  
				  if(Constant.recemsgs.size()>0){
					  //btime=System.currentTimeMillis();
					  
					  //获取接收消息
					  //logger.info(tanme+"---Constant.recemsgs.size():"+Constant.recemsgs.size());
					  recemsg=Constant.recemsgs.poll();  
					  //移除接收消息
					  //Constant.recemsgs.remove(0);
					  //System.out.println("recemsg:"+recemsg);
					  
					  if(recemsg!=null){
						  
						  //System.out.println(recemsg);
						  //logger.info("recemsg: "+recemsg);
						  String[] boss = recemsg.split("\\@")[0].split("\\_");
						  System.out.println(boss);
						  //logger.info("boss.length: "+boss.length);
						  int stype = 1;
						  String sendkey = "";
						  String boxno = "";
						  String xiaba = "0";
						  String fname = "";
						  int playtime = 0;
						  String downkey="";
						  String[] bosss;
						  String nver="";   //内部版本号
						  int ctype=0;      //类型
						  String sver="";   //显示版本号
						  Integer uponoff=0;//自动更新apk开关
						  if (boss.length == 4) {
							  
								bosss=boss[0].trim().split("\\|");
								
								if(bosss.length==2){
									
									 boxno=bosss[0];
									 
									 downkey=bosss[1];
								
								}else{
									
									 boxno = boss[0].trim();
									 
								}
						
								try {
									
									stype = Integer.parseInt(boss[1].trim());
									//System.out.println("这个stype的值是"+stype);
								
								} catch (Exception e) {
							    }
								
								if (stype == 4) {
									
									String[] sfs = boss[2].trim().split("\\|");
									
									if (sfs.length == 3) {
										
										xiaba = sfs[0].trim();
										
										fname = sfs[1].trim();
										
									}
									
								} else {
									xiaba = boss[2].trim();
								}
								sendkey = boss[3].trim();

							} else if(boss.length==3){
								try{
									//获取版本号更新服务端版本
									if (Integer.parseInt(boss[1]) == 6) {
										stype=6;
						                boxno=boss[0]; 
									}				
									//获取开机信息
									if (Integer.parseInt(boss[1]) == 8) {
										stype=8;
						                boxno=boss[0];
									}
									//获取自动更新
									if (Integer.parseInt(boss[1]) == 9) {
										stype=9;
										boxno=boss[0];
									}	
								}catch(Exception e){
									
								}
								//if (Integer.parseInt(boss[1]) == 5) {
					                //System.out.println("mark 地址:"+boss[0]);
					                //TimeTbItem.TbItem(boss[0]);
					                //boxno=boss[0];
								//} 
							}
							//System.out.println(boxno);
						   
							Mlt msgList = Constant.messageMap.get(boxno);
				            if (msgList != null) {
									Client cli = new Client();
									cli.setMark(boxno);
									if(stype==4){}else{
										if (sendkey.length() > 2) {
											cli.setName(sendkey);
											//判断返回结果
											if(stype==1){
												cli.setState(2);	
											}else{
												
                                                /*if(stype==27||stype==10){
													
													stype=1;
													
												}*/
												//22 协议无法下载  1已发送   27已接收  10正在下载
												if(stype==27||stype==10){
													
													//Constant.messageMapCache.remove(boxno+"@"+sendkey);
													
												}
												
												cli.setState(stype);
											}
											
											try {
												
												 //etime=System.currentTimeMillis()-btime;
											     //System.out.println("MainReCeMsgHandle1:"+etime);
											     
											     //查询终端id
											     //Integer cid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_bymark",boxno);
											     
											     //etime=System.currentTimeMillis()-btime;
											     //System.out.println("MainReCeMsgHandle3:"+etime);
											     
											     //查询logid
											     //Integer lsid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_by_id_sendkey", sendkey);
											     
											     
											     //etime=System.currentTimeMillis()-btime;
											     //System.out.println("MainReCeMsgHandle4:"+etime);
											     
											     //if(cid!=null&&lsid!=null){
											    	// cli.setClientId(cid);
												 ////    cli.setLid(lsid);
												   //  SqlConnect.getSqlMapInstance().update("up_on_result_state_byCidLid", cli);
											    // }
											     //System.out.println(boxno+"     "+stype);
												 // 下载结束 修改 状态
												 SqlConnect.getSqlMapInstance().update("up_on_result_suc", cli);
												 //如果 协议文件无法下载 尝试生成副本 重发消息 提供下载
												 if(cli.getState()==22)
												 {
													 
												 }
												 if(stype==1){
													 //Constant.downloadQueue.remove(cli.getMark()+"@"+sendkey);
													 Constant.downloadQueue.remove(cli.getMark());
												 }
												 
												 //etime=System.currentTimeMillis()-btime;
											     //System.out.println("MainReCeMsgHandle2:"+etime);
												   
												
												 //更新最后一次播放状态
												 SqlConnect.getSqlMapInstance().update("up_cp_state",cli);
												 
												 SqlConnect.getSqlMapInstance().update("up_warning_item",cli);
												
												//etime=System.currentTimeMillis()-btime;
											    //System.out.println("MainReCeMsgHandle3:"+etime);
											     
											} catch (Exception e) {
												 e.printStackTrace();
											}
										}
									}
							       
							            
									String curdate = "";
									if (stype != 3) {
										curdate = Constant.getCurrentDate();							
									}
									String ip = recemsg.split("\\@")[1];
									cli.setIp(ip);
									cli.setLast(curdate);
									
									if(stype==10){
										cli.setDownstate("0");
									}else if(stype==1&&sendkey.length() > 2){
										cli.setDownstate("100");
									}else{
										cli.setDownstate(xiaba);
									}
									
			                        try {
										//更新终端下载结果/最后连接时间
			                        	cli.setLast(Constant.getCurrentDate());
			                        	//System.out.println("此次运行结果是"+cli.getState());
										SqlConnect.getSqlMapInstance().update("update_xiaba_last", cli);
									} catch (Exception e) {
										// TODO: handle exception
									}
									
									//etime=System.currentTimeMillis()-btime;
							        //System.out.println("MainReCeMsgHandle4:"+etime);
							            
				            }else{
				            	
				             	if(VVersion.le_enter==1){
				             	
				             	  	if (boxno.length() == 17) {
										try {
											//long sqls_time=System.currentTimeMillis();
											Object occ=SqlConnect.getSqlMapInstance().queryForObject("sel_client_bymark", boxno);
											
											if(occ==null){
												
												Object oc = SqlConnect.getSqlMapInstance().queryForObject("s_ajk_ip", boxno);
												
												if (oc == null) {
													
													SqlConnect.getSqlMapInstance().insert("insert_inip_down", boxno);
													
													logger.info("未录入终端:"+boss[0]);
												}

											}else{
												
												logger.info("未录入Constant.messageMap:"+boss[0]);
												
											}
											
										 } catch (Exception e) {
											 
											 logger.error("未录入终端错误",e);
											 
										 }
									}
				             	  	
				             	  	
				             		
				             	}
				            
				            } 
					  }
					  
			           //etime=System.currentTimeMillis()-btime;
			           //if(VDeBugConfig.mainReCeMsgHandle==1){
			        	//   System.out.println("MainReCeMsgHandle5:"+etime);
						//   logger.info("MainReCeMsgHandle---"+tanme+"---"+etime);   
			           //}*/
					   
				  }else{
					  sleep(1000);
				  }
				  
				   
			  }
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}