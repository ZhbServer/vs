package com.vshow.control.tool;

import io.netty.channel.ChannelHandlerContext;
import io.netty.util.AttributeKey;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.InetAddress;


import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.Vector;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownMediaResource;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolPlay;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.protocol.ProtocolUtil;
import com.vshow.control.tool.Local;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.CountSucai;
import com.vshow.control.data.CsSet;
import com.vshow.control.data.DpSend;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendDate;
import com.vshow.control.data.SendInteract;
import com.vshow.control.data.SendTime;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.bus.BusDevice;
import com.vshow.control.data.program.ResourceType;


/**
 * 工具类
 * **/
public class Constant {
	
	/**多语言选择*/
	public static String INDEXLANG="中文|ch_繁体|tw_english|en_한국어|hy_日本語|ry";
	public static String msg = "";
	public static int change = 0;
	public static long downtotal = 0;
	public static long alltotal = 0;
	public static long xiansu = 1;
	public static String tky = "";

	//public static SocketClient sc;
	//public static HttpDown hd;
	public static String svip = "";
	public static int lian = 10;
	public static MainServer SV = null;
	//public static OtherServer SV2 = null;
	public static int IPP = 93;
	public static int G4 = 2;
	public static int PAN = 0;
	public static String FILES = "";
	public static String EXE = "";
	public static String CAMERA = "";
	public static String PHOTOS = "";
	public static String SEE = "";
	public static String SCREEN = "";
	public static String LOG = "";
	public static String PLAYLOG="";
	public static Hashtable<String, Mlt> messageMap;
	//public static Hashtable<String, Socket> messageSK;
	//public static Hashtable<String, Mlt> messageMap2;
	//public static Hashtable<String, Socket> messageSK2;
	public static String IP="127.0.0.1";
	public static int TOTAL = 1;
	public static String GB = "";
	public static int OUT = 31000;
	public static Timer T1;
	public static Timer T2;
	public static Timer T3;
	public static boolean CLOSE = false;
	public static int TBTIME = 0;
	public static int TIMETBALL = 0;
    public static String LOCALDIE = "ch";
	public static Local LOCAL = new Local();
	public static int getVsLicensesFlag() {
		return vsLicensesFlag;
	}
	public static void setVsLicensesFlag(int vsLicensesFlag) {
		Constant.vsLicensesFlag = vsLicensesFlag;
	}


	public static int TIMEJK = 0;
	public static int TT = 0;
	public static String WEATHERKEY = "mWaC2m5UWytcWmIFFtmEOZQ8";  //天气Key(百度)
	
	public static final int WEEK1 = 0x00000001;
	public static final int WEEK2 = 0x00000010;
	public static final int WEEK3 = 0x00000100;
	public static final int WEEK4 = 0x00001000;
	public static final int WEEK5 = 0x00010000;
	public static final int WEEK6 = 0x00100000;
	public static final int WEEK7 = 0x01000000;
	public static final int WEEK_ALL = 0x01111111;
	
    public static final int OFFICETYPE=2;  //素材上传转换 类型 0 是按照以前方式  1是最新的方式 2 WPS方式上传 3openOffice
    
	public static final int OFFICEZOOM=5;  //文档转换成图片的清晰度  1~10 默认是5; 10最清晰
	
	public static String JIATOTAL = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(new Date());   //获取当前时间格式为"yyyy_MM_dd_HH_mm_ss"
	
	public static boolean HISTORYUPLOG=true; //发布日志同步到历史表
	
	public static MainReCeMsgHandle MRCMH = null; //处理接收消息 
	
	public static ConcurrentLinkedQueue<String> recemsgs;//接收消息队列
	
	public static ConcurrentLinkedQueue<String> playCountMsgs;//接收素材播放次数消息队列
	
	public static boolean MTFLAG=true; //Netty服务开关
	
	public static String VSCONFIG="";
	
	public static String lType="0";    //初始化类型 0 加密狗 1软加密2授权文件
	
	public static String lCheck="0";   //软加密验证通过  0验证未通过 1验证通过
	
	public static String lUsername=""; //软加密登陆账号
	
	public static String lPassword=""; //软加密登陆密码(已加密)
	
	public static String NetJmInitUrl="http://www.zckjserver.com:8512/zm/webserverdomac.w";  //初始化认证全部
	
	public static String NetJmAddUrl="http://www.zckjserver.com:8512/zm/webserveraddmac.w";  //新增/录入终端认证
	
	public static String NetJmDelUrl="http://www.zckjserver.com:8512/zm/webserverdelmac.w";  //删除终端认证
	
	public static String NetJmPeopleFaceUrl="http://www.zckjserver.com:8512/zm/webserverDoPeopleFaceCheck.w";  //人脸识别认证
	
	public static String NetJmPeopleFaceFbUrl="http://www.zckjserver.com:8512/zm/webserverDoPeopleFaceCheckFb.w";  //人脸识别发布验证
	
	public static String NetJmPeopleFaceGetPointUrl="http://www.zckjserver.com:8512/zm/webserverDoPeopleFaceGetPoint.w";  //人脸识别获取总点位和剩余点位
			
	public static String NetCountStr="0";     //软加密总点位
	
	public static String NetSurCountStr="0";  //软加密使用点位
	
	public static String DogCountStr="0";     //加密狗总点位
	
	public static String DogSurCountStr="0";  //加密狗使用点位
	
	public static Hashtable<String, String> imgMap = new Hashtable<String, String>();  //监控截屏 消息发送返回
	
	public static Hashtable<String, String> clientInfoMap = new Hashtable<String, String>();  //终端信息 消息发送返回
	
	public static String HLURL="";//汇率获取接口地址
	
	public static int OUTTIME=61;//Netty连接超时时间(秒)
	
