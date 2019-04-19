package com.vshow.control.item;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.ibatis.sqlmap.client.SqlMapClient;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;



import com.vshow.control.data.ItemEditHistory;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.ItemKey;
import com.vshow.control.data.ItemMaterial;
import com.vshow.control.data.Scene;
import com.vshow.control.data.SceneContent;

import com.vshow.control.data.Sucai;

import com.vshow.control.data.program.ProgramBus;
import com.vshow.control.data.program.ProgramComplexHtml;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramComplexWeather;
import com.vshow.control.data.program.ProgramDataSource;
import com.vshow.control.data.program.ProgramDll;
import com.vshow.control.data.program.ProgramDllItem;

import com.vshow.control.data.program.ProgramHtml;
import com.vshow.control.data.program.ProgramImageGroup;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.data.program.Program;
import com.vshow.control.data.program.ProgramNetCamera;
import com.vshow.control.data.program.ProgramPublic;
import com.vshow.control.data.program.ProgramQueue;
import com.vshow.control.data.program.ProgramRss;
import com.vshow.control.data.program.ProgramScreen;
import com.vshow.control.data.program.ProgramTime;
import com.vshow.control.data.program.ProgramTxt;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.data.program.ResourceType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.HtmlUtil;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.VVersion;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;


public class SaveSceneAction extends ActionSupport {

	private String content;
	private String mfile;
	private String mcontent;
	private String name;
	private String seecontent;


	private String fcontent;
	private int stime;
	private String gcontent;
	private float sf;
	private String citykey;
	private String rsskey;
	private String text;
	private String timeTxt;
	private String timeHtml;
	
	private String av;
	private String ssshow;
	private String streamurl;
	
	

	private String gncj;
	private String hltxt;
	private String wtime;
	private String bginfo;
	private String mtable;


	private String lcsh; // 楼层显示
	
	private String flash;//flash 信息
	
	private String html; //网页提取信息
	
	private String jptxt; //桌面截屏
	
	private String appstrs; //app跳转

	private String itemname;
	
    private int validityCheck;  //节目是否有有效期 0没有  1有
    
    private String code2;       //二维码
    
    private String netcamera;   //网络摄像
    
    private String queue_many;  //叫号集中数据显示
    
    private String queue_single; //单屏显示单条数据

	private String jsonImgs;    //图片元素
	
	private String jsonVideos;  //视频,图片,音频混合元素
	
	private String bus_data;     //公交巴士显示数据

    private String jsonDlls;     //插件集合
    
	private String jsonSource;   //数据接口
	
    private String jsonDllItem;   //控件节目
    
    private String jsonImgsGroup; //图片组
    
    private String jsonImgsFlip; //翻书
    
    private int itemViceType;   //1为双屏节目
    
    private String itemKey;//节目key

   
    private int upFblSave;    //修改分辨率前 先保存节目  状态为1 修改分辨率
    
	private int upFblId;      //需要修改的分辨率id
	
	private int itemid;       //节目id

