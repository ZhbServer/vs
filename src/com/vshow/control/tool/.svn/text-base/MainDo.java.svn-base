package com.vshow.control.tool;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import net.sf.json.JSONObject;

import com.vshow.control.data.Client;


public class MainDo {

	public void init(int done)  {
		//try {
			
		//	System.out.println(Constant.IP);
		//} catch (Exception e1) {
		//}
		String[] strs = Constant.IP.split("\\.");
		Constant.GB = strs[0];
		for (int i = 1; i < strs.length - 1; i++) {
			Constant.GB += "." + strs[i];
		}
		Constant.GB += ".255";
		//System.out.println(Constant.GB);

		// 获取所有的场景
		String filenamestrs = "flvplayer.swf";
		try {
			List scenes = SqlConnect.getSqlMapInstance().queryForList(
					"sel_all_scene_fname");
			if (scenes.size() > 0) {
				for (int i = 0; i < scenes.size(); i++) {
					String scenename = (String) scenes.get(i);
					if (filenamestrs.length() == 0) {
						filenamestrs = scenename+"_"+scenename+".zip";
					} else {
						filenamestrs = filenamestrs + "_" + scenename+"_"+scenename+".zip";
					}
				}
			}
			List interactscenes = SqlConnect.getSqlMapInstance().queryForList(
					"sel_all_interactscene_name");
			if (interactscenes.size() > 0) {
				for (int i = 0; i < interactscenes.size(); i++) {
					String scenename = (String) interactscenes.get(i);
					if (filenamestrs.length() == 0) {
						filenamestrs = scenename+"_"+scenename+".zip";
					} else {
						filenamestrs = filenamestrs + "_" + scenename+"_"+scenename+".zip";
					}
				}
			}

			List sucais = SqlConnect.getSqlMapInstance().queryForList(
					"sel_sucai_filename_all");
			if (sucais.size() > 0) {
				for (int i = 0; i < sucais.size(); i++) {
					String sucainame = (String) sucais.get(i);
					if (filenamestrs.length() == 0) {
						filenamestrs = sucainame;
					} else {
						filenamestrs = filenamestrs + "_" + sucainame;
					}
				}
			}
			/*List apks = SqlConnect.getSqlMapInstance().queryForList(
			"sel_apk_fname_all");
			if (apks.size() > 0) {
				for (int i = 0; i < apks.size(); i++) {
					String apkfile = (String) apks.get(i);
					if (filenamestrs.length() == 0) {
						filenamestrs = apkfile;
					} else {
						filenamestrs = filenamestrs + "_" + apkfile;
					}
				}
			}*/
	
	

			File fsss = new File(Constant.FILES);
			File[] fsd = fsss.listFiles();
			if (fsd != null) {
				for (int i = 0; i < fsd.length; i++) {
					fsss = fsd[i];
					if (fsss.isDirectory()) {
						if (filenamestrs.indexOf(fsss.getName()) == -1) {

							FileHandle.delFolder(fsss.getPath());
							String fzip = fsss.getName() + ".zip";
							File f = new File(Constant.FILES + File.separator
									+ fzip);
							if (f.exists()) {
								f.delete();
							}

						}
					}
				}
			}

		} catch (SQLException e1) {

		}
		// 清除screen，see
		File fsss = new File(Constant.SCREEN);
		File[] screens = fsss.listFiles();
		for (int i = 0; i < screens.length; i++) {
			fsss = screens[i];
			if (fsss.exists()) {
				fsss.delete();
			}
		}
		//File fsee = new File(Constant.SEE);
		//File[] sees = fsee.listFiles();
		//for (int i = 0; i < sees.length; i++) {
		//	fsee = sees[i];
		//	FileHandle.delFolder(fsee.getPath());
			
		//}

		
		List list = null;
		Client cl;
		String themark;
		String theip="";
		Mlt msgList;
		try {
			list = SqlConnect.getSqlMapInstance().queryForList(
					"init_all_remark");
			SqlConnect.getSqlMapInstance().update("update_client_zxstate_all_0");
		} catch (SQLException e) {
			
		}
		
		if(Constant.lType.equals("0")){
			
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					if (Constant.messageMap.size() >= Constant.G4) {
						break;
					}
					cl = (Client) list.get(i);
					themark = cl.getMark();
					if (themark.length() == 17) {
						msgList = new Mlt();
						msgList.ip = cl.getIp();
						Constant.messageMap.put(themark, msgList);
					}
				}
			}
			
		}else if(Constant.lType.equals("1")){
			
			String cMarks="";
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					cl = (Client) list.get(i);
					themark = cl.getMark();
					if(cMarks.equals("")){
						cMarks=themark;
					}else{
						cMarks=cMarks+","+themark;
					}					
				}
			}
			
			//随机生成8位数key
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			tempname=tempname.substring(tempname.length()-8, tempname.length());
					
			//拼接参数,请求
			String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+cMarks.trim()+"&key="+tempname;
			String result=HttpRequest.sendPost(Constant.NetJmInitUrl, param);
			
			//System.out.println("netJmInitUrl:"+Constant.NetJmInitUrl);
			//System.out.println("result:"+result);
					
			//解密
			try {
				result=DesUtil.decrypt(result, tempname);
				Map resultMap=JsonHelper.toMap(result); 
				String code=(String)resultMap.get("code");
						
				if(code==null){
						 //认证未通过[软加密]
						 System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
							
				}else{
					 if (code.equals("100001")){
						 //验证失败(账号或者密码不对)
						 System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
						 
					 }else if(code.equals("100002")){
						 //使用点位数超出总点位数	
						 System.out.println(Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]");
						 
					}else{
						 
						 if(code.equals("100000")){
							 
							 Constant.CHECKNETJMSTATE=true;
							 
							 done=93;
							 
							 //获取总点位
							 String netCountStr =(String)resultMap.get("netCount");
							 //获取使用点位
							 String surCountStr =(String)resultMap.get("surCount"); 
							
							 Constant.NetCountStr=netCountStr;
							
							 Constant.NetSurCountStr=surCountStr;
							
							 System.out.println(Constant.LOCAL.getA00514()+ "["+Constant.LOCAL.getA00506()+"]["+Constant.LOCAL.getA00515()+":"+netCountStr+"]["+Constant.LOCAL.getA00516()+":"+surCountStr+"]");
									
							 //获取认证终端多个以，分割     Mark_Start,Mark2_Start2  (Start 0 未认证 1认证)
									
							 String cMarksStr=(String)resultMap.get("noMarks");
							 String[] cMarkss=cMarksStr.split("\\,");
									
							 for (int i = 0; i < cMarkss.length; i++) {
										String[] cMarkStarts=cMarkss[i].split("\\_");
										
										if(cMarkStarts.length==2){
											
											//认证通过 
											if(cMarkStarts[1].equals("1")){
												
													themark = cMarkStarts[0];
													if (list != null) {
														for (int j = 0; j < list.size(); j++) {
			
															cl = (Client) list.get(j);
															if(cl.getMark().equals(themark)){
																theip=cl.getIp();
															}
														}
													}
													if (themark.length() == 17) {
														msgList = new Mlt();
														msgList.ip =theip;
														Constant.messageMap.put(themark, msgList);
														//更新终端软加密状态
														SqlConnect.getSqlMapInstance().update("update_client_mark_by_netstate1",themark);
													}
											}
											
											
											
										}
								 }
									
									
							 }else {
									System.out.println("异常编码:"+code+"  查询数据异常[软加密]");
							 }
								
						  }
						}
						
						
					} catch (Exception e) {
						System.out.println("请求地址超时或者解密失败[软加密]");
						Constant.CHECKNETJMSTATE=false;
						e.printStackTrace();
					}
					
			
			
			
			
		}else if(Constant.lType.equals("2")){
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					
					cl = (Client) list.get(i);
					themark = cl.getMark();
					if (themark.length() == 17) {
						
						themark=(String)Constant.vsLicensesMap.get(themark);
						
						if(themark!=null){
							
							msgList = new Mlt();
							msgList.ip = cl.getIp();
							Constant.messageMap.put(themark, msgList);
						
						}
						
						
					}
				}
			}
		}
		/*Server srvip;
		try {
			list = SqlConnect.getSqlMapInstance().queryForList(
					"init_all_servermark");
		} catch (SQLException e) {
		}
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (Constant.messageMap2.size() >= Constant.G4) {
					break;
				}
				srvip = (Server) list.get(i);
				themark = srvip.getMark().trim();
				
				if (themark.length() == 17) {
					msgList = new Mlt();
					msgList.ip = srvip.getIp();
					Constant.messageMap2.put(themark, msgList);
				}
			}
		}*/
		//删除下载策略状态是4的信息
		/*try {
			SqlConnect.getSqlMapInstance().delete("del_downjh_downstate4");
			SqlConnect.getSqlMapInstance().update("up_downjh_init_state1");
		} catch (SQLException e) {
			
		}*/
		
		
		// System.out.println(Constant.G4);
		Constant.T1 = new Timer();
		Constant.T1.schedule(new TimeMain(), 1000, 1000);

		if (done == 93) {
			//启动服务
			Constant.SV = new MainServer();
			Constant.SV.start();
			
			//消息处理
			//Constant.MRCMH=new MainReCeMsgHandle();
			//Constant.MRCMH.start();
			new MainPoolMsg().start();
			/*for (int i = 0; i < 2; i++) {
				new MainReCeMsgHandle("t"+i).start();
			}
			*/
			//Constant.SV2 = new OtherServer();
			//Constant.SV2.start();
			
			//统计在线时长
			new MainZxTimeStatics().start();
			// Listener listen = new Listener();
			// MainZxTimeStatics mainZxTimeStatics=new MainZxTimeStatics();
			// mainZxTimeStatics.addObserver(listen);
			// Thread thread=new Thread(mainZxTimeStatics); 
			// thread.start();
			 
			// new CheckThread(thread).start();
            
			 //消息队列发送
			 new MainSendMsgHandle().start();
			 
			 //消息队列重发发送
			 //new MainReSendMsgHandle().start();
			 
			
			 //广播接收打开
			 new LanSendServer().start();
			
			//统计播放队列
			new MainSucaiPlayCountHandle().start();
			
			//统计SDK广告播放
			new MainSucaiPlayCountSdkHandle().start();
			
			if(Constant.lType.equals("0")){
				Constant.DogCountStr=Constant.G4+"";
				if (Constant.PAN == 2) {
					System.out.println(Constant.LOCAL.getA00418()+"["+Constant.LOCAL.getA00505()+"]");
					System.out.println(Constant.G4);
				} else if (Constant.PAN == 1) {
					System.out.println(Constant.LOCAL.getA00419()+"["+Constant.LOCAL.getA00505()+"]");
					System.out.println(Constant.G4);
				}
				
			}
		
		}
	}
	
	
}