	public static ConcurrentLinkedQueue<String> zxstates;  //离线、在线状态
	
	public static int CHANGEWIDTH=10000; //上传图片 超出限制  
	
	public static int CHANGEHEIGHT=10000; 
	
	public static Hashtable<String, String> cutMap = new Hashtable<String, String>();
	
	public static List<BusDevice>  busDataList=new ArrayList<BusDevice>();//公交站缓存数据
	
	public static boolean CHECKNETJMSTATE=true;     //检测软加密是否成功  true 不重新加载
	
	public static Hashtable<String,Object> itemMap = new Hashtable<String, Object>(); 
		
	public static final AttributeKey<NettyChannel> NETTY_CHANNEL_KEY = AttributeKey.valueOf("netty.channel");  
	
	public static final int UPVIDEOCLOUDTYPE=0;//上传视频上传云保存路径(0本机路径 1乐视云)
	
	public static final String WEATHERAUTOGE="自动获取"; //天气自动获取
	
	public static Hashtable<String, String> depositedMapCheck = new Hashtable<String, String>();
	
	public static Hashtable<String, MyMsg> downloadQueue = new Hashtable<String, MyMsg>();   //下载队列   key表示 mac@sendkey
	
	public static int downloadQueueSize = 10;   //下载队列 大小 默认为10
	
	public static int editPwdDay=30;
	
	public static Hashtable<String, Integer> warningMapCheck = new Hashtable<String, Integer>();  //电梯预警消息
	
	public static int vsLicenses=0; //初始化读取授权文件
	
	public static String vsLicensesPath="D://vs//server//webapps//vs//vsconfig//vsLicenses.txt"; //授权文件路径
	
	public static Hashtable<String,Object> vsLicensesMap = new Hashtable<String, Object>(); 
	
	public static int vsLicensesFlag=0; //初始化读取授权是否成功
	
	public static ConcurrentLinkedQueue<String> playCountMsgsSdk; //接收广告播放次数消息队列SDK
	
	public static Hashtable<String, Integer> dllMapCheck = new Hashtable<String, Integer>();  //Dll插件消息
	
	public static Hashtable<String, Object> dllMapInfo = new Hashtable<String, Object>();  //Dll插件信息
	
	public static Hashtable<String, MyMsg> messageMapCache=new Hashtable<String, MyMsg> (); //已发送消息缓存   key 有终端的    Mac@sendKey
	
	public static Integer lDayDiff=3;    //初始化预警节目天数
	
	public static boolean isFIleZY=true;//解决协议文件占用开关
	
	public static Hashtable<String, Object> clientPlayMap = new Hashtable<String, Object>();  //终端播放列表 消息发送返回
	
	public static void init()  {
		
		messageMap = new Hashtable<String, Mlt>();
		recemsgs=new ConcurrentLinkedQueue<String>();
		zxstates=new ConcurrentLinkedQueue<String>();
		playCountMsgs=new ConcurrentLinkedQueue<String>();
		playCountMsgsSdk=new ConcurrentLinkedQueue<String>();
		
		//messageSK = new Hashtable<String, Socket>();
		//messageMap2 = new Hashtable<String, Mlt>();
		//messageSK2 = new Hashtable<String, Socket>();
		/**多语言**/
		/*String csvalue="ch";
		try {
			csvalue = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_csset_csvalue", "local");
		} catch (SQLException e) {
			
		}*/
		try { 
			List<CsSet> css=SqlConnect.getSqlMapInstance().queryForList("sel_csset_all");
			for (CsSet csSet : css) {
				if(csSet.getCskey().equals("local")){
					Constant.LOCAL  =new GetLocal().getLocal(csSet.getCsvalue());
					continue;
				}else if(csSet.getCskey().equals("hl")){
					Constant.HLURL  =csSet.getCsvalue();
					continue;
				}				
			}
        } catch (SQLException e) {
			
		}
	}
	// 获取分页集合页码
	public static Pages getPages(int totalPage, int currPage) {
		List<Integer> qs = new ArrayList<Integer>();
		List<Integer> hs = new ArrayList<Integer>();
		int count = 1;
		Pages ps = new Pages();
		if (currPage >= totalPage) {
			currPage = totalPage;
		}
		if (totalPage - currPage < 3) {
			for (int j = currPage + 1; j <= totalPage; j++) {

				if (hs.size() < (totalPage - currPage)) {
					hs.add(j);
				}

			}
			for (int i = currPage - 1; i > 0; i--) {
				if (qs.size() < 6 - (totalPage - currPage)) {
                    qs.add(i);
				}

			}
		} else {

			for (int i = currPage - 1; i > 0; i--) {

				if (qs.size() < 6 - count) {
					qs.add(i);
					count++;

				}

			}
			for (int j = currPage + 1; j <= totalPage; j++) {

				if (hs.size() < 5 - (qs.size())) {
					hs.add(j);
				}

			}

		}

		Collections.sort(qs);

		ps.setQs(qs);
		ps.setHs(hs);
		return ps;
	}

	/**
	 * inputString 需要过滤的字符串
	 *  
	 * 过滤掉字符串的FONT标签
	 **/
	
	public static String replaceAllFont(String inputString){
		 String htmlStr=inputString; 
		 java.util.regex.Pattern p_font;   
		 java.util.regex.Matcher m_font;
		 
		 String regEx_font = "<FONT[^>]+>"; //定义FONT标签的正则表达式   
		 
		 p_font = Pattern.compile(regEx_font,Pattern.CASE_INSENSITIVE);   
         m_font = p_font.matcher(htmlStr);   
         htmlStr = m_font.replaceAll(""); //过滤<FONT>标签   
         
         
         htmlStr=htmlStr.replaceAll("</FONT>", "");
         
         return htmlStr;
		 
	}
	
	
	/**
	 * inputString 需要过滤的字符串
	 *  
	 * 过滤掉字符串的FONT标签
	 **/
	
