package com.vshow.control.protocol;

import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.vshow.control.data.SucaiCloud;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;

public class ProtocolUtil {


	
	/**
	 * 解析msg
	 * @param msg 协议字符串
	 * @param type 协议类型
	 * @throws SQLException 
	 */
	
	public static Protocol protocolAnalysisMsg(String msg,int type) throws SQLException{
		   
		 
		
		
		    Protocol protocol=new Protocol();
			
		    protocol.setType(type);
			
		    msg=msg.substring(2, msg.length());
			
		    String[] msgs=msg.split("\\+");
			
			if(msgs.length==2){
				
				String[] msgs2=msgs[0].split("\\/");
				
				if(msgs2.length==2){
					
					protocol.setDownResourceSize(Long.parseLong(msgs2[0]));
					
					String[] resources=msgs2[1].split("\\|");
					
					List<String>  zipResourcesList=new ArrayList<String>();  //zip下载资源
					List<ProtocolDownMediaResource> downMediaResourceList=new ArrayList<ProtocolDownMediaResource>();  //音视频资源文件
					List<ProtocolDownResource>  protocolDownResourceList=new  ArrayList<ProtocolDownResource>();  //下载资源
					
					ProtocolDownMediaResource  protocolDownMediaResourceTemp;
					ProtocolDownResource protocolDownResourceTemp;
					for (int i = 0; i < resources.length; i++) {
						int repeatState=0;
						protocolDownResourceTemp=new ProtocolDownResource();
						String resourceType = resources[i].substring(resources[i].lastIndexOf('.') + 1,resources[i].length()).trim().toLowerCase();
						if(resourceType.equals("zip")){
							 zipResourcesList.add(resources[i]);
							 protocolDownResourceTemp.setDownType(0);
							 protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
							 protocolDownResourceTemp.setFileName(resources[i]);
							 protocolDownResourceTemp.setVideoUnique("");
							 protocolDownResourceList.add(protocolDownResourceTemp);
							 
						}else{
							        SucaiCloud sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param",resources[i]);
							        ProtocolDownMediaResource  protocolDownMediaResource=new ProtocolDownMediaResource();
								    if(sCloud!=null){
									      
									
										  //去除重复资源
										  for (int j = 0; j < downMediaResourceList.size(); j++) {
												protocolDownMediaResourceTemp=downMediaResourceList.get(j);
												if(protocolDownMediaResourceTemp!=null){
													if(protocolDownMediaResourceTemp.getFileName().equals(resources[i])){
														repeatState=1;
													}
												}
											}
									
											if(repeatState==0){
												
												if(sCloud.getCloudtype()==1){
													
													protocolDownMediaResource.setDownUrl(sCloud.getDownurl());
													protocolDownResourceTemp.setDownType(1);
													protocolDownResourceTemp.setDownUrl("http://hangye.letv.com/play.php?v="+sCloud.getDownurl());
													protocolDownResourceTemp.setFileName(sCloud.getFilename());
													protocolDownResourceTemp.setVideoUnique(sCloud.getDownurl());
													
													
												}else if(sCloud.getCloudtype()==0){
				                                    
													protocolDownMediaResource.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+sCloud.getDownurl());
													protocolDownResourceTemp.setDownType(0);
													protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+sCloud.getDownurl());
													protocolDownResourceTemp.setFileName(sCloud.getFilename());
													protocolDownResourceTemp.setVideoUnique("");
													
												}
												
												protocolDownMediaResource.setFileName(resources[i]);
												
												downMediaResourceList.add(protocolDownMediaResource);
												
												protocolDownResourceList.add(protocolDownResourceTemp);
												
											}
									
								  }else{
									  
									    protocolDownMediaResource.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
										protocolDownResourceTemp.setDownType(0);
										protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
										protocolDownResourceTemp.setFileName(resources[i]);
										protocolDownResourceTemp.setVideoUnique("");
										protocolDownResourceList.add(protocolDownResourceTemp);
									  
								  }
						}
						
					    
				}
					protocol.setZipResourcesList(zipResourcesList);
					protocol.setDownMediaResourceList(downMediaResourceList);
					protocol.setProtocolDownResourceList(protocolDownResourceList);
				}
				
				
				String sendkeyMsg=msgs[1].split("\\%")[0].split("\\!")[1];
 			
