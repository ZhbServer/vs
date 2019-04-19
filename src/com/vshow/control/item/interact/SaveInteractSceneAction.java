package com.vshow.control.item.interact;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemGroupRelation;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemEditHistory;
import com.vshow.control.data.ItemScene;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Scene;
import com.vshow.control.data.SceneContent;
import com.vshow.control.data.SceneInfo;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.Tq;
import com.vshow.control.data.program.Program;
import com.vshow.control.data.program.ProgramComplexHtml;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramComplexWeather;
import com.vshow.control.data.program.ProgramDataSource;
import com.vshow.control.data.program.ProgramDll;
import com.vshow.control.data.program.ProgramHl;
import com.vshow.control.data.program.ProgramHtml;
import com.vshow.control.data.program.ProgramImageGroup;
import com.vshow.control.data.program.ProgramImageGroupMedia;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.data.program.ProgramNetCamera;
import com.vshow.control.data.program.ProgramPublic;
import com.vshow.control.data.program.ProgramQueue;
import com.vshow.control.data.program.ProgramRecyder;
import com.vshow.control.data.program.ProgramRss;
import com.vshow.control.data.program.ProgramScreen;
import com.vshow.control.data.program.ProgramTime;
import com.vshow.control.data.program.ProgramTxt;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.data.program.ResourceType;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.item.touch.TouchTool;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.HtmlUtil;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;
import com.vshow.control.zdy.user.space.getUSTotal;

public class SaveInteractSceneAction extends ActionSupport {

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
	// 场景集合
	private List scenes;
	private String tson;
	private String interacturl;
	private String interactname;
	private String fatherurl;
	private String oneurl;
	

	private String text;
	private String img;

	private String timeHtml;
	private String timeTxt;
	
	private String av;
	private String ssshow;
	private String streamurl;
	
	
	private String gncj;
	private String hltxt;
	private String wtime;
	private String bginfo;
	private String mtable;

	private String x86videox;
	private String x86videoy;
	private String x86videowidth;
	private String x86videoheight;
	private String x86vname;
	private String x86volofs; //多区域音量开关
    private String x86ids;    //多区域音视频 图片id
	


	private String lcsh; // 楼层显示
	private String flash;//flash 信息
	private String html; //网页提取信息
	
	private String appstrs; //app跳转
	

	private String code;   //二维码显示区

	private int twidth;
	private int theight;

	private int savetype=1;   //保存类型  1保存  2新增 3查看
	private String jptxt; //桌面截屏
   

	private String itemname;
    private String code2;       //二维码
    private String netcamera;   //网络摄像
    
    private String jsonImgs;    //图片元素
    
    private String jsonVideos;  //视频,图片,音频混合元素
    
    private String jsonDlls;     //插件集合
    
	private String jsonTouchs;  //touch事件集合
	
	private String jsonRecyclers;  //互动组集合
	
	private String jsonImgsGroup; //图片组

	private String jsonSource;   //数据接口
	
	private String jsonImgsFlip; //翻书
	
	private int itemViceType;   //1为双屏节目
	
	private int upFblSave;    //修改分辨率前 先保存节目  状态为1 修改分辨率
	    
	private int upFblId;      //需要修改的分辨率id
		
	private int itemid;       //节目id

	
	