	public static String replaceAllSpan(String inputString){
		String text = inputString.replaceAll("<STRONG>", "").replaceAll("</STRONG>", "")
		.replaceAll("<U>", "").replaceAll("</U>", "")
		.replaceAll("<STRIKE>", "").replaceAll("</STRIKE>", "")
		.replaceAll("<EM>", "").replaceAll("</EM>", "")
		.replaceAll("<P>", "").replaceAll("</P>", "<BR>")
		.replaceAll("<strong>", "").replaceAll("</strong>", "")
		.replaceAll("<u>", "").replaceAll("</u>", "")
		.replaceAll("<strike>", "").replaceAll("</strike>", "")
		.replaceAll("<em>", "").replaceAll("</em>", "")
		.replaceAll("&nbsp;", " ")
		.replaceAll("<P aligncenter>", "")
		.replaceAll("<P alignleft>", "")
		.replaceAll("<P align=center>", "")
		.replaceAll("<P align=right>", "")
		.replaceAll("<P aligncenter>", "")
		.replaceAll("<P align=left>", "")
		.replaceAll("<P alignright>", "").replaceAll("\r", "<BR>")
		.replaceAll("\n", "")
		.replaceAll("<p align=\"left\">", "")
		.replaceAll("<p align=\"center\">", "")
		.replaceAll("<p align=\"right\">", "")
		.replaceAll("</p>", "")
		.replaceAll("<\\/b>", "")
		.replaceAll("<b>", "")
		.replaceAll("<\\/B>", "")
		.replaceAll("<B>", "");
         
         return text;
		 
	}
	
	
	/**
	 * 统计素材
	 * @param itemid  节目id
	 */
	public static void countSucai(int itemid) {
		try {

			SqlMapClient sm = SqlConnect.getSqlMapInstance();
			// 删除全部统计
			sm.delete("del_countsucai_itemid", itemid);

			// 获取这个节目下所有场景
			List scenes = sm.queryForList("sel_item_allscene", itemid);
			Scene tempscene;
			String fs;
			int key;
			String[] ss;
			String tf;
			Sucai sc;
			CountSucai tempcs;
			CountSucai cs;
			for (int i = 0; i < scenes.size(); i++) {
				tempscene = (Scene) scenes.get(i);
				// 分割图片
				if (tempscene.getFcontent().length() > 0) {

					String[] fss = tempscene.getFcontent().split("\\/");
					
					for (int j = 0; j < fss.length; j++) {
						fs = fss[j];
						key = Integer.parseInt(fs.substring(0, 1));
						ss = fs.substring(1, fs.length()).split("\\|");

						if (key == 4) {
							for (int k = 6; k < ss.length; k++) {
								tf = ss[k];
								sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_filename", tf);
								if (sc != null) {
									tempcs = new CountSucai();
									tempcs.setSucaiid(sc.getId());
									tempcs.setItemid(itemid);
									// 查找存在不存在
									cs = (CountSucai) sm.queryForObject(
											"see_exist_countsucai", tempcs);
									if (cs == null) {
										cs = new CountSucai();
										cs.setItemid(itemid);
										cs.setSucaiid(sc.getId());
										cs.setType(1);
										cs.setCount(1);
										sm.insert("insert_one_countsucai", cs);
									} else {
										cs.setType(1);
										int tempcount = cs.getCount() + 1;
                                        cs.setCount(tempcount);
										sm.update("upd_countsucai", cs);
									}
								}

							}
						}
					}
				}

				// 分割图片和视频 vsjm.txt
				BufferedReader bis = new BufferedReader(new FileReader(
						Constant.FILES + File.separator
								+ tempscene.getFilename() + File.separator
								+ "vsjm.txt"));
				String contt = "";
				String tempd;
				while ((tempd = bis.readLine()) != null) {
					contt += tempd;
				}
				bis.close();
				contt = contt.trim();
				String[] cts = contt.split("\\*");
				String vssstr = "";
				if (cts.length == 7) {
					vssstr = cts[2].trim();

				}
				if (vssstr.length() > 0) {
					String sv;
					if (vssstr.indexOf(':') != -1) {

					} else {
						String[] svss = vssstr.split("\\#");
						for (int j = 0; j < svss.length; j++) {
							// 等于于0表示是视频
							if (Integer.parseInt(svss[j].substring(0, 1)) == 0) {
								String svsss = svss[j].substring(svss[j].indexOf('@') + 1);
								String[] fss = svsss.split("\\|");
								for (int k = 0; k < fss.length; k++) {
									sv = fss[k];
									if (new File(Constant.FILES+ File.separator + sv).exists()) {
										int cur = sv.lastIndexOf(".jm");
										if (cur != -1) {
											sc = (Sucai) SqlConnect
													.getSqlMapInstance()
													.queryForObject(
															"sel_sc_filename_like",
															sv.substring(0, cur));
										} else {
											sc = (Sucai) SqlConnect
													.getSqlMapInstance()
													.queryForObject(
															"sel_sc_filename",
															sv);
										}
										if (sc != null) {
											tempcs = new CountSucai();
											tempcs.setSucaiid(sc.getId());
											tempcs.setItemid(itemid);
											// 查找存在不存在
											cs = (CountSucai) sm
													.queryForObject("see_exist_countsucai",tempcs);

											if (cs == null) {
												cs = new CountSucai();
												cs.setItemid(itemid);
												cs.setSucaiid(sc.getId());
												cs.setType(2);
												cs.setCount(1);
												sm.insert("insert_one_countsucai",cs);
											} else {
												cs.setType(2);
												cs.setCount(cs.getCount() + 1);
												sm.update("upd_countsucai", cs);
											}
											// videolist.add(sc);
										}
									}
								}
							} else {
								String svsss = svss[j].substring(svss[j]
										.indexOf('@') + 1);
								String[] fss = svsss.split("\\|");
								for (int k = 0; k < fss.length; k++) {
									sv = fss[k];
									if (new File(Constant.FILES
											+ File.separator + sv).exists()) {

										sc = (Sucai) SqlConnect
												.getSqlMapInstance()
												.queryForObject(
														"sel_sc_filename", sv);
										if (sc != null) {
											tempcs = new CountSucai();
											tempcs.setSucaiid(sc.getId());
											tempcs.setItemid(itemid);
											// 查找存在不存在
											cs = (CountSucai) sm.queryForObject("see_exist_countsucai",tempcs);
                                            if (cs == null) {
												cs = new CountSucai();
												cs.setItemid(itemid);
												cs.setSucaiid(sc.getId());
												cs.setType(1);
												cs.setCount(1);
                                                sm.insert("insert_one_countsucai",cs);
											} else {
												cs.setType(1);
												cs.setCount(cs.getCount() + 1);
												sm.update("upd_countsucai", cs);
											}
										}
									}

								}

							}
						}
					}

				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/**
	 * current yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String getCurrentDate(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  
	}

	
	/**
	 * current  HH:mm:ss
	 * @return
	 */
	public static String getCurrentDate2(){
		return new SimpleDateFormat("HH:mm:ss").format(new Date());  
	}

	/**
	 * 判断终端在线不在线
	 */
	public static void checkClientZx(List<Client> clients){
		
		Client cl;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < clients.size(); i++) {

			Long lo = 0L;
			cl = (Client) clients.get(i);
		
			int sName = cl.getName().length();
			if (sName >= 30) {
				cl.setNamesub(cl.getName().substring(0, 30) + "...");
			} else {
				cl.setNamesub(cl.getName());
			}
			/*
			try {
				if (cl.getLast() == null || "".equals(cl.getLast())) {
					lo = 0L;
				} else {
					Date dd = df.parse(cl.getLast());
					long oDate = dd.getTime();
					long nDate = new Date().getTime();
					lo = nDate - oDate;
				}
			} catch (ParseException e) {
				lo = 0L;
				e.printStackTrace();
			}
			if (lo == 0) {
				clients.get(i).setZxstate(0);
			} else if (lo < Constant.OUT) {
				clients.get(i).setZxstate(1);
			} else {
				clients.get(i).setZxstate(0);
			}*/

		}
	}
	
	/** 显示截取名字(终端名)**/
	public static void subStringClientList(List<Client> list) {
		
		for (Client sc : list) {
			
			int sName = sc.getName().length();
			if (sName >= 10) {
				sc.setNamesub(sc.getName().substring(0, 9) + "...");
			} else {
				sc.setNamesub(sc.getName());
			}
		
		}
	}
	
	/**  截取网络模式图片名字(素材名)**/
	public static void subStringSucaiList(List<Sucai> list) {
		for (Sucai sc : list) {
			int sName = sc.getName().length();
			if (sName >= 10) {
				sc.setNamesub(sc.getName().substring(0, 9) + "...");
			} else {
				sc.setNamesub(sc.getName());
			}
		}
	}
	
	/**  截取过长素材名字(素材名)**/
	public static void subStringSucaiName(List<Sucai> list) {
		for (Sucai sc : list) {
			 
			
		}
	}
	
	
	/**
	 * 读取vsini
	 */
	public static void readVsIni(String url){
		Properties prop = new Properties();
		FileInputStream fis;
		try {
			fis = new FileInputStream(url);
			prop.load(fis);
			
			//获取lType
			lType=(String)prop.get("lType");
			if(lType==null){
				lType="0";
			}
			if(lType.equals("1")){
			   lCheck= (String)prop.get("lCheck");
			   if(lCheck==null){
				   lCheck="0";
			   }
			   lUsername=(String)prop.get("lUsername");
			   lPassword=(String)prop.get("lPassword");
				
			}
			
			IP=(String)prop.get("ip");
			if(IP==null||IP.equals("")){
				Constant.IP = InetAddress.getLocalHost().getHostAddress();
			}
			
			
	        String lDayDiffStr=(String)prop.get("lDayDiff");
		    if(lDayDiffStr==null||lDayDiffStr.equals("")){
		    	lDayDiff=3;
		    }else{
		    	lDayDiff=Integer.parseInt(lDayDiffStr);
		    }
		   
		    
			
			String downloadQueueSizeStr=(String)prop.get("downSize");
			
			if(downloadQueueSizeStr==null||downloadQueueSizeStr.equals("")){
				downloadQueueSize=20;
			}else{
				downloadQueueSize=Integer.parseInt(downloadQueueSizeStr);
			}
			
			
			Constant.LOCALDIE=(String)prop.get("language");
			if(Constant.LOCALDIE==null){
				Constant.LOCALDIE="ch";
			}
			
			String port1=(String)prop.get("port1");
			String port2=(String)prop.get("port2");
			String port3=(String)prop.get("port3");
			
			if(port1==null||port1.equals("")){
				port1="8511";
			}
			
			if(port2==null||port2.equals("")){
				port2="8512";
			}
			
			if(port3==null||port3.equals("")){
				port3="8513";
			}
			VCommon.port2=Integer.parseInt(port1);
			VCommon.port3=Integer.parseInt(port2);
			VCommon.port4=Integer.parseInt(port3);
			
			
			fis.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

	
	
	// 判断2个日期
	public static int compare_date(String DATE1, String DATE2) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dt1 = df.parse(DATE1);
			Date dt2 = df.parse(DATE2);
			if (dt1.getTime() > dt2.getTime()) {
				// System.out.println("当前 在下载前");
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				// System.out.println("当前在下载后");
				return -1;
			} else {
				// System.out.println("等于");
				return 0;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}
	
	

	
	
	//发布下载指令修改
	public static String sendDownString(String msg,String sendkey,Map<String,Object> map) {
		 
		 String msg0818="";
         
		 if(VVersion.onfff_60818==1){
        	 
         	String msgfile=Long.toString(System.currentTimeMillis())
				+ (int) (Math.random() * 100);
         	
         	File f = new File(Constant.FILES + File.separator + msgfile+".txt");
     		
         	FileOutputStream oldFileWriter;
     		
     		File newf = new File(Constant.FILES + File.separator + msgfile+".txt.new");
     		
     		FileOutputStream newFileWriter;
			
     		try {
     			
	     		//解析msg
	     		int type=0;
	     		try {
	     			 type=Integer.parseInt(msg.substring(0,2));
				} catch (Exception e) {
					 type=0;
				}
				
				if(type!=51){
					
					oldFileWriter = new FileOutputStream(f);
					oldFileWriter.write(msg.getBytes("UTF-8"));
		     		oldFileWriter.close();
		     		
				}
				
	     		msg0818="0+sendkey!" + sendkey + "%"+msgfile+".txt";
	     		
	     		if(type==2||type==44){
	     				
	     			    Protocol protocol=ProtocolUtil.protocolAnalysisMsg(msg, type);    
	     			    JSONObject jsonObject = JSONObject.fromObject(protocol);
			     		newFileWriter = new FileOutputStream(newf);
			     		//System.out.println(jsonObject.toString());
			     		newFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
			     		newFileWriter.close();
		     			
	     			
	     		}else if(type==10){
     			    
	     			Protocol protocol=new Protocol();
     			    
	     			protocol.setType(type);
     			    
	     			if(map!=null){
     			    	
     			    	List<ProtocolDownResource>  protocolDownResourceList=new  ArrayList<ProtocolDownResource>();  //下载资源
     			    	
     			    	ProtocolDownResource protocolDownResourceTemp=new ProtocolDownResource();
     			    	
     			    	String fileMd5=map.get("fileMd5")+"";
     			    	
     			    	long apklength=Long.parseLong(map.get("apklength")+"");
     			    	
     			    	String gxFileName=map.get("gxFileName")+"";
     			    	
     			    	protocol.setDownResourceSize(apklength);
     			    	
     			    	protocolDownResourceTemp.setFileMd5(fileMd5);
     			    	
     			    	protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+gxFileName);
     			    	
     			    	protocolDownResourceTemp.setFileName(gxFileName);
     			    	
     			    	protocolDownResourceList.add(protocolDownResourceTemp);
     			    	
     			    	protocol.setProtocolDownResourceList(protocolDownResourceList);
     			    	
     			    	protocol.setSendkey(sendkey);
     			    	
     			    	JSONObject jsonObject = JSONObject.fromObject(protocol);
     			    	
			     		newFileWriter = new FileOutputStream(newf);
			     		
			     		//System.out.println(jsonObject.toString());
			     		newFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
			     		
			     		newFileWriter.close();
     			    	
     			    }
	     			
	     		}else if(type==51){
	     			    
	     			
	     			    Protocol protocol=ProtocolUtil.protocolAnalysisMsg(msg, type);
	     			    
	     			    protocol.setType(ProtocolType.TYPE51);
	     			    
	     			    ProtocolPlayBase ppb=new ProtocolPlayBase();
	     			    
	     			    ppb.setmType(ResourceType.TYPE_USER_PROGRAM_MANAGER);
	     			    
	     			    ProtocolPlay  protocolPlay= protocol.getProtocolPlayList().get(0);
	     			    
	     			    protocolPlay.setAccount(map.get("uAccount")+"");
	     			    
	     			    ppb.setmMsgJson(protocolPlay);
	     			    
	     			    protocol.setProtocolPlayBaseList(ppb);
	     			    
	     			    JSONObject jsonObject = JSONObject.fromObject(protocol);
	     			    
	     			   
	     			    
	     			    oldFileWriter = new FileOutputStream(f);
						oldFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
			     		oldFileWriter.close();
			     		
			     		
			     		newFileWriter = new FileOutputStream(newf);
			     		//System.out.println(jsonObject.toString());
			     		newFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
			     		newFileWriter.close();
	     		}else if(type==61){
     			    
	     			
     			    Protocol protocol=ProtocolUtil.protocolAnalysisMsg(msg, type);
     			    
     			    protocol.setType(ProtocolType.TYPE61);
     			    
     			    protocol.setProtocolPlayBaseList("");
     			   
     			    JSONObject jsonObject = JSONObject.fromObject(protocol);
     			    
     			    oldFileWriter = new FileOutputStream(f);
					oldFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
		     		oldFileWriter.close();
		     		
		     		
		     		newFileWriter = new FileOutputStream(newf);
		     		//System.out.println(jsonObject.toString());
		     		newFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
		     		newFileWriter.close();
     		}else if(type==70){
 			    
     			
 			    Protocol protocol=ProtocolUtil.protocolAnalysisMsg(msg, type);
 			    
 			    protocol.setType(ProtocolType.TYPE70);
 			    
 			    protocol.setProtocolPlayBaseList("");
 			   
 			    JSONObject jsonObject = JSONObject.fromObject(protocol);
 			    
 			    oldFileWriter = new FileOutputStream(f);
				oldFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
	     		oldFileWriter.close();
	     		
	     		
	     		newFileWriter = new FileOutputStream(newf);
	     		//System.out.println(jsonObject.toString());
	     		newFileWriter.write(jsonObject.toString().getBytes("UTF-8"));
	     		newFileWriter.close();
 		   }else{
	     			newFileWriter = new FileOutputStream(newf);
		     		newFileWriter.write(msg.getBytes("UTF-8"));
		     		newFileWriter.close();
	     			
	       }
	     		
	     		
	     	
	     		
	     		
	     		
	     		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
     		
			
			
			
		  }else{
		    	msg0818=msg;
		  }
          return msg0818;
	 } 
	
	
	//终端重置百分比
	public static void ResetDownState(String mark,String downstate){
		Client client=new Client();
		client.setMark(mark);
		client.setDownstate(downstate);
		try {
			SqlConnect.getSqlMapInstance().update("update_downstate", client);
		} catch (SQLException e) {
			
		}
	}
	
	
	/**
	 * current  yyyy-MM-dd-HH-mm-ss
	 * @return
	 */
	public static String  getCurDate3(){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		return sf.format(new Date());
		
	} 
	
	
	/**
	 * 生成sendkey
	 */
	public static String createSendkey(int uid,String date){
		return date + "-" + uid + "-" + (int) (Math.random() * 10000);
	}
	
	
	/**
	 * 解析获取sendkey
	 */
	public static String resolveSendkey(String msg){
		int skl_b=msg.indexOf("sendkey!");
        if(skl_b==-1){
       	    skl_b=msg.indexOf("+")+1;
        }else{
       	    skl_b=skl_b+8;
        }
        int skl_e=msg.length();
        
        String nsk=msg.substring(skl_b, skl_e);
        
        skl_e=nsk.indexOf("%");
  
        if(skl_e!=-1){
      	  nsk=nsk.substring(0, skl_e);
        }
        
        return nsk;
        
	}
	
	
	
	/**
	 * 比例缩放图片 
	 * @param imgw  图片原宽度
	 * @param imgh  图片原高度
	 * @param pro   图片缩放比
	 * @param oimg  图片原文件
	 * @param nimg  图片缩放后的文件
	 * @param type  图片类型
	 * @throws IOException  
	 **/
	public static void setImgPro(int imgw, int imgh,double pro,File oimg,File nimg,String type) throws IOException{
		 
		
		  if(imgw>Constant.CHANGEWIDTH||imgh>Constant.CHANGEHEIGHT){
			 if(pro==0.1){
				 Thumbnails.of(oimg.getPath())
				 .size(imgw, imgh)     
				 .outputFormat(type)  
				 .outputQuality(1f)  	
				 .toFile(nimg.getPath());  
	    	 }else{
	    		 imgw=(int)(imgw*pro);
	             imgh=(int)(imgh*pro);
	             pro=pro-0.1;
	             setImgPro(imgw,imgh,pro,oimg,nimg,type);
	         }
	      }else{
	    	     Thumbnails.of(oimg.getPath())
				 .size(imgw, imgh)   
				 .outputQuality(1f)  	
				 .toFile(nimg.getPath());  
	    	  
	      }
		 
	
	}
	
    /**
     * @param srcImgPath   原图片路径 
     * @param distImgPath  转换大小后图片路径 
     * @param width        转换后图片宽度 
     * @param height       转换后图片高度 
     * @param type         转换图片类型
     */  
    public static void resizeImage(String srcImgPath, String distImgPath,  
            int width, int height,String type) throws IOException {  
	        File srcFile = new File(srcImgPath);  
	        Image srcImg = ImageIO.read(srcFile);  
	        BufferedImage buffImg = null;  
	        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
	        buffImg.getGraphics().drawImage(  
	                srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0,  
	                0, null);  
	        ImageIO.write(buffImg, type, new File(distImgPath));  
    }  
	
    
    
    /**
     * 递归调用 获取 互动节目的所有 filename
     * @param  filename 
     * @throws SQLException 
     */
   
    public static void recursionFileNameTson(String filename,List<Scene> scenesList) throws SQLException{
    	
    	for (Scene scene : scenesList) {
			if(filename.equals(scene.getFilename())){
				return;
			}
		}
    	
    	Scene tScene=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_filenames", filename);
    	if(tScene!=null){
    		scenesList.add(tScene);
        	if(tScene.getTson()!=null&&!tScene.getTson().equals("")){
        		String tsons[]=tScene.getTson().split("\\|");
        		for (int i = 0; i < tsons.length; i++) {
        			recursionFileNameTson(tsons[i],scenesList);
    			}
        	}
    	}
        
    }
    
    
	

	/**
	 * 验证终端是否被禁用
	 */
	public static int checkDisabledClient(HashSet<Integer> tmidsset) throws SQLException{
		Client client;
		for (Integer cid : tmidsset) {
				client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", cid);
				if(client.getDisabledstate()==0){
					return 0;
				}else{
					return 1;
				}
		}
		return 1;
		
	}
	
	
	
	 
    /**
     * 更新所有场景节目的总大小
     * @param  filename 
     * @throws SQLException 
     */
   
    public static void updateAllSceneItemAllclen(long allclen,List<Scene> scenesList) throws SQLException{
    	
    	InteractItem interactItem;
    	for (Scene scene : scenesList) {
    		if(scene!=null){
    			interactItem=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename", scene.getFilename());
    			if(interactItem!=null){
    				interactItem.setAlllen(allclen);
    				SqlConnect.getSqlMapInstance().update("upd_interactitem_alllen", interactItem);
    			}
    		}
		}
    }
    
    
    
	/**
	 * ini写入
	 */
	public static void writeIni(String url,Map<String,String> map){
		Properties prop = new Properties();
		FileOutputStream oFile;
		try {
			
			File file=new File(url);
			file.deleteOnExit();
			file.createNewFile();
			
			oFile = new FileOutputStream(url);
			
			for(Iterator itr =map.keySet().iterator(); itr.hasNext();){
		    	   
				   String key = (String) itr.next();
		    	   
		    	   prop.setProperty(key, map.get(key));
		    	  
		    }
			 
			prop.store(oFile, DateUtil.getTime());
			
		    oFile.close();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//发布下载指令修改
	public static String createDownString(String msg,String sendkey) throws Exception {
		
		 
		 String msgfile=Long.toString(System.currentTimeMillis())
			+ (int) (Math.random() * 100);
  	     File f = new File(Constant.FILES + File.separator + msgfile+".txt");
		 FileOutputStream oldFileWriter;
		
		 File newf = new File(Constant.FILES + File.separator + msgfile+".txt.new");
		 FileOutputStream newFileWriter;
		 
		 
		 
		 oldFileWriter = new FileOutputStream(f);
		 oldFileWriter.write(msg.getBytes("UTF-8"));
	     oldFileWriter.close();
		
	     
	 	 newFileWriter = new FileOutputStream(newf);
 		 newFileWriter.write(msg.getBytes("UTF-8"));
 		 newFileWriter.close();
 		
			
 		 String msg0818="0+sendkey!" + sendkey + "%"+msgfile+".txt";
  		 
  		 return msg0818;
  		
  		
		
		
	}	 
	
	
	//创建mark
	public static  String createMark(){
		String userId = java.util.UUID.randomUUID().toString().split("\\-")[4];
		String mark=(userId.substring(0,2)+":"+
		            userId.substring(2,4)+":"+
		            userId.substring(4,6)+":"+
		            userId.substring(6,8)+":"+
		            userId.substring(8,10)+":"+
		            userId.substring(10,12)).toUpperCase();
		
		return mark;
	}
	
	//登陆获取IP
	public static String getIp(HttpServletRequest request) {
		
        String ip = request.getHeader("x-forwarded-for");
        
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        
        if(ip.equals("0:0:0:0:0:0:0:1")){
        	
        	ip="127.0.0.1";
        }
        
        return ip;
    }
	
	//解析授权文件
	public static void resolveVsLicenses() throws IOException, Exception{
		
		//验证读取授权文件
		
		String vsLicensesTxt=FileHandle.readTxtFile(vsLicensesPath);
		
		if(vsLicensesTxt.equals("")){
		
		}else{
			
			//解析文件
			try {
				vsLicensesTxt=DesUtil.decrypt(vsLicensesTxt, DesUtil.keyStatic);
			} catch (Exception e) {
				// TODO: handle exception
				//t/lpDFQLWQTL17V9W2YV7Y56zj7lGhEtqorriCgfujpwVwPs6lAaZA==
			}
			System.out.println(vsLicensesTxt);
			
			String vsLicensesTxts[]=vsLicensesTxt.split("\\,");	
			
			String licensesMark="";
			
			vsLicensesMap.clear();
			
			for (int i = 0; i < vsLicensesTxts.length; i++) {
				
				licensesMark=vsLicensesTxts[i];
				
				if(licensesMark.length()==17){
					
					vsLicensesMap.put(licensesMark, licensesMark);
					
				}
			}
			
		}
	}
	public static void main(String[] args) throws IOException, Exception {
		
		//解析授权文件
		//resolveVsLicenses();
		
		//加密授权文件
	    //jmVsLicenses();
		
	
	}
	
	
	//加密授权文件
	public static void jmVsLicenses() throws Exception {
		
		//验证读取授权文件
		
		String vsLicensesTxt=FileHandle.readFileByLines(vsLicensesPath);
		
		if(vsLicensesTxt.equals("")){
		
		}else{
			
			//加密文件	
			String vsLicensesTxtJm=DesUtil.encrypt(vsLicensesTxt,DesUtil.keyStatic);
			
			//写入
			try {
				FileHandle.readFileInfo(vsLicensesPath,vsLicensesTxtJm);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
	}
	
	//当协议文件无法被下载时,新建一个文件
	public static void stateFileTo() throws Exception
	{	
		int rlid = 0;
		int qx[] = null;
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		// 获取发布的日志信息
		List<Client> clients = new ArrayList<Client>();

		clients = SqlConnect.getSqlMapInstance().queryForList(
				"sel_last_result", uid);
		if (clients.size() > 0) {
			rlid = clients.get(0).getLid();
		}

		Log olog = null;

		olog = (Log) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_log_send_all_id", rlid);

		Client cl;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < clients.size(); i++) {
			qx[i] = clients.get(i).getRid();

		}
		if (olog != null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
			String date = sf.format(new Date());
			olog.setSdate(date);
			olog.setSendkey(Constant.createSendkey(uid, date));
			olog.setUrid(uid);
			int logid = (Integer) SqlConnect.getSqlMapInstance().insert(
					"add_log_send", olog);
			olog.setId(logid);
			// System.out.println(olog.getMsg());
			// String osendkey=Constant.resolveSendkey(olog.getMsg());

			int skl_b = olog.getMsg().indexOf("sendkey!");
			if (skl_b == -1) {
				skl_b = olog.getMsg().indexOf("+") + 1;
			} else {
				skl_b = skl_b + 8;
			}
			int skl_e = olog.getMsg().length();

			String nsk = olog.getMsg().substring(skl_b, skl_e);

			if (olog.getStype() == 20) {
				skl_e = nsk.indexOf("#");

				if (skl_e != -1) {
					nsk = nsk.substring(0, skl_e);
				}
			} else {
				skl_e = nsk.indexOf("%");

				if (skl_e != -1) {
					nsk = nsk.substring(0, skl_e);
				}

			}

			JSONObject jsonObject;
			Protocol protocol;
			String msg;
			switch (olog.getStype()) {
			case 100:
			case 101:
			case 104:

				jsonObject = JSONObject.fromObject(olog.getMsg());
				protocol = (Protocol) JSONObject.toBean(jsonObject,
						Protocol.class);
				protocol.setSendkey(olog.getSendkey());

				jsonObject = JSONObject.fromObject(protocol);

				msg = jsonObject.toString();

				olog.setMsg(msg);
				break;

			default:
				olog.setMsg(olog.getMsg().replaceAll(nsk, olog.getSendkey()));
				break;
			}

			SqlConnect.getSqlMapInstance().update("upd_log_send_msg", olog);

			int rid;
			Result oresult;

			MyMsg mymsg;
			for (int i = 0; i < qx.length; i++) {
				// 获取rid对象
				oresult = (Result) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_result_all_id", qx[i]);
				if (oresult != null) {
					int orid = oresult.getId();
					// 插入新的result结果
					oresult.setState(0);
					oresult.setLogid(olog.getId());
					rid = (Integer) SqlConnect.getSqlMapInstance().insert(
							"ad_result", oresult);
					// 获取终端信息
					Client client = (Client) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_client_byid",
									oresult.getClid());
					// 判断result类型
					String msg0818;
					if (oresult.getType() == 1 || oresult.getType() == 2
							|| oresult.getType() == 16
							|| oresult.getType() == 17
							|| oresult.getType() == 18
							|| oresult.getType() == 23) {
						// 发送给终端
						msg0818 = Constant.sendDownString(olog.getMsg(),
								olog.getSendkey(), null);
						String itemids = "";
						int type = 1;
						// 普通发布
						if (oresult.getType() == 1) {
							Send sd = (Send) SqlConnect.getSqlMapInstance()
									.queryForObject("sel_send_all_id", orid);
							sd.setResultid(rid);
							itemids = sd.getItemids();
							SqlConnect.getSqlMapInstance()
									.insert("ad_send", sd);
							type = 1;
						} else if (oresult.getType() == 2) {
							SendInteract sd = (SendInteract) SqlConnect
									.getSqlMapInstance().queryForObject(
											"sel_send_interact_all_id", orid);
							sd.setResultid(rid);
							itemids = sd.getInteractitemid() + "";
							SqlConnect.getSqlMapInstance().insert(
									"insert_one_sendinteractitem", sd);
							type = 2;
						} else if (oresult.getType() == 16) {
							SendTime sd = (SendTime) SqlConnect
									.getSqlMapInstance().queryForObject(
											"sel_send_time_all_id", orid);
							itemids = sd.getItemid();
							SqlConnect.getSqlMapInstance().insert(
									"insert_one_timeitem", sd);
							type = 1;
						} else if (oresult.getType() == 17) {
							InsertSend sd = (InsertSend) SqlConnect
									.getSqlMapInstance().queryForObject(
											"sel_send_insert_all_id", orid);
							itemids = sd.getItemid();
							SqlConnect.getSqlMapInstance().insert(
									"insert_one_insertitem", sd);
							type = 1;
						} else if (oresult.getType() == 18) {
							DpSend sd = (DpSend) SqlConnect.getSqlMapInstance()
									.queryForObject("sel_send_dp_all_id", orid);
							itemids = sd.getItemid();
							SqlConnect.getSqlMapInstance().insert(
									"insert_one_dpitem", sd);
							type = 1;
						} else if (oresult.getType() == 23) {
							SendDate sd = (SendDate) SqlConnect
									.getSqlMapInstance().queryForObject(
											"sel_send_dp_all_idz", orid);
							itemids = sd.getItemids();
							SqlConnect.getSqlMapInstance().insert(
									"ad_send_date", sd);
							type = 1;
						}
						ClientPlayHandle.insertClientPlay(itemids, type,
								oresult.getType(), olog.getContent(),
								olog.getUrid(), client.getMark(),
								olog.getSendkey(), 0);

					} else if (oresult.getType() == 7) {
						// System.out.println(olog.getMsg());
						// 1073015/port.apk+2017-05-12-16:26:18-1-1829
						String msginfo = olog.getMsg();

						String apklength = msginfo.split("\\/")[0].substring(2,
								msginfo.split("\\/")[0].length());
						String gxFileName = msginfo.split("\\/")[1]
								.split("\\+")[0];
						String sendkey = msginfo.split("\\/")[1].split("\\+")[1];
						File file = new File(Constant.FILES + File.separator
								+ gxFileName);
						String fileMd5 = MD5Util.getMd5ByFile(file);
						// 发送给终端
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("fileMd5", fileMd5);
						map.put("apklength", apklength);
						map.put("gxFileName", gxFileName);
						msg0818 = Constant
								.sendDownString(msginfo, sendkey, map);
						// System.out.println(msg0818);

						ChannelHandlerContext ccontext = VSNettyChannelMap
								.get(client.getMark());
						int code = 0;
						if (ccontext != null) {
							NettyChannel nettyChannel = NettyChannelUtil
									.getChannelHandlerContextNettyChannel(ccontext);
							if (nettyChannel != null) {
								if (nettyChannel.getCode() == 3) {
									code = 3;
								}
							} else {

							}
						}

						if (code == 3) {
							msg0818 = msg0818;
						} else {
							msg0818 = olog.getMsg();
						}

						// msg0818=olog.getMsg();
					} else {

						msg0818 = olog.getMsg();

					}

					if (client.getServerid() == 0) {
						Mlt mt = Constant.messageMap.get(client.getMark());
						if (mt != null) {
							mymsg = new MyMsg();
							mymsg.msg = msg0818;
							mymsg.sendkey = olog.getSendkey();
							mt.allmsg.add(mymsg);
						}
					}
				}
			}

		}
	}
	
}