 			String playType=msgs[1].split("\\%")[1].split("\\!")[0];
 			List<ProtocolPlay>  protocolPlayList=new ArrayList<ProtocolPlay>();
 			ProtocolPlay pplay;
 			if(playType.equals("playlist")||playType.equals("inductionlist")||playType.equals("conditionlist")){
 				
 				String[] playLists=msgs[1].split("\\%")[1].split("\\!")[1].split("\\|");
 				pplay=new ProtocolPlay();
 				List<String> pplayPlayLists = new ArrayList<String>();   //播放列表
 				for (int i = 0; i < playLists.length; i++) {
 					pplayPlayLists.add(playLists[i]);
 				}
 				pplay.setPlayList(pplayPlayLists);
 				protocolPlayList.add(pplay);
 				
 			}else if(playType.equals("datelist")||playType.equals("cblist")){
 				
 				String[] dateLists=msgs[1].split("\\%")[1].split("\\!")[1].split("\\^");
 				
 				for (int i = 0; i < dateLists.length; i++) {
 					String[] lists=dateLists[i].split("\\_");
 					if(lists.length==3){
 						pplay=new ProtocolPlay();
 						
 						pplay.setSdate(lists[0]);
 						pplay.setEdate(lists[1]);
 						List<String> pplayPlayLists = new ArrayList<String>(); // 播放列表
 	 	 				String[] playLists=lists[2].split("\\|");
 	 	 				for (int j = 0; j < playLists.length; j++) {
 	 	 					pplayPlayLists.add(playLists[j]);
 	 					}
 	 	 				pplay.setPlayList(pplayPlayLists);
 	 	 				protocolPlayList.add(pplay);
 	 				}
				}
 				
 				
 			
 			}else if(playType.equals("timelist")){
                String[] dateLists=msgs[1].split("\\%")[1].split("\\!")[1].split("\\^");
 				
                
                
                for (int i = 0; i < dateLists.length; i++) {
 					String[] lists=dateLists[i].split("\\_");
 					if(lists.length==4){
 						pplay=new ProtocolPlay();
 						pplay.setDay(Integer.parseInt(lists[0]));
 						pplay.setSdate(lists[1]);
 						pplay.setEdate(lists[2]);
 						List<String> pplayPlayLists = new ArrayList<String>(); // 播放列表
 	 	 				String[] playLists=lists[3].split("\\|");
 	 	 				for (int j = 0; j < playLists.length; j++) {
 	 	 					pplayPlayLists.add(playLists[j]);
 	 					}
 	 	 				pplay.setPlayList(pplayPlayLists);
 	 	 				protocolPlayList.add(pplay);
 	 				}
				}
                
 			}
 			
 			protocol.setProtocolPlayStitching(msgs[1].split("\\%")[1].split("\\!")[1]);
 			protocol.setProtocolPlayList(protocolPlayList);
 			protocol.setSendkey(sendkeyMsg);
 			protocol.setPlayType(playType);
 			
 			
		  }
		  return protocol;	
	}
	
	
	

	
	/**
	 * 解析downcmd
	 * @param downcmd 协议生成
	 * @throws SQLException 
	 */
	public static List<ProtocolDownResource>  getProtocolDownResourceList(String downcmd) throws Exception{
	  
		List<ProtocolDownResource> protocolDownResourceList=new ArrayList<ProtocolDownResource>();
		
		if(downcmd!=null){
			
			String[] resources=downcmd.split("\\|");
			ProtocolDownMediaResource  protocolDownMediaResourceTemp;
			ProtocolDownResource protocolDownResourceTemp;
			List<ProtocolDownMediaResource> downMediaResourceList=new ArrayList<ProtocolDownMediaResource>();  //音视频资源文件
			
			for (int i = 0; i < resources.length; i++) {
				int repeatState=0;
				protocolDownResourceTemp=new ProtocolDownResource();
				String resourceType = resources[i].substring(resources[i].lastIndexOf('.') + 1,resources[i].length()).trim().toLowerCase();
				if(resourceType.equals("zip")){
					
					 protocolDownResourceTemp.setDownType(0);
					 protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
					 protocolDownResourceTemp.setFileName(resources[i]);
					 protocolDownResourceTemp.setVideoUnique("");
					 protocolDownResourceList.add(protocolDownResourceTemp);
				}else{
					 SucaiCloud sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param",resources[i]);
					 ProtocolDownMediaResource  protocolDownMediaResource=new ProtocolDownMediaResource();
					 if(sCloud!=null){
							      
							
								  //去除重复资源
								  for (int j = 0; j < downMediaResourceList.size(); j++) {
										protocolDownMediaResourceTemp=downMediaResourceList.get(j);
										if(protocolDownMediaResourceTemp!=null){
											if(protocolDownMediaResourceTemp.getFileName().equals(resources[i])){
												repeatState=1;
											}
										}
									}
							
									if(repeatState==0){
										
										if(sCloud.getCloudtype()==1){
											protocolDownMediaResource.setDownUrl(sCloud.getDownurl());
											
											protocolDownResourceTemp.setDownType(1);
											protocolDownResourceTemp.setDownUrl("http://hangye.letv.com/play.php?v="+sCloud.getDownurl());
											protocolDownResourceTemp.setFileName(sCloud.getFilename());
											protocolDownResourceTemp.setVideoUnique(sCloud.getDownurl());
											
											
										}else if(sCloud.getCloudtype()==0){
		                                    protocolDownMediaResource.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+sCloud.getDownurl());
											
											protocolDownResourceTemp.setDownType(0);
											protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+sCloud.getDownurl());
											protocolDownResourceTemp.setFileName(sCloud.getFilename());
											protocolDownResourceTemp.setVideoUnique("");
										}
										
										
										protocolDownMediaResource.setFileName(resources[i]);
										downMediaResourceList.add(protocolDownMediaResource);
										
										protocolDownResourceList.add(protocolDownResourceTemp);
									}
							
						  }else{
							    protocolDownMediaResource.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
								
								protocolDownResourceTemp.setDownType(0);
								protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+resources[i]);
								protocolDownResourceTemp.setFileName(resources[i]);
								protocolDownResourceTemp.setVideoUnique("");
								
								protocolDownResourceList.add(protocolDownResourceTemp);
							  
						  }
				}
			}
			
		}
			
	    return protocolDownResourceList;	
	}
	
}