	public String execute() throws Exception {

		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		int urid = (Integer) session.get("urid");
        
		Local local = (Local) session.get("local");
		
		//获取节目播放模式
		Integer itemPlayType=(Integer)session.get("itemPlayType");
		
		 //是否是新增节目
		boolean isNewItem = true;
		
		
		// 先查询节目是否存在
		// 获取节目
		Item item = (Item) session.get("item");
		
		if (item.getId() == 0) {
			// 插入节目
			sm.insert("insert_one_item", item);
			// 并且返回刚插入节目的信息
			item = (Item) sm.queryForObject("sel_zjitem", item);
			session.put("item", item);
			LogHandle.insertTheLog(LogType.type6, urid, local.getA00387()+ ":" + item.getName(), 1,1);
			
			//播放模式默认为0重复播放不插入节目属性表
			/*if(itemPlayType==null||itemPlayType==0){
			}else{
				ItemProperty itemp=new ItemProperty();
				itemp.setIid(item.getId());
				itemp.setPlaytype(itemPlayType);
		        sm.insert("ad_item_p",itemp );
			}*/
			
			//节目与分组建立关系
			ItemGroupRelation sgr=new ItemGroupRelation();
			
		    Integer igid=(Integer)session.get("igid");
		    if(igid==null||igid==-2){
		    	igid=0;
		    }
		    sgr.setItemid(item.getId());
		    sgr.setItemgroupid(igid);
			sm.insert("ad_item_group_relation", sgr);
			
		} else {
			
			// 节目已存在查找
			item = (Item) sm.queryForObject("sel_zjitem", item);
				
			int ocheck = (Integer) session.get("urcheck");
			
			if (ocheck == 0 || ocheck == 2) {
				item.setOcheck(0);
			} else if (ocheck == 1 || ocheck == 3) {
				item.setOcheck(1);
			}
			
			
			if(item.getUserid()!=urid){
				//修改共享节目
				LogHandle.insertTheLog(LogType.type8, urid, local.getA00833()+"["+local.getB00015()+"]"
						+ ":" + item.getName(), 1,1);
				
			}else{
				//修改节目
				LogHandle.insertTheLog(LogType.type8, urid, local.getA00833()
						+ ":" + item.getName(), 1,1);
				
			}
			
		}
		
		
        // 判断场景是否存在
		Scene scene = null;
		Object obj = sm.queryForObject("sel_scfilename_scene", mfile);
		if (obj != null) {
			
			scene = (Scene) obj;
			
			String filepathzip = Constant.FILES + File.separator
					+ scene.getFilename() + ".zip";
			
			
            isNewItem = false;
			
			//删除旧节目的节目包时，先创建文件夹暂时复制放起来
			//File oldDir = new File(Constant.FILES + File.separator +"oldDir");
			//oldDir.mkdirs();			
			//FileInputStream fis = new FileInputStream(filepathzip);
			//FileOutputStream fos = new FileOutputStream(oldDir.getPath()+ File.separator
			//		+ scene.getFilename() + ".zip");
			//int len = 0;
			//byte[] buf = new byte[1024];
			//while ((len = fis.read(buf)) != -1) {
			//	fos.write(buf, 0, len);
			//}
			//fos.close();
			//fis.close();
			
			
			
			// 删除zip
			FileHandle.deleteFile(filepathzip);
			session.put("item", item);
		}
		
		
		
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		mfile = mfile.trim();

		mcontent = mcontent.replaceAll("http://" + Constant.IP
				+ ":"+VCommon.port3+"/vs/files", "files");
		
		String dir = Constant.FILES + File.separator + mfile;

		File f = new File(dir + File.separator + "see.html");
		
		FileOutputStream oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(seecontent.getBytes("UTF-8"));
		oldFileWriter.close();
		
		if(validityCheck==0){
			
			if (new File(dir + File.separator + "cjtime.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "cjtime.txt");
			}
		}
		
        //添加播放模式
		
		if(itemPlayType==null||itemPlayType==0){
			FileHandle.deleteFile(dir + File.separator + "play.txt");
		}else{
			f = new File(dir + File.separator + "play.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(itemPlayType.toString().getBytes("UTF-8"));
			oldFileWriter.close();
		}
	
		
		if (code2 == null || "".equals(code2)) {
			
			if (new File(dir + File.separator + "2code.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "2code.txt");
			}

		} else {
			
			if (new File(dir + File.separator + "2code.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "2code.txt");
			}
			
			f = new File(dir + File.separator + "2code.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(code2.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
	
		
		if (appstrs == null || "".equals(appstrs)) {
			if (new File(dir + File.separator + "app.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "app.txt");
			}

		} else {
			if (new File(dir + File.separator + "app.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "app.txt");
			}
			f = new File(dir + File.separator + "app.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(appstrs.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
		
		
		if (gncj == null || "".equals(gncj)) {
			if (new File(dir + File.separator + "gncj.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "gncj.txt");
			}

		} else {
			if (new File(dir + File.separator + "gncj.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "gncj.txt");
			}
			f = new File(dir + File.separator + "gncj.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(gncj.getBytes("UTF-8"));
			oldFileWriter.close();
		}

	
        
		

		
    //*************************************协议生成****************************************************
			//创建节目文件
			Program pg=new Program();
			
			//新
			Program pg2=new Program();
			
			String x86tev = "";
			MorphDynaBean md;
			//分辨率
			Scene tempScene = (Scene) session.get("scene");
			pg.setmProgramWidth(tempScene.getTx());
			pg.setmProgramHeight(tempScene.getTy());
			
			pg2.setmProgramWidth(tempScene.getTx());
			pg2.setmProgramHeight(tempScene.getTy());
			
			//节目文件名
			pg.setmProgram(mfile);
			pg.setmPtype(1);
			
			pg2.setmProgram(mfile);
			pg2.setmPtype(1);
			
			try {
				  JSONObject jsonMcontent=JSONObject.fromObject(mcontent);
				  pg.setBgColor(jsonMcontent.getString("bgColor"));
				  pg2.setBgColor(jsonMcontent.getString("bgColor"));
				
			} catch (Exception e) {
				// TODO: handle exception
			}
	      
			
			
			
			//背景
			if (bginfo == null || "".equals(bginfo)) {
				pg.setmBackground("0");
				pg2.setmBackground("0");
			}else{
				pg.setmBackground(bginfo);
				pg2.setmBackground(bginfo);
			}
			
			
			//节目时长
			pg.setmProgramTimeout(stime);
			pg2.setmProgramTimeout(stime);
			
			//节目大小
			pg.setmProgramSize(0);
			pg2.setmProgramSize(0);
			
			//节目名
			pg.setmProgramName(item.getName());
			pg2.setmProgramName(item.getName());
			
			List<ProgramComplexMediaManager> complexMediaList=new ArrayList<ProgramComplexMediaManager>();
			
			

			//插件集合显示(所有控件都在这个集合里面)
			List<ProgramPublic> mDlls=new ArrayList<ProgramPublic>();
			
			
			//插件集合显示(所有控件都在这个集合里面)
			List<ProgramPublic> mDlls2=new ArrayList<ProgramPublic>();
			
			
			ProgramComplexMediaManager cmm;
			ProgramMedia media;
			List<ProgramMedia> mediaList;
			
		
			
			//视频,音频,图片
			if(jsonVideos==null||jsonVideos.equals("")){
				
			}else{
				
				JSONArray json = JSONArray.fromObject(jsonVideos);
				
				
				List<ProgramComplexMediaManager> pcmms= (List<ProgramComplexMediaManager>)JSONArray.toCollection(json, ProgramComplexMediaManager.class);			  
			    for (ProgramComplexMediaManager programComplexMediaManager : pcmms) {
			    	
			    	List resourcesList= programComplexMediaManager.getmMediaList();
			    	for (int i = 0; i < resourcesList.size(); i++) {
			    		md=(MorphDynaBean)resourcesList.get(i);
			    	
			    		if(x86tev.length()==0){
			        		x86tev=(String)md.get("path");
			        	}else{
			        		x86tev=x86tev+"|"+(String)md.get("path");
			        	}
			    		
			    		
			    	}
			    	programComplexMediaManager.setType(ResourceType.TYPE_VIDEO);
			    	if(VVersion.itemDllOnOff==0){
			    		complexMediaList.add(programComplexMediaManager);	
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(programComplexMediaManager);
			    	}
			    	mDlls2.add(programComplexMediaManager);
					
					
					
				}
			    
			}
			
			//图片组
			//元素id~x~y~w~h~切换时间~播放列表~跳转场景(默认为0)~特效*元素id~x~y~w~h~切换时间~播放列表~跳转场景~特效
			if(jsonImgsGroup==null||jsonImgsGroup.equals("")){
			}else{
				
				JSONArray json = JSONArray.fromObject(jsonImgsGroup);
				
				List<ProgramImageGroup> pcmms= (List<ProgramImageGroup>)JSONArray.toCollection(json, ProgramImageGroup.class);			  
			    
				for (ProgramImageGroup programImageGroup : pcmms) {
			    	
			    	programImageGroup.setType(ResourceType.TYPE_IMAGE_GROUP);
			    	
			    	mDlls.add(programImageGroup);
			    	
			    	mDlls2.add(programImageGroup);
				   
				}
			    
			   
			    
			
			}
			
			
			
			//翻书
			if(jsonImgsFlip==null||jsonImgsFlip.equals("")){
			}else{
				
				JSONArray json = JSONArray.fromObject(jsonImgsFlip);
				
				List<ProgramImageGroup> pcmms= (List<ProgramImageGroup>)JSONArray.toCollection(json, ProgramImageGroup.class);			  
			    
				for (ProgramImageGroup programImageGroup : pcmms) {
			    	
			    	programImageGroup.setType(ResourceType.TYPE_FLIP);
			    	
			    	mDlls.add(programImageGroup);
			    	
			    	mDlls2.add(programImageGroup);
				   
				}
			    
			   
			    
			
			}
			
			
			
			
			//图片
			
			if(jsonImgs==null||jsonImgs.equals("")){
			}else{
				String fnames = "";
				JSONArray json = JSONArray.fromObject(jsonImgs);
				List<ProgramComplexMediaManager> pcmms= (List<ProgramComplexMediaManager>)JSONArray.toCollection(json, ProgramComplexMediaManager.class);			  
			    for (ProgramComplexMediaManager programComplexMediaManager : pcmms) {
			    	
			    	programComplexMediaManager.setmVol(0);
			    	
			    	if(programComplexMediaManager.getmId().substring(0, 5).equals("telle")){
			    		
			    		programComplexMediaManager.setType(ResourceType.TYPE_TELLER);
			    		
			    	}else{
			    		programComplexMediaManager.setType(ResourceType.TYPE_IMAGE);
			    	}
			    	
			    	
			    	if(VVersion.itemDllOnOff==0){
			    		complexMediaList.add(programComplexMediaManager);	
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(programComplexMediaManager);
			    	}
			    	mDlls2.add(programComplexMediaManager);
				
					if(VVersion.saveItemMaterial == 1){
						List mMediaList=programComplexMediaManager.getmMediaList();
				    	for (int i = 0; i < mMediaList.size(); i++) {
				    		md=(MorphDynaBean)mMediaList.get(i);
				    		fnames += md.get("path")+",";   
				    	}
					}
					
					
				}
			    
			    if(VVersion.saveItemMaterial == 1){
			    	if(fnames.length()>1){
			    		ItemMaterial im = new ItemMaterial();
				    	im.setItemid(item.getId());
			    		im.setFilenames(fnames.substring(0,fnames.length()-1));
				    	Integer imItemid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_itemmaterial_itmeid",item.getId());
				    	if(imItemid != null ){
				    		SqlConnect.getSqlMapInstance().update("update_itemmaterial",im);
				    	}else{
				    		SqlConnect.getSqlMapInstance().insert("add_itemmaterial",im);
				    	}
				    }
			    }
			    
			
			}
			
			
			
			
			//流媒体
			if(streamurl==null||streamurl.equals("")){
			}else{
				String streams[]=streamurl.split("\\*");
				if(streams.length==7){
					cmm=new ProgramComplexMediaManager();
					cmm.setmId(streams[0]);
					cmm.setmLeft(Integer.parseInt(streams[1]));
					cmm.setmTop(Integer.parseInt(streams[2]));
					cmm.setmWidth(Integer.parseInt(streams[3]));
					cmm.setmHeight(Integer.parseInt(streams[4]));
					
					mediaList=new ArrayList<ProgramMedia>();
					
					media=new ProgramMedia();
					media.setPath("");
					media.setTimeoutMillis(5);
					media.setInAnim(6);
					media.setType(3);
					media.setSurl(streams[6]);
					mediaList.add(media);
					cmm.setmMediaList(mediaList);
					cmm.setmVol(Float.parseFloat(streams[5]));
					
					cmm.setType(ResourceType.TYPE_VIDEO);
					
					if(VVersion.itemDllOnOff==0){
			    		complexMediaList.add(cmm);	
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(cmm);
			    	}
					mDlls2.add(cmm);
				
				}	
			}
			//AV数据源
			if(av==null||av.equals("")){
			}else{
				String avs[]=av.split("\\*");
				if(avs.length==6){
					cmm=new ProgramComplexMediaManager();
					cmm.setmId(avs[0]);
					cmm.setmLeft(Integer.parseInt(avs[1]));
					cmm.setmTop(Integer.parseInt(avs[2]));
					cmm.setmWidth(Integer.parseInt(avs[3]));
					cmm.setmHeight(Integer.parseInt(avs[4]));
					
					mediaList=new ArrayList<ProgramMedia>();
					
					media=new ProgramMedia();
					media.setPath("");
					media.setTimeoutMillis(5);
					media.setInAnim(6);
					media.setType(4);
					mediaList.add(media);
					cmm.setmMediaList(mediaList);
					cmm.setmVol(Float.parseFloat(avs[5]));
					cmm.setType(ResourceType.TYPE_VIDEO);
					if(VVersion.itemDllOnOff==0){
			    		complexMediaList.add(cmm);	
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(cmm);
			    	}
					mDlls2.add(cmm);
				}	
			}
			//实时显示
			if(ssshow==null||ssshow.equals("")){
			}else{
				String ssshows[]=ssshow.split("\\*");
				if(ssshows.length==6){
					cmm=new ProgramComplexMediaManager();
					cmm.setmId(ssshows[0]);
					cmm.setmLeft(Integer.parseInt(ssshows[1]));
					cmm.setmTop(Integer.parseInt(ssshows[2]));
					cmm.setmWidth(Integer.parseInt(ssshows[3]));
					cmm.setmHeight(Integer.parseInt(ssshows[4]));
					mediaList=new ArrayList<ProgramMedia>();
					media=new ProgramMedia();
					media.setPath("");
					media.setTimeoutMillis(5);
					media.setInAnim(6);
					media.setType(5);
					mediaList.add(media);
					cmm.setmMediaList(mediaList);
					cmm.setmVol(Float.parseFloat(ssshows[5]));
					cmm.setType(ResourceType.TYPE_VIDEO);
					if(VVersion.itemDllOnOff==0){
			    		complexMediaList.add(cmm);	
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(cmm);
			    	}
					mDlls2.add(cmm);
				}	
			}
			
			//rss
			if(rsskey==null||rsskey.equals("")){}else{
				ProgramRss pr;
				//元素id_^x_^y_^w_h_^请求数据url_^字体颜色_^字体大小_^滚动速度_^刷新时间_^滚动类型
				String[] rs = rsskey.split("\\_\\^");
				List<ProgramRss> prList=new ArrayList<ProgramRss>();
				if(rs.length==11){
					pr=new ProgramRss();
					pr.setmId(rs[0]);
					pr.setmLeft(Integer.parseInt(rs[1]));
					pr.setmTop(Integer.parseInt(rs[2]));
					pr.setmWidth(Integer.parseInt(rs[3]));
					pr.setmHeight(Integer.parseInt(rs[4]));
					pr.setRurl("http://" + Constant.IP+ ":"+VCommon.port3+"/vs/getRssDataJson.vs?url="+rs[5]);
					pr.setYs(rs[6]);
					pr.setDx(rs[7]);
					pr.setSpeed(rs[8]);
					pr.setRefreshTime(Integer.parseInt(rs[9]));
					pr.setGdfs(Integer.parseInt(rs[10]));
					pr.setType(ResourceType.TYPE_RSS);
					prList.add(pr);
					pg.setmRssList(prList);
					
					
					mDlls2.add(pr);
				}
				
			}
			//截屏
			if(jptxt==null||jptxt.equals("")){}else{
				
				ProgramScreen ps;
				//div.id+"_"+tleft+"_"+ttop+"_"+twidth+"_"+theight+"_"+div.title+"_"+src2
				//元素id_x_y_w_h_刷新时间_请求地址
				String jps[]=jptxt.split("\\_");
				List<ProgramScreen> psList=new ArrayList<ProgramScreen>();
				if(jps.length==7){
					ps=new ProgramScreen();
					ps.setmId(jps[0]);
					ps.setmLeft(Integer.parseInt(jps[1]));
					ps.setmTop(Integer.parseInt(jps[2]));
					ps.setmWidth(Integer.parseInt(jps[3]));
					ps.setmHeight(Integer.parseInt(jps[4]));
					ps.setRefreshTime(Integer.parseInt(jps[5]));
					ps.setSurl(jps[6]);
					psList.add(ps);
					pg.setmScreenList(psList);
					
				}
			}
			
			//网络摄像头
			if(netcamera==null||netcamera.equals("")){}else{
				ProgramNetCamera pnc;
				//元素id*X*Y*宽*高*设备ID*用户名*密码*厂商
				String ncs[]=netcamera.split("\\*");
				List<ProgramNetCamera> pncList=new ArrayList<ProgramNetCamera>();
				if(ncs.length>=10){
					pnc=new ProgramNetCamera();
					pnc.setmId(ncs[0]);
					pnc.setmLeft(Integer.parseInt(ncs[1]));
					pnc.setmTop(Integer.parseInt(ncs[2]));
					pnc.setmWidth(Integer.parseInt(ncs[3]));
					pnc.setmHeight(Integer.parseInt(ncs[4]));
					pnc.setCdid(ncs[5]);
					pnc.setCusername(ncs[6]);
					pnc.setCpwd(ncs[7]);
					pnc.setCfactory(Integer.parseInt(ncs[8]));
					pnc.setShowZindex(Integer.parseInt(ncs[9]));
					pnc.setElementHide(ncs[10]);
					pnc.setRelationCall(ncs[11]);
					pnc.setType(ResourceType.TYPE_NET_CAMERA);
					
					if(VVersion.itemDllOnOff==0){
						pncList.add(pnc);
						pg.setmNetCameraList(pncList);
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(pnc);
			    	}
					mDlls2.add(pnc);
					
					
				}
				
			}
			
			//排队叫号集中(多条)
			List<ProgramQueue> pqList=new ArrayList<ProgramQueue>();
			if(queue_many==null||queue_many.equals("")){}else{
				//元素id*X*Y*宽*高*样式(1,2,3)*显示行数*字体大小*字体颜色*语音播放(0关 1开)*背景颜色(0表示透明)
				ProgramQueue pqm;
				String pqms[]=queue_many.split("\\*");
				if(pqms.length==11){
					pqm=new ProgramQueue();
					pqm.setmId(pqms[0]);
					pqm.setmLeft(Integer.parseInt(pqms[1]));
					pqm.setmTop(Integer.parseInt(pqms[2]));
					pqm.setmWidth(Integer.parseInt(pqms[3]));
					pqm.setmHeight(Integer.parseInt(pqms[4]));
					pqm.setQtype(1);
					pqm.setStype(Integer.parseInt(pqms[5]));
					pqm.setSline(Integer.parseInt(pqms[6]));
					pqm.setSdx(Integer.parseInt(pqms[7]));
					pqm.setSys(pqms[8]);
					pqm.setSvoice(Integer.parseInt(pqms[9]));
					pqm.setSbys(pqms[10]);
					
					pqList.add(pqm);
				}
			}
			//排队 叫号(小屏)单条
			if(queue_single==null||queue_single.equals("")){}else{
				ProgramQueue pqs;
				String pqss[]=queue_single.split("\\*");
				if(pqss.length==11){
					pqs=new ProgramQueue();
					pqs.setmId(pqss[0]);
					pqs.setmLeft(Integer.parseInt(pqss[1]));
					pqs.setmTop(Integer.parseInt(pqss[2]));
					pqs.setmWidth(Integer.parseInt(pqss[3]));
					pqs.setmHeight(Integer.parseInt(pqss[4]));
					pqs.setQtype(2);
					pqs.setStype(Integer.parseInt(pqss[5]));
					pqs.setSline(Integer.parseInt(pqss[6]));
					pqs.setSdx(Integer.parseInt(pqss[7]));
					pqs.setSys(pqss[8]);
					pqs.setSvoice(Integer.parseInt(pqss[9]));
					pqs.setSbys(pqss[10]);
					pqList.add(pqs);
				}
			}
			pg.setmQueueList(pqList);
			
			
			//公交显示
			List<ProgramBus> pbusList=new ArrayList<ProgramBus>();
			//div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle
			//X*Y*宽*高*显示行数*字体大小*字体颜色*背景色 (0透明 )
			if(bus_data==null||bus_data.equals("")){}else{
				ProgramBus pBus;
				String pqss[]=bus_data.split("\\*");
				if(pqss.length==9){
					pBus=new ProgramBus();
					pBus.setmId(pqss[0]);
					pBus.setmLeft(Integer.parseInt(pqss[1]));
					pBus.setmTop(Integer.parseInt(pqss[2]));
					pBus.setmWidth(Integer.parseInt(pqss[3]));
					pBus.setmHeight(Integer.parseInt(pqss[4]));
					pBus.setSline(Integer.parseInt(pqss[5]));
					pBus.setSdx(Integer.parseInt(pqss[6]));
					pBus.setSys(pqss[7]);
					pBus.setSbys(pqss[8]);
					pbusList.add(pBus);
				}
			}
			pg.setmBusList(pbusList);
			
			
			//充电桩/或者插件
			if(jsonDlls==null||jsonDlls.equals("")||jsonDlls.equals("[]")){}else{
                JSONArray json = JSONArray.fromObject(jsonDlls);
                
                List<ProgramPublic> mCDZDlls=new ArrayList<ProgramPublic>();
                
                mCDZDlls= (List<ProgramPublic>)JSONArray.toCollection(json, ProgramDll.class);
                
                for (int i = 0; i < mCDZDlls.size(); i++) {
                	mCDZDlls.get(i).setType(mCDZDlls.get(i).getType());
                	mDlls.add(mCDZDlls.get(i));
                	mDlls2.add(mCDZDlls.get(i));
				}
                
                
			}
			
			
			//控件节目
			List<ProgramPublic> mDllsItem=new ArrayList<ProgramPublic>();
			if (jsonDllItem == null || jsonDllItem.equals("")) {
			} else {
				JSONArray json = JSONArray.fromObject(jsonDllItem);
				mDllsItem = (List<ProgramPublic>) JSONArray.toCollection(json,
						ProgramDllItem.class);
			}
			ProgramPublic ppc;
			for (int i = 0; i < mDllsItem.size(); i++) {
				ppc=mDllsItem.get(i);
				ppc.setType(ResourceType.TYPE_USER_PROGRAM_MANAGER);
				mDlls.add(ppc);
				mDlls2.add(ppc);
			}
			
			
			
			
			// 数据接口
			List<ProgramDataSource> mDsource = new ArrayList<ProgramDataSource>();

			if (jsonSource == null || jsonSource.equals("")) {
			} else {
				
				JSONArray json = JSONArray.fromObject(jsonSource);
				
				mDsource = (List<ProgramDataSource>) JSONArray.toCollection(json,
						ProgramDataSource.class);
				
				for (int i = 0; i < mDsource.size(); i++) {
					mDsource.get(i).setType(ResourceType.TYPE_DATA_SOURCE);
                	mDlls.add(mDsource.get(i));
                	mDlls2.add(mDsource.get(i));
				}
				
			}
			//pg.setmDsource(mDsource);
			
			//文本
			
			//*元素id~x~y~w~h~类型(2静态文本0向上滚动1向左滚动3向下滚动)~背景颜色~内容~字体类型~字体颜色~滚动速度~字体大小~行高~加粗~下划线~斜线~中线~(居左,局中,局右)
			if(text==null||text.equals("")){}else{
				String texts[]=text.split("\\*");
				List<ProgramTxt> ptList=new ArrayList<ProgramTxt>();
				ProgramTxt pt;
				ProgramTxt pt2;
				for (int i = 0; i < texts.length; i++) {
					String textss[]=texts[i].split("\\~");
					if(textss.length>=20){
						pt=new ProgramTxt();
						pt.setmId(textss[0]);
						pt.setmLeft(Integer.parseInt(textss[1]));
						pt.setmTop(Integer.parseInt(textss[2]));
						pt.setmWidth(Integer.parseInt(textss[3]));
						pt.setmHeight(Integer.parseInt(textss[4]));
						
						pt2=new ProgramTxt();
						pt2.setmId(textss[0]);
						pt2.setmLeft(Integer.parseInt(textss[1]));
						pt2.setmTop(Integer.parseInt(textss[2]));
						pt2.setmWidth(Integer.parseInt(textss[3]));
						pt2.setmHeight(Integer.parseInt(textss[4]));
						
						if(VVersion.itemDllOnOff==1){
							pt.setmDirection(Integer.parseInt(textss[5]));
							pt.setType(ResourceType.TYPE_TEXT);
						}else{
							pt.setType(Integer.parseInt(textss[5]));
						}
						//pt.setType(Integer.parseInt(textss[5]));
						
						
						
						pt.setBcolor(textss[6]);
						String text = textss[7].replaceAll("<STRONG>", "").replaceAll("</STRONG>", "")
						.replaceAll("<U>", "").replaceAll("</U>", "")
						.replaceAll("<STRIKE>", "").replaceAll("</STRIKE>", "")
						.replaceAll("<EM>", "").replaceAll("</EM>", "")
						.replaceAll("<P>", "").replaceAll("</P>", "<BR>")
						.replaceAll("<strong>", "").replaceAll("</strong>", "")
						.replaceAll("<u>", "").replaceAll("</u>", "")
						.replaceAll("<strike>", "").replaceAll("</strike>", "")
						.replaceAll("<em>", "").replaceAll("</em>", "")
						.replaceAll("&nbsp;", "\t\t")
						.replaceAll("<P aligncenter>", "")
						.replaceAll("<P alignleft>", "")
						.replaceAll("<P align=center>", "")
						.replaceAll("<P align=right>", "")
						.replaceAll("<P aligncenter>", "")
						.replaceAll("<P align=left>", "")
						.replaceAll("<P alignright>", "")
						//.replaceAll("\r", "<BR>")
						//.replaceAll("\n", "")
						.replaceAll("<p align=\"left\">", "")
						.replaceAll("<p align=\"center\">", "")
						.replaceAll("<p align=\"right\">", "")
						.replaceAll("</p>", "")
						.replaceAll("<\\/b>", "")
						.replaceAll("<b>", "")
						.replaceAll("<\\/B>", "")
						.replaceAll("<B>", "");
				        text=Constant.replaceAllFont(text);
				        text=HtmlUtil.delHTMLTag(text);
				        pt.setTxtcontent(text);
						pt.setZiti(textss[8]);
						pt.setFcolor(textss[9]);
						pt.setSpeed(Integer.parseInt(textss[10]));
						pt.setFs(Integer.parseInt(textss[11]));
						pt.setLh(Integer.parseInt(textss[12]));
						pt.setFjc(Integer.parseInt(textss[13]));
						pt.setFdx(Integer.parseInt(textss[14]));
						pt.setFxx(Integer.parseInt(textss[15]));
						pt.setFzx(Integer.parseInt(textss[16]));
						pt.setFtype(Integer.parseInt(textss[17]));
						pt.setTextDataSource(Integer.parseInt(textss[18]));
						pt.setShowZindex(Integer.parseInt(textss[19]));
						
						pt.setElementHide(textss[20]);
						pt.setRelationCall(textss[21]);
						
						
						
						if(textss.length>=23){
							pt.setRelationKey(textss[22]);
							pt.setHighFontColor(textss[23]);
							if(textss[24].equals("undefined")){
								pt.setFontColorCb(0);
							}else{
								pt.setFontColorCb(Integer.parseInt(textss[24]));
							}
							pt.setHighBgColor(textss[25]);
							
							if(textss[26].equals("undefined")){
								pt.setBgColorCb(0);
							}else{
								pt.setBgColorCb(Integer.parseInt(textss[26]));
							}
							
							
						}else{
							pt.setRelationKey("");
						}
						
						
						if(VVersion.itemDllOnOff==0){
							ptList.add(pt);
				    	}else if(VVersion.itemDllOnOff==1){
				    		mDlls.add(pt);
				    	}
						
						
						
						
						
						pt2.setBcolor(textss[6]);
						String text2 = textss[7].replaceAll("<STRONG>", "").replaceAll("</STRONG>", "")
						.replaceAll("<U>", "").replaceAll("</U>", "")
						.replaceAll("<STRIKE>", "").replaceAll("</STRIKE>", "")
						.replaceAll("<EM>", "").replaceAll("</EM>", "")
						.replaceAll("<P>", "").replaceAll("</P>", "<BR>")
						.replaceAll("<strong>", "").replaceAll("</strong>", "")
						.replaceAll("<u>", "").replaceAll("</u>", "")
						.replaceAll("<strike>", "").replaceAll("</strike>", "")
						.replaceAll("<em>", "").replaceAll("</em>", "")
						.replaceAll("&nbsp;", "\t\t")
						.replaceAll("<P aligncenter>", "")
						.replaceAll("<P alignleft>", "")
						.replaceAll("<P align=center>", "")
						.replaceAll("<P align=right>", "")
						.replaceAll("<P aligncenter>", "")
						.replaceAll("<P align=left>", "")
						.replaceAll("<P alignright>", "")
						//.replaceAll("\r", "<BR>")
						//.replaceAll("\n", "")
						.replaceAll("<p align=\"left\">", "")
						.replaceAll("<p align=\"center\">", "")
						.replaceAll("<p align=\"right\">", "")
						.replaceAll("</p>", "")
						.replaceAll("<\\/b>", "")
						.replaceAll("<b>", "")
						.replaceAll("<\\/B>", "")
						.replaceAll("<B>", "");
				        text=Constant.replaceAllFont(text);
				        text=HtmlUtil.delHTMLTag(text);
				        pt2.setTxtcontent(text);
						pt2.setZiti(textss[8]);
						pt2.setFcolor(textss[9]);
						pt2.setSpeed(Integer.parseInt(textss[10]));
						pt2.setFs(Integer.parseInt(textss[11]));
						pt2.setLh(Integer.parseInt(textss[12]));
						pt2.setFjc(Integer.parseInt(textss[13]));
						pt2.setFdx(Integer.parseInt(textss[14]));
						pt2.setFxx(Integer.parseInt(textss[15]));
						pt2.setFzx(Integer.parseInt(textss[16]));
						pt2.setFtype(Integer.parseInt(textss[17]));
						pt2.setTextDataSource(Integer.parseInt(textss[18]));
						
						pt2.setShowZindex(Integer.parseInt(textss[19]));
						
						pt2.setElementHide(textss[20]);
						pt2.setRelationCall(textss[21]);
						
						
						
						if(textss.length>=23){
							pt2.setRelationKey(textss[22]);
							pt2.setHighFontColor(textss[23]);
							if(textss[24].equals("undefined")){
								pt2.setFontColorCb(0);
							}else{
								pt2.setFontColorCb(Integer.parseInt(textss[24]));
							}
							pt2.setHighBgColor(textss[25]);
							
							if(textss[26].equals("undefined")){
								pt2.setBgColorCb(0);
							}else{
								pt2.setBgColorCb(Integer.parseInt(textss[26]));
							}
						}else{
							pt2.setRelationKey("");
						}
						
						pt2.setmDirection(Integer.parseInt(textss[5]));
						pt2.setType(ResourceType.TYPE_TEXT);
						
						mDlls2.add(pt2);
						
						
					}
				}
				if(VVersion.itemDllOnOff==0){
					pg.setmTxtList(ptList);
						
				}
				
			}
			
		
			
			//天气
			if(citykey==null||citykey.equals("")){}else{
				//元素id*x*y*w*h*刷新时间*字体大小*字体颜色*城市*城市--切换时间@城市--切换时间#2
				String citys[]=citykey.split("\\#");
				ProgramComplexWeather pcw;
				List<ProgramComplexWeather> pcwList=new ArrayList<ProgramComplexWeather>();
				for (int i = 0; i < citys.length; i++) {
					String cityss[]=citys[i].split("\\*");
					if(cityss.length>=10){
						pcw=new ProgramComplexWeather();
						pcw.setmId(cityss[0]);
						pcw.setmLeft(Integer.parseInt(cityss[1]));
						pcw.setmTop(Integer.parseInt(cityss[2]));
						pcw.setmWidth(Integer.parseInt(cityss[3]));
						pcw.setmHeight(Integer.parseInt(cityss[4]));
						pcw.setFresh(Integer.parseInt(cityss[5]));
						pcw.setDx(Integer.parseInt(cityss[6]));
						pcw.setWfcolor(cityss[7]);
						pcw.setWtype(Integer.parseInt(cityss[9]));
						String city2s[]=cityss[8].split("\\@");
						ProgramWeather pw;
						List<ProgramWeather> pwList=new ArrayList<ProgramWeather>();
						for (int j = 0; j < city2s.length; j++) {
							String city2ss[]=city2s[j].split("\\--");
							if(city2ss.length==2){
								pw=new  ProgramWeather();
								if(city2ss[0].equals(Constant.WEATHERAUTOGE)){
									city2ss[0]="";
								}
								pw.setWeatherCity(city2ss[0]);
								pw.setWeatherQtime(Integer.parseInt(city2ss[1]));
								pwList.add(pw);
							}
						}
						pcw.setType(ResourceType.TYPE_WEATHER);
						pcw.setmWeatherList(pwList);
						
						pcw.setElementHide(cityss[11]);
						pcw.setRelationCall(cityss[12]);
						
						if(cityss.length==11){
						pcw.setShowZindex(Integer.parseInt(cityss[10]));
						}
						if(VVersion.itemDllOnOff==0){
							pcwList.add(pcw);
				    	}else if(VVersion.itemDllOnOff==1){
				    		mDlls.add(pcw);
				    	}
						mDlls2.add(pcw);
						
						
					}
					
				}
				if(VVersion.itemDllOnOff==0){
					pg.setmComplexWeatherList(pcwList);	
						
				}
				
			}
			
			
			//网页
			if(html==null||html.equals("")){}else{
				//元素id*x*y*w*h*刷新时间*滚动*网页地址--切换时间@网页地址--切换时间
				
                JSONArray json = JSONArray.fromObject(html);
				
                List<String> mHtmls = (List<String>) JSONArray.toCollection(json,
						String.class);
				
				//String htmls[]=html.split("\\#");
				ProgramComplexHtml pch;
				List<ProgramComplexHtml> pchList=new ArrayList<ProgramComplexHtml>();
				for (int i = 0; i < mHtmls.size(); i++) {
					String htmlss[]=mHtmls.get(i).split("\\*");
					if(htmlss.length>=9){
						pch=new ProgramComplexHtml();
						pch.setmId(htmlss[0]);
						pch.setmLeft(Integer.parseInt(htmlss[1]));
						pch.setmTop(Integer.parseInt(htmlss[2]));
						pch.setmWidth(Integer.parseInt(htmlss[3]));
						pch.setmHeight(Integer.parseInt(htmlss[4]));
						pch.setTime(Integer.parseInt(htmlss[5]));
						pch.setGun(Integer.parseInt(htmlss[6]));
						String html2s[]=htmlss[7].split("\\@");
						ProgramHtml ph;
						List<ProgramHtml> phList=new ArrayList<ProgramHtml>();
						for (int j = 0; j < html2s.length; j++) {
							String html2ss[]=html2s[j].split("\\--");
							if(html2ss.length>=4){
								ph=new ProgramHtml();
								ph.setHtmlUrl(html2ss[0]);
								ph.setHtmlQtime(Integer.parseInt(html2ss[1]));
								ph.setmShowNavigation(Integer.parseInt(html2ss[2]));
								ph.setmShowPCWeb(Integer.parseInt(html2ss[3]));
								ph.setClientMarkSuffix(Integer.parseInt(html2ss[4]));//追加终端标识码
								phList.add(ph);
							}
						}
						pch.setmHtmlList(phList);
						pch.setType(ResourceType.TYPE_WEB);
						pch.setShowZindex(Integer.parseInt(htmlss[8]));
						pch.setElementHide(htmlss[9]);
						pch.setRelationCall(htmlss[10]);
						if(VVersion.itemDllOnOff==0){
							pchList.add(pch);
				    	}else if(VVersion.itemDllOnOff==1){
				    		mDlls.add(pch);
				    	}
						mDlls2.add(pch);
						
						
					}
					
				}
				if(VVersion.itemDllOnOff==0){
					pg.setmComplexHtmlList(pchList);	
				}
				
			}
			
			//时间
			if(timeTxt==null||timeTxt.equals("")){}else{
				
				
				
				JSONArray json = JSONArray.fromObject(timeTxt);
				List<ProgramTime> ptList  = (List<ProgramTime>) JSONArray.toCollection(json,
						ProgramTime.class);
			    
				for (ProgramTime programTime : ptList) {
				
					programTime.setType(ResourceType.TYPE_TIME);
					if(VVersion.itemDllOnOff==0){
						
			    	}else if(VVersion.itemDllOnOff==1){
			    		mDlls.add(programTime);
			    	}
					mDlls2.add(programTime);
				}
				
				if(VVersion.itemDllOnOff==0){
					pg.setmTimeList(ptList);	
				}
				
			}
			
			
			//排序mDlls
		     Collections.sort(mDlls,new Comparator<ProgramPublic>(){  
		    	  
		            /*  
		             * int compare(Student o1, Student o2) 返回一个基本类型的整型，  
		             * 返回负数表示：o1 小于o2，  
		             * 返回0 表示：o1和o2相等，  
		             * 返回正数表示：o1大于o2。 
		             *  
		             */
		    	 
		            public int compare(ProgramPublic o1, ProgramPublic o2) {  
		              
		                //升序排列  
		                if(o1.getShowZindex() > o2.getShowZindex()){  
		                    return 1;  
		                }  
		                if(o1.getShowZindex() == o2.getShowZindex()){  
		                    return 0;  
		                }  
		                return -1;  
		            }  
		     });
		     
		   //排序mDlls
		     Collections.sort(mDlls2,new Comparator<ProgramPublic>(){  
		    	  
		            /*  
		             * int compare(Student o1, Student o2) 返回一个基本类型的整型，  
		             * 返回负数表示：o1 小于o2，  
		             * 返回0 表示：o1和o2相等，  
		             * 返回正数表示：o1大于o2。  
		             */  
		            public int compare(ProgramPublic o1, ProgramPublic o2) {  
		              
		                //升序排列  
		                if(o1.getShowZindex() > o2.getShowZindex()){  
		                    return 1;  
		                }  
		                if(o1.getShowZindex() == o2.getShowZindex()){  
		                    return 0;  
		                }
		                
		                return -1;  
		                
		            }  
		     });
			
			
		pg.setmDlls(mDlls);
			
		pg2.setmDlls(mDlls2);
			
		pg.setmComplexMediaManagerList(complexMediaList);
			
			
		//打印json
		JSONArray jsonArray = JSONArray.fromObject(pg);
			
		JSONArray jsonArray2 = JSONArray.fromObject(pg2);
		
		System.out.println(jsonArray.toString());
			
			
	    //*********************************协议生成结束*************************************************

	    //创建节目协议文件	
	    f = new File(dir + File.separator + "program.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(jsonArray.toString().getBytes("UTF-8"));
		oldFileWriter.close();
		
		
		 f = new File(dir + File.separator + "program2.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(jsonArray2.toString().getBytes("UTF-8"));
			oldFileWriter.close();
			
	
		//查找场景内容存在不存在
	    SceneContent sContent=(SceneContent)sm.queryForObject("sel_scene_content_filename", mfile);	
		
	    if(sContent==null){
	    	//保存到场景内容表
			sContent=new SceneContent();	
			sContent.setFilename(mfile);
			sContent.setContent(jsonArray2.toString());
			sContent.setType(1);
			sm.insert("insert_scene_content", sContent);
	    }else{
	    	sContent.setContent(jsonArray2.toString());
			
			sm.update("update_scene_content", sContent);
	    }
		
		
		
		String kejm;
		kejm ="1@" + mfile + "@" + mcontent + "@" + stime + "@" + x86tev
				+ "@" + fcontent + "@" + sf;
		f = new File(dir + File.separator + "key.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(kejm.getBytes("UTF-8"));
		oldFileWriter.close();
		
		
		//读取programSub.txt
		String programSubTxt="";
		
		if(itemViceType==1){
			 programSubTxt=FileHandle.readTxtFile(dir + File.separator + "programSub.txt");	
		}
		
		//删除无用文件	
		String tostr = jsonArray.toString()+"  "+programSubTxt
		+ " program.txt "
		+ " program2.txt programSub.txt"
		+ " jqfont.js "
		+ " tmp.txt "
		+ " jqfont2.js "
		+ " main_vs.swf "
	    + " see.html "
		+   fcontent
		+ " key.txt"
		+ " "
		+ " "
		+ " "
		+ " time.html time.txt"
		+ " gncj.txt  hl.html"
		+ " wtime.txt wtime.html table.txt table.html  " 
		+ " play.txt " 
		+ " cjtime.txt 2code.txt"+appstrs;
	
		String ourdir = Constant.FILES + File.separator + mfile+ File.separator;
		File ff = new File(ourdir + "jqfont.js");
		if (!ff.exists()) {
			try {
				FileInputStream fis = new FileInputStream(Constant.EXE
						+ File.separator + "jqfont.js");
				FileOutputStream fos = new FileOutputStream(ff);
				byte[] buff = new byte[1024];
				int readed = -1;
				while ((readed = fis.read(buff)) > 0)
					fos.write(buff, 0, readed);
				fis.close();
				fos.close();
			} catch (Exception e) {
			}
		}
	
		ff = new File(ourdir + "jqfont2.js");
		if (!ff.exists()) {
			try {
				FileInputStream fis = new FileInputStream(Constant.EXE
						+ File.separator + "jqfont2.js");
				FileOutputStream fos = new FileOutputStream(ff);
				byte[] buff = new byte[1024];
				int readed = -1;
				while ((readed = fis.read(buff)) > 0)
					fos.write(buff, 0, readed);
				fis.close();
				fos.close();
			} catch (Exception e) {
			}
		}
	
		String cccontet = new Date().toString() + new Date().getTime()+ new Date().getTime() + new Date().toString();
		ff = new File(dir + File.separator + "tmp.txt");
		if (ff.exists()) {
			RandomAccessFile randomFile = null;
			randomFile = new RandomAccessFile(ff, "rw");
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.writeBytes(cccontet);
			randomFile.close();
		} else {
			oldFileWriter = new FileOutputStream(ff);
			oldFileWriter.write(cccontet.getBytes("UTF-8"));
			oldFileWriter.close();
		}	
		File fsss = new File(dir);
		File[] fsd = fsss.listFiles();
		for (int i = 0; i < fsd.length; i++) {
			fsss = fsd[i];
			if (tostr.indexOf(fsss.getName()) == -1) {
				fsss.delete();
			}
		}
	    
		//压缩zip
		DoZip zip = new DoZip();
		
		zip.zip(dir, dir + ".zip");
	
		//System.out.println("压缩节目包:"+dir + ".zip");
		
	    // 获取场景(查找场景是否存在)
		if (obj == null) {
				scene = (Scene) session.get("scene");
				scene.setFilename(mfile);
				scene.setName("1");
				scene.setMcontent(mcontent);
				scene.setUrid(urid);
				scene.setStime(stime);
				scene.setSdate(date);
				scene.setVname(x86tev);
				scene.setFcontent(fcontent);
				scene.setSf(sf);
				sm.insert("insert_one_scene", scene);
				// 获取刚插入场景的id
				int sid = (Integer) sm.queryForObject("sel_zjscene", scene);
				
				//更新节目
				item.setSceneid(sid);
				sm.update("update_item_sceneid", item);
			} else {
				scene = (Scene) obj;
				scene.setFilename(mfile);
				scene.setName("1");
				scene.setMcontent(mcontent);
				scene.setUrid(urid);
				scene.setStime(stime);
				scene.setSdate(date);
				scene.setVname(x86tev);
				scene.setFcontent(fcontent);
				scene.setSf(sf);
				sm.update("update_scene", scene);				
			}
		
		   //遍历节目下所有场景,视频,音频文件字节大小
	       Scene fnVn= (Scene)sm.queryForObject("sel_fnvn_iid", item.getId());
		   String filepathzip="";
		   long len=0L;
		   String[] vms;
		   long clen=0L;
		   int cstime=0;
		   if(fnVn!=null){
				//获取场景时长
				cstime+=fnVn.getStime();
				//获取场景zip大小
				filepathzip = Constant.FILES + File.separator+ fnVn.getFilename() + ".zip";
					
				len = FileHandle.getFileByte(filepathzip);
					
				//获取视频,音频大小
				if(!"".equals(fnVn.getVname())){
						vms = fnVn.getVname().split("\\|");
						for (int j = 0; j < vms.length; j++) {
							Sucai sc = (Sucai)sm.queryForObject("sel_sc_filename", vms[j]);
							if(sc!=null){
								len += sc.getLen();
							}
                            //len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
						}
				}
			  }
			clen+=len;	
			
			Scene fnVnSub= (Scene)sm.queryForObject("sel_fnvn_iid_sub", mfile);
			
			if(fnVnSub!=null){
			    	//获取视频,音频大小
					if(!"".equals(fnVnSub.getVname())){
							vms = fnVnSub.getVname().split("\\|");
							for (int j = 0; j < vms.length; j++) {
								Sucai sc = (Sucai)sm.queryForObject("sel_sc_filename", vms[j]);
								if(sc!=null){
									clen += sc.getLen();
								}
								//len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
							}
					}
			}
			item.setLen(clen);
		
		// 更新节目
		if(itemname!=null||!"".equals(itemname)){
			itemname=itemname.replaceAll("\\,","");
			item.setName(itemname);
		}
		item.setStime(stime);
		sm.update("upd_item2", item);
		
		//修改节目分辨率
		if(upFblId!=0){
			item.setFblid(upFblId);
			SqlConnect.getSqlMapInstance().update("update_item_fbl", item);
			
		}

		// 统计
		Constant.countSucai(item.getId());
        session.remove("scene");
		session.remove("item");
		
		
		//记录最后一次节目操作人
		ItemEditHistory  itemEditHis=new ItemEditHistory();
		itemEditHis.setEditUid(urid);
		itemEditHis.setItemType(1);
		itemEditHis.setItemId(item.getId());
		itemEditHis.setEditDate(DateUtil.getTime());
		
		SqlConnect.getSqlMapInstance().insert("ad_item_history", itemEditHis);
		
		//插入itemKey
		ItemKey iKey=(ItemKey)SqlConnect.getSqlMapInstance().queryForObject("sel_filename_key", mfile);
		
		if(itemKey==null||itemKey.equals("")){
			
		}else{
			
			if(iKey==null){
				
				iKey =new ItemKey();
				iKey.setFilename(mfile);
				iKey.setKey(itemKey);
				iKey.setType(1);
				SqlConnect.getSqlMapInstance().insert("ad_item_key", iKey);
				
			}else{
				
				iKey.setKey(itemKey);
				
				SqlConnect.getSqlMapInstance().update("up_filename_key", iKey);
				
			}
			
		}

		if(upFblSave==1){
			
			itemid=item.getId();
			
			return "editFblSaveItem";
		}
		
		return SUCCESS;
		
		
	}

	

	public int getItemid() {
		return itemid;
	}



	public void setItemid(int itemid) {
		this.itemid = itemid;
	}



	public String getJsonImgs() {
		return jsonImgs;
	}

	public void setJsonImgs(String jsonImgs) {
		this.jsonImgs = jsonImgs;
	}

	public String getQueue_many() {
		return queue_many;
	}

	public void setQueue_many(String queue_many) {
		this.queue_many = queue_many;
	}

	public String getQueue_single() {
		return queue_single;
	}

	public void setQueue_single(String queue_single) {
		this.queue_single = queue_single;
	}

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSeecontent() {
		return seecontent;
	}

	public void setSeecontent(String seecontent) {
		this.seecontent = seecontent;
	}

	


	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public int getStime() {
		return stime;
	}

	public void setStime(int stime) {
		this.stime = stime;
	}

	public String getGcontent() {
		return gcontent;
	}

	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}

	public String getCitykey() {
		return citykey;
	}

	public void setCitykey(String citykey) {
		this.citykey = citykey;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	

	public String getRsskey() {
		return rsskey;
	}

	public void setRsskey(String rsskey) {
		this.rsskey = rsskey;
	}

	public String getTimeTxt() {
		return timeTxt;
	}

	public void setTimeTxt(String timeTxt) {
		this.timeTxt = timeTxt;
	}

	public String getTimeHtml() {
		return timeHtml;
	}

	public void setTimeHtml(String timeHtml) {
		this.timeHtml = timeHtml;
	}

	public String getAv() {
		return av;
	}

	public void setAv(String av) {
		this.av = av;
	}

	public String getSsshow() {
		return ssshow;
	}

	public void setSsshow(String ssshow) {
		this.ssshow = ssshow;
	}

	public String getGncj() {
		return gncj;
	}

	public void setGncj(String gncj) {
		this.gncj = gncj;
	}

	public String getHltxt() {
		return hltxt;
	}

	public void setHltxt(String hltxt) {
		this.hltxt = hltxt;
	}

	public String getWtime() {
		return wtime;
	}

	public void setWtime(String wtime) {
		this.wtime = wtime;
	}

	public String getBginfo() {
		return bginfo;
	}

	public void setBginfo(String bginfo) {
		this.bginfo = bginfo;
	}

	public String getMtable() {
		return mtable;
	}

	public void setMtable(String mtable) {
		this.mtable = mtable;
	}



	public String getLcsh() {
		return lcsh;
	}

	public void setLcsh(String lcsh) {
		this.lcsh = lcsh;
	}
	
	public String getFlash() {
		return flash;
	}

	public void setFlash(String flash) {
		this.flash = flash;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}
	
	
	public String getJptxt() {
		return jptxt;
	}

	public void setJptxt(String jptxt) {
		this.jptxt = jptxt;
	}


	
	
	public String getAppstrs() {
		return appstrs;
	}

	public void setAppstrs(String appstrs) {
		this.appstrs = appstrs;
	}
	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
	public int getValidityCheck() {
		return validityCheck;
	}

	public void setValidityCheck(int validityCheck) {
		this.validityCheck = validityCheck;
	}
	
	public String getNetcamera() {
		return netcamera;
	}

	public void setNetcamera(String netcamera) {
		this.netcamera = netcamera;
	}
	
	
	
	public String getStreamurl() {
		return streamurl;
	}

	public String getBus_data() {
		return bus_data;
	}



	public void setBus_data(String bus_data) {
		this.bus_data = bus_data;
	}


	public void setStreamurl(String streamurl) {
		this.streamurl = streamurl;
	}
	
	public String getJsonVideos() {
		return jsonVideos;
	}

	public void setJsonVideos(String jsonVideos) {
		this.jsonVideos = jsonVideos;
	}
	
	public String getJsonDlls() {
		return jsonDlls;
	}



	public void setJsonDlls(String jsonDlls) {
		this.jsonDlls = jsonDlls;
	}
	
	public String getJsonSource() {
		return jsonSource;
	}



	public void setJsonSource(String jsonSource) {
		this.jsonSource = jsonSource;
	}
	
	
	public String getJsonDllItem() {
		return jsonDllItem;
	}



	public void setJsonDllItem(String jsonDllItem) {
		this.jsonDllItem = jsonDllItem;
	}

	
	public String getJsonImgsGroup() {
		return jsonImgsGroup;
	}



	public void setJsonImgsGroup(String jsonImgsGroup) {
		this.jsonImgsGroup = jsonImgsGroup;
	}


	public String getJsonImgsFlip() {
		return jsonImgsFlip;
	}

	public void setJsonImgsFlip(String jsonImgsFlip) {
		this.jsonImgsFlip = jsonImgsFlip;
	}

	public int getItemViceType() {
		return itemViceType;
	}

	public void setItemViceType(int itemViceType) {
		this.itemViceType = itemViceType;
	}


	public String getItemKey() {
		return itemKey;
	}


	public void setItemKey(String itemKey) {
		this.itemKey = itemKey;
	}
	
	
	
   public int getUpFblSave() {
		return upFblSave;
	}



	public void setUpFblSave(int upFblSave) {
		this.upFblSave = upFblSave;
	}



	public int getUpFblId() {
		return upFblId;
	}



	public void setUpFblId(int upFblId) {
		this.upFblId = upFblId;
	}
	
	

}