	public String execute() throws Exception {
		
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		Local local = (Local) session.get("local");
		fatherurl = mfile;
		boolean isNewItem = true; //是否是新增节目
		
		// 先查询节目是否存在
		// 获取节目
		InteractItem item = (InteractItem) session.get("interactitem");
		if (item.getId() == 0) {
			// 插入节目
			
			Integer iid=(Integer)sm.insert("insert_one_interactitem", item);
			// 并且返回刚插入节目的信息
			item = (InteractItem) sm.queryForObject("sel_id_interactitem", iid);
			
			session.put("interactitem", item);
			LogHandle.insertTheLog(LogType.type6, urid, Constant.LOCAL.getA00443()+ ":" + item.getName(), 1,1);
			
			InteractItemGroupRelation iisg = new InteractItemGroupRelation();
			Integer igid=(Integer)session.get("igid");
		    if(igid==null||igid==-2){
		    	igid=0;
		    }
		    iisg.setItemid(item.getId());
		    iisg.setItemgroupid(igid);
			sm.insert("add_interactitem_group_relation", iisg);
			
		} else {
			// 节目已存在查找
			item = (InteractItem) sm.queryForObject("sel_id_interactitem", item.getId());
			
			int ocheck = (Integer) session.get("urcheck");
			if (ocheck == 0 || ocheck == 2) {
				item.setOcheck(0);
			} else if (ocheck == 1 || ocheck == 3) {
				item.setOcheck(1);
			}
			
			if(item.getUserid()!=urid){
				//修改共享节目
				LogHandle.insertTheLog(LogType.type8, urid, local.getA00833()+"["+local.getA00729()+"]["+local.getB00015()+"]"
						+ ":" + item.getName(), 1,1);
				
			}else{
				//修改节目
				
				LogHandle.insertTheLog(LogType.type8, urid, local.getA00833()+"["+local.getA00729()
						+ "]:" + item.getName(), 1,1);
				
			}
		}
		// 判断场景是否存在
		Scene scene = null;
		Object obj = sm.queryForObject("sel_scene_filenames", mfile);
		if (obj != null) {
			scene = (Scene) obj;

			// 更新节目的大小和播放时长(大小zip+视频或音频)
			String filepathzip = Constant.FILES + File.separator
					+ scene.getFilename() + ".zip";	
			
	        isNewItem = false;
			
			//删除旧节目的节目包时，先创建文件夹暂时复制放起来
			//File oldDir = new File(Constant.FILES + File.separator +"oldIDir");
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
			session.put("interactitem", item);
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		mfile = mfile.trim();
		mcontent = mcontent.replaceAll("http://" + Constant.IP
				+":"+VCommon.port3+"/vs/files", "files");
		String dir = Constant.FILES + File.separator + mfile;
		File f = new File(dir + File.separator + "see.html");
		FileOutputStream oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(seecontent.getBytes("UTF-8"));
		oldFileWriter.close();

		
	

		 //******************************协议生成****************************************************
		//解析获取touch全部事件
		List<TouchInteractive> touchList=TouchTool.analyzeTouchsJson(jsonTouchs,mfile);
		
		//创建节目文件
		Program pg=new Program();
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
		pg.setmPtype(2);
		
		pg2.setmProgram(mfile);
		pg2.setmPtype(2);
		//背景
		if (bginfo == null || "".equals(bginfo)) {
			pg.setmBackground("0");
			pg2.setmBackground("0");
		}else{
			pg.setmBackground(bginfo);
			pg2.setmBackground(bginfo);
		}
		
		try {
			  JSONObject jsonMcontent=JSONObject.fromObject(mcontent);
			  pg.setBgColor(jsonMcontent.getString("bgColor"));
			  pg2.setBgColor(jsonMcontent.getString("bgColor"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    
		
		//节目时长
		//pg.setmProgramTimeout(stime);
		pg.setmProgramTimeout(0);
		pg2.setmProgramTimeout(0);
		//节目大小
		pg.setmProgramSize(0);
		pg2.setmProgramSize(0);
		//节目名
		pg.setmProgramName(item.getName());
		pg2.setmProgramName(item.getName());
		List<ProgramComplexMediaManager> complexMediaList=new ArrayList<ProgramComplexMediaManager>();
		
		ProgramComplexMediaManager cmm;
		ProgramMedia media;
		List<ProgramMedia> mediaList;
		
		//插件集合显示
		List<ProgramPublic> mDlls=new ArrayList<ProgramPublic>();
		
		//插件集合显示
		List<ProgramPublic> mDlls2=new ArrayList<ProgramPublic>();
		
		//互动组
		List<ProgramRecyder> mRecyclerList=new ArrayList<ProgramRecyder>();
		if(jsonRecyclers==null||jsonRecyclers.equals("")){
			
			
			
		}else{
			//解析获取touch全部事件
			mRecyclerList=TouchTool.analysisInteractGroupJson(jsonRecyclers,mfile);
			pg.setmRecyclerList(mRecyclerList);
			pg2.setmRecyclerList(mRecyclerList);
		}
		
		
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
		    	
		    	/*过滤touch事件*/
				List<TouchInteractive>  mTouchList=TouchTool.filterTouchs(programComplexMediaManager.getmId(), touchList);
				programComplexMediaManager.setmTouchList(mTouchList);
				if(programComplexMediaManager.getmId().substring(0,5).equals("video"))
				{
					programComplexMediaManager.setType(ResourceType.TYPE_VIDEO);
				}else
				{
					programComplexMediaManager.setType(ResourceType.TYPE_CAROUSEL);
				}
				

				
		    	if(VVersion.itemDllOnOff==0){
		    		complexMediaList.add(programComplexMediaManager);	
		    	}else if(VVersion.itemDllOnOff==1){
		    		mDlls.add(programComplexMediaManager);
		    	}
		    	mDlls2.add(programComplexMediaManager);
			
				
			}
		    
		}
		
		
	
		//图片
		//元素id~x~y~w~h~切换时间~播放列表~跳转场景(默认为0)~特效*元素id~x~y~w~h~切换时间~播放列表~跳转场景~特效
		if(jsonImgs==null||jsonImgs.equals("")){
		}else{
			
			JSONArray json = JSONArray.fromObject(jsonImgs);
			
			List<ProgramComplexMediaManager> pcmms= (List<ProgramComplexMediaManager>)JSONArray.toCollection(json, ProgramComplexMediaManager.class);			  
		    
			for (ProgramComplexMediaManager programComplexMediaManager : pcmms) {
		    	
		    	programComplexMediaManager.setmVol(0);
				
		    	programComplexMediaManager.setType(ResourceType.TYPE_IMAGE);
		    	/*过滤touch事件*/
				List<TouchInteractive>  mTouchList=TouchTool.filterTouchs(programComplexMediaManager.getmId(), touchList);
				
				programComplexMediaManager.setmTouchList(mTouchList);
				
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

		    	
		    	
		    	
		    	/*过滤touch事件*/
				List<TouchInteractive>  mTouchList=TouchTool.filterTouchs(programImageGroup.getmId(), touchList);
				
				
				List mMediaImageGroupMediaList =programImageGroup.getmMediaImageGroupMediaList();
				List<ProgramImageGroupMedia> mMediaImageGroupMediaListNew=new ArrayList<ProgramImageGroupMedia>();
				ProgramImageGroupMedia programImageGroupMedia;
				MorphDynaBean mdg;
				for (int i = 0; i < mMediaImageGroupMediaList.size(); i++) {
					
					programImageGroupMedia=new ProgramImageGroupMedia();
					
					mdg=(MorphDynaBean)mMediaImageGroupMediaList.get(i);
					
					programImageGroupMedia.setPath((String)mdg.get("path"));
					
					programImageGroupMedia.setSname((String)mdg.get("sname"));
					
				    programImageGroupMedia.setmTouchList(mTouchList);
				    
				    mMediaImageGroupMediaListNew.add(programImageGroupMedia);
					
				}
				programImageGroup.setmMediaImageGroupMediaList(mMediaImageGroupMediaListNew);
				//programImageGroup.setmTouchList(mTouchList);
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
		
		
		
		
		
		
		//流媒体
		if(streamurl==null||streamurl.equals("")){
		}else{
			String streams[]=streamurl.split("\\*");
			if(streams.length>=7){
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
			if(avs.length>=6){
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
			if(ssshows.length>=6){
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
			//元素id_^x_^y_^w_^h_^请求数据url_^字体颜色_^字体大小_^滚动速度_^刷新时间_^滚动类型
			String[] rs = rsskey.split("\\_\\^");
			List<ProgramRss> prList=new ArrayList<ProgramRss>();
			if(rs.length>=11){
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
			if(jps.length>=7){
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
					
					if(textss.length>=23){
						pt.setRelationKey("");
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
					.replaceAll("\n", "")
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
					
					if(textss.length>=23){
						pt2.setRelationKey("");
						pt2.setHighFontColor(textss[23]);
						if(textss[24].equals("undefined")){
							pt2.setFontColorCb(0);
						}else{
							pt2.setFontColorCb(Integer.parseInt(textss[24]));
						}
						pt.setHighBgColor(textss[25]);
						
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
		
		//汇率
		if(hltxt==null||hltxt.equals("")){}else{
			List<ProgramHl> ptList=new ArrayList<ProgramHl>();
			//元素id_请求地址_刷新时间(秒)_X_Y_W_H
			String hls[]=hltxt.split("\\_");
			if(hls.length>=7){
				ProgramHl ph=new ProgramHl();
				ph.setmId(hls[0]);
				ph.setmLeft(Integer.parseInt(hls[3]));
				ph.setmTop(Integer.parseInt(hls[4]));
				ph.setmWidth(Integer.parseInt(hls[5]));
				ph.setmHeight(Integer.parseInt(hls[6]));
				ph.setHurl(hls[1]);
				ph.setHtime(Integer.parseInt(hls[2]));
				ptList.add(ph);
				
				//下载静态页面
				HttpURLConnection huc = (HttpURLConnection) new URL(hls[1])
						.openConnection();
				huc.setRequestMethod("GET");
				huc.setUseCaches(true);
				huc.connect();
				InputStream is = huc.getInputStream();
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(is, "utf-8"));
				StringBuffer temp = new StringBuffer();
				String str;
				while ((str = reader.readLine()) != null) {
					temp.append(str + "\n");
				}
				String htmlshow = temp.toString();
				f = new File(dir + File.separator + "hl.html");
				oldFileWriter = new FileOutputStream(f);
				oldFileWriter.write(htmlshow.getBytes("UTF-8"));
				oldFileWriter.close();
				
				
			}
			pg.setmHlList(ptList);
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
					pcw.setmWeatherList(pwList);
					
					
					pcw.setType(ResourceType.TYPE_WEATHER);
					pcw.setmWeatherList(pwList);
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
							ph=new  ProgramHtml();
							ph.setHtmlUrl(html2ss[0]);
							ph.setHtmlQtime(Integer.parseInt(html2ss[1]));
							ph.setmShowNavigation(Integer.parseInt(html2ss[2]));
							ph.setmShowPCWeb(Integer.parseInt(html2ss[3]));
							ph.setClientMarkSuffix(Integer.parseInt(html2ss[4]));
							phList.add(ph);
						}
					}
					/*过滤touch事件*/
					List<TouchInteractive>  mTouchList=TouchTool.filterTouchs(pch.getmId(), touchList);
					pch.setmTouchList(mTouchList);
					pch.setmHtmlList(phList);
					pch.setType(ResourceType.TYPE_WEB);
					pch.setShowZindex(Integer.parseInt(htmlss[8]));
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
		//充电桩/或者插件
		if(jsonDlls==null||jsonDlls.equals("")||jsonDlls.equals("[]")){}else{
            JSONArray json = JSONArray.fromObject(jsonDlls);
            
            List<ProgramPublic> mCDZDlls=new ArrayList<ProgramPublic>();
            
            mCDZDlls= (List<ProgramPublic>)JSONArray.toCollection(json, ProgramDll.class);
            
            
            for (int i = 0; i < mCDZDlls.size(); i++) {
            	mCDZDlls.get(i).setType(mCDZDlls.get(i).getType());
            	mDlls.add(mCDZDlls.get(i));
            	mDlls2.add(mCDZDlls.get(i));
            	/*过滤touch事件*/
				List<TouchInteractive>  mTouchList=TouchTool.filterTouchs(mCDZDlls.get(i).getmId(), touchList);
				mCDZDlls.get(i).setmTouchList(mTouchList);
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
		
		// 数据接口
		List<ProgramDataSource> mDsource = new ArrayList<ProgramDataSource>();

		if (jsonSource == null || jsonSource.equals("")) {
		} else {
			JSONArray json = JSONArray.fromObject(jsonSource);
			
			mDsource = (List<ProgramDataSource>) JSONArray.toCollection(json,ProgramDataSource.class);
			
			for (int i = 0; i < mDsource.size(); i++) {
				mDsource.get(i).setType(ResourceType.TYPE_DATA_SOURCE);
            	mDlls.add(mDsource.get(i));
            	mDlls2.add(mDsource.get(i));
			}
		}
		
		
		//排序mDlls
	     Collections.sort(mDlls,new Comparator<ProgramPublic>(){  
	    	  
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
		
		 //创建节目协议文件	
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
			sContent.setType(2);
			sm.insert("insert_scene_content", sContent);
	    }else{
	    	sContent.setContent(jsonArray2.toString());
			
			sm.update("update_scene_content", sContent);
	    }
	    
	    
	    //读取programSub.txt
		String programSubTxt="";
		
		if(itemViceType==1){
			 programSubTxt=FileHandle.readTxtFile(dir + File.separator + "programSub.txt");	
		}
		
		//删除无用文件	
		String tostr = jsonArray.toString()+"  "+programSubTxt
		+ " program.txt "
		+ " program2.txt "
		+ " jqfont.js "
		+ " tmp.txt "
		+ " jqfont2.js "
		+ " main_vs.swf "
	    + " see.html "
		+   fcontent
		+ " "
		+ " "
		+ " "
		+ " "
		+ " time.html time.txt"
		+ " gncj.txt  hl.html"
		+ " wtime.txt wtime.html table.txt table.html  " 
		+ "  play.txt " 
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
		
		
		
			
		String tsons="";
		TouchInteractive touchInteractive;
		for (int i = 0; i < touchList.size(); i++) {
			touchInteractive=touchList.get(i);
			if(touchInteractive!=null){
				if(touchInteractive.gettVideoPaths().length()!=0){
					if(x86tev.length()==0){
						x86tev=touchInteractive.gettVideoPaths();
					}else{
						x86tev=x86tev+"|"+touchInteractive.gettVideoPaths();
					}
					
					
				}
				
				if(touchInteractive.gettType()==4){
				    if(tsons.equals("")){
						tsons=touchInteractive.gettResources();
					}else{
						tsons=tsons+"|"+touchInteractive.gettResources();
					}
				}
				
				
				
			}
		}
		ProgramRecyder pr;
		for (int i = 0; i < mRecyclerList.size(); i++) {
			pr=mRecyclerList.get(i);
			if(pr!=null){
				if(pr.getVideos().length()!=0){
					if(x86tev.length()==0){
						x86tev=pr.getVideos();
					}else{
						x86tev=x86tev+"|"+pr.getVideos();
					}
					
					
				}
			}
			
		}
		
		// 获取场景(查找场景是否存在)
		// see_scfilename_scene
		// Object obj=sm.queryForObject("see_scfilename_scene",mfile);
		if (obj == null) {
			scene = (Scene) session.get("scene");
			scene.setFilename(mfile);
			scene.setName(name);
			scene.setMcontent(mcontent);
			scene.setUrid(urid);
			scene.setTson(tsons);
			scene.setSdate(date);
			scene.setVname(x86tev);
			scene.setFcontent(fcontent);
			scene.setSf(sf);
			int sid =(Integer)sm.insert("insert_one_interactscene", scene);
			// Constant.insertTheLog(LogType.type9, urid,
			// local.getItem_java_addscene()+":" + scene.getName(), 1);
			// 获取刚插入场景的id
		
			// 添加节目和场景表
			ItemScene itemscene = new ItemScene();
			itemscene.setSceneid(sid);
			itemscene.setItemid(item.getId());
			sm.insert("insert_one_interactitemscene", itemscene);

		

		} else {
			scene = (Scene) obj;
			scene.setFilename(mfile);
			scene.setName(name);
			scene.setMcontent(mcontent);
			scene.setUrid(urid);
			scene.setSdate(date);
			scene.setVname(x86tev);
			scene.setFcontent(fcontent);
			scene.setSf(sf);
			scene.setTson(tsons);
			sm.update("update_interactscene", scene);
			
			// Constant.insertTheLog(LogType.type11, urid,
			// local.getItem_java_updatescene()+":" + scene.getName(), 1);
		}

		 /**遍历节目下所有场景,视频,音频文件字节大小综合**/
		List<Scene> fnVns= sm.queryForList("sel_it_fnVn_iid", item.getId());
		Scene fnVn;
		String filepathzip="";
		long len=0L;
		String[] vms;
		long clen=0L;
		
		for (int i = 0; i < fnVns.size(); i++) {
			fnVn=fnVns.get(i);
			if(fnVn!=null){
				
				/**获取场景zip大小*/
				filepathzip = Constant.FILES + File.separator+ fnVn.getFilename() + ".zip";
				
				len = FileHandle.getFileByte(filepathzip);
				
				/**获取视频,音频大小*/
				if(!"".equals(fnVn.getVname())){
					vms = fnVn.getVname().split("\\|");
					for (int j = 0; j < vms.length; j++) {
						Sucai sc = (Sucai)sm.queryForObject("sel_sc_filename", vms[j]);
						if(sc!=null){
							len += sc.getLen();
						}
						
//						len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
					}
				}
				
			}
			
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
			
			
			clen+=len;
		}
		
		item.setLen(clen);
		
		// 更新节目
		if(itemname!=null||!"".equals(itemname)){
			item.setName(itemname);
		}
		// 更新节目
		
		sm.update("upd_interactitem2", item);
	   
		
		if(savetype==1){
			session.remove("scene");
			session.remove("interactitem");
		}else if(savetype==2||savetype==3){
			
			session.put("interactitem", item);
			//获取这个互动节目下的全部场景
			scenes = null;
			scenes = sm.queryForList("sel_item_interact_allscene", item.getId());
			
			
			// 获取第一个互动场景
			oneurl = (String) sm.queryForObject("sel_one_scene", item.getId());

			Object interactobj = sm.queryForObject("sel_scene_filenames",
					interacturl);
			if (interactobj == null) {
				// 获取分辨率
				Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_fbl_all_id", item.getFblid());
				twidth = fbl.getTx();
				theight = fbl.getTy();
				// 新增场景
				Scene se = new Scene();
				se.setFilename(interacturl);
				File dirFile = new File(Constant.FILES + File.separator
						+ se.getFilename());
				dirFile.mkdir();
				FileHandle.copy2(Constant.EXE+File.separator+"main_vs.swf",Constant.FILES + File.separator
						+interacturl+File.separator+"main_vs.swf");
				FileHandle.copy2(Constant.EXE+File.separator+"transpant.png",Constant.FILES + File.separator
						+ interacturl+File.separator+"transpant.png");
				se.setSf(sf);
				se.setTx(twidth);
				se.setTy(theight);
				
				
				se.setName(Constant.LOCAL.getA00437()+1);
				session.remove("scene");
				session.put("scene", se);
				
			
				
			} else {
				// 获取分辨率
				Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_fbl_all_id", item.getFblid());
				twidth = fbl.getTx();
				theight = fbl.getTy();

				scene = (Scene) interactobj;
				scene.setTx(twidth);
				scene.setTy(theight);
				session.put("scene", scene);
				
			}
		}
		
		long itemclen=0L;
		Scene se;
		int fileExists=0;
		
		String filenNameR =(String)sm.queryForObject("sel_interact_item_filename_id",item.getId());
		long allclen=0L;
		long cclen=0L;
		
		List<Scene> scenes=new ArrayList<Scene>();
		
		Constant.recursionFileNameTson(filenNameR, scenes);
		
		/** 验证文件存在不存在，并且获取文件大小*/
		for (int i = 0; i < scenes.size(); i++) {
			se=scenes.get(i);
			if(se!=null){
				
				/**获取场景zip大小*/
				filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
				
				/**验证文件存在不存在: 0不存在,1存在**/
				fileExists=FileHandle.fileExists(filepathzip);
														
				//if(fileExists==0){
				//	return "success2"; 
				//}
				
				cclen = FileHandle.getFileByte(filepathzip);
				
				/**获取视频,音频大小*/
				if(!"".equals(se.getVname())){					
					vms = se.getVname().split("\\|");
					for (int j = 0; j < vms.length; j++) {
						
						//fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
						//if(fileExists==0){
						//	return "success2"; 
						//}
						Sucai sc = (Sucai)sm.queryForObject("sel_sc_filename", vms[j]);
						if(sc!=null){
							cclen += sc.getLen();
						}
						
//						cclen += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
					}
				}
				
			    Scene fnVnSub= (Scene)sm.queryForObject("sel_fnvn_iid_sub",  se.getFilename());
					
					if(fnVnSub!=null){
					    	//获取视频,音频大小
							if(!"".equals(fnVnSub.getVname())){
									vms = fnVnSub.getVname().split("\\|");
									for (int j = 0; j < vms.length; j++) {
										Sucai sc = (Sucai)sm.queryForObject("sel_sc_filename", vms[j]);
										if(sc!=null){
											cclen += sc.getLen();
										}
										//len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
									}
							}
					}
									
			}
			allclen+=cclen;
			
		}
		
		item.setAlllen(allclen);
		
		SqlConnect.getSqlMapInstance().update("upd_interactitem_alllen", item);
		
		//修改所有关联节目的总大小
		Constant.updateAllSceneItemAllclen(allclen,scenes);
		
		
		//记录最后一次节目操作人
		ItemEditHistory  itemEditHis=new ItemEditHistory();
		itemEditHis.setEditUid(urid);
		itemEditHis.setItemType(2);
		itemEditHis.setItemId(item.getId());
		itemEditHis.setEditDate(DateUtil.getTime());
		
		SqlConnect.getSqlMapInstance().insert("ad_item_history", itemEditHis);
		
		
        if(upFblSave==1){
			
			itemid=item.getId();
			
			return "editFblSaveItem";
		}

		
		return SUCCESS;
	
	}

	public String getJsonSource() {
		return jsonSource;
	}

	public void setJsonSource(String jsonSource) {
		this.jsonSource = jsonSource;
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

	public String getSeecontent() {
		return seecontent;
	}

	public void setSeecontent(String seecontent) {
		this.seecontent = seecontent;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRsskey() {
		return rsskey;
	}

	public void setRsskey(String rsskey) {
		this.rsskey = rsskey;
	}

	public List getScenes() {
		return scenes;
	}

	public void setScenes(List scenes) {
		this.scenes = scenes;
	}

	public String getTson() {
		return tson;
	}

	public void setTson(String tson) {
		this.tson = tson;
	}

	public String getInteracturl() {
		return interacturl;
	}

	public void setInteracturl(String interacturl) {
		this.interacturl = interacturl;
	}

	public String getInteractname() {
		return interactname;
	}

	public void setInteractname(String interactname) {
		this.interactname = interactname;
	}

	public String getFatherurl() {
		return fatherurl;
	}

	public void setFatherurl(String fatherurl) {
		this.fatherurl = fatherurl;
	}

	public String getOneurl() {
		return oneurl;
	}

	public void setOneurl(String oneurl) {
		this.oneurl = oneurl;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTimeHtml() {
		return timeHtml;
	}

	public void setTimeHtml(String timeHtml) {
		this.timeHtml = timeHtml;
	}

	public String getTimeTxt() {
		return timeTxt;
	}

	public void setTimeTxt(String timeTxt) {
		this.timeTxt = timeTxt;
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

	public String getStreamurl() {
		return streamurl;
	}

	public void setStreamurl(String streamurl) {
		this.streamurl = streamurl;
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

	public String getX86videox() {
		return x86videox;
	}

	public void setX86videox(String x86videox) {
		this.x86videox = x86videox;
	}

	public String getX86videoy() {
		return x86videoy;
	}

	public void setX86videoy(String x86videoy) {
		this.x86videoy = x86videoy;
	}

	public String getX86videowidth() {
		return x86videowidth;
	}

	public void setX86videowidth(String x86videowidth) {
		this.x86videowidth = x86videowidth;
	}

	public String getX86videoheight() {
		return x86videoheight;
	}

	public void setX86videoheight(String x86videoheight) {
		this.x86videoheight = x86videoheight;
	}

	public String getX86vname() {
		return x86vname;
	}

	public void setX86vname(String x86vname) {
		this.x86vname = x86vname;
	}

	public String getX86volofs() {
		return x86volofs;
	}

	public void setX86volofs(String x86volofs) {
		this.x86volofs = x86volofs;
	}

	public String getX86ids() {
		return x86ids;
	}

	public void setX86ids(String x86ids) {
		this.x86ids = x86ids;
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

	public String getAppstrs() {
		return appstrs;
	}

	public void setAppstrs(String appstrs) {
		this.appstrs = appstrs;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getTwidth() {
		return twidth;
	}

	public void setTwidth(int twidth) {
		this.twidth = twidth;
	}

	public int getTheight() {
		return theight;
	}

	public void setTheight(int theight) {
		this.theight = theight;
	}

	public int getSavetype() {
		return savetype;
	}

	public void setSavetype(int savetype) {
		this.savetype = savetype;
	}

	public String getJptxt() {
		return jptxt;
	}

	public void setJptxt(String jptxt) {
		this.jptxt = jptxt;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public String getNetcamera() {
		return netcamera;
	}

	public void setNetcamera(String netcamera) {
		this.netcamera = netcamera;
	}

	public String getJsonImgs() {
		return jsonImgs;
	}

	public void setJsonImgs(String jsonImgs) {
		this.jsonImgs = jsonImgs;
	}

	public String getJsonTouchs() {
		return jsonTouchs;
	}

	public void setJsonTouchs(String jsonTouchs) {
		this.jsonTouchs = jsonTouchs;
	}
	

	public String getJsonVideos() {
			return jsonVideos;
	}

	public void setJsonVideos(String jsonVideos) {
			this.jsonVideos = jsonVideos;
	}
	
	public String getJsonRecyclers() {
		return jsonRecyclers;
	}

	public void setJsonRecyclers(String jsonRecyclers) {
		this.jsonRecyclers = jsonRecyclers;
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

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getJsonDlls() {
		return jsonDlls;
	}

	public void setJsonDlls(String jsonDlls) {
		this.jsonDlls = jsonDlls;
	}
}
