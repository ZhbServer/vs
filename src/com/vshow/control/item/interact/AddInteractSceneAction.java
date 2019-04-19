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
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemScene;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Scene;
import com.vshow.control.data.SceneInfo;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.Tq;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;

public class AddInteractSceneAction extends ActionSupport {

	private String content;
	private String mfile;
	private String mcontent;
	private String name;
	private String seecontent;
	private int videox;
	private int videoy;
	private int videowidth;
	private int videoheight;
	private String vname;
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
	private String gncj;
	private String hltxt;
	private String wtime;
	private String bginfo;
	private String mtable;

	private String x86videox;
	private String x86videoy;
	private String x86videowidth;
	private String x86videoheight;
	private String x86volofs; //x86双区域音量开关
	

	private String x86vname;
	private String lcsh; // 楼层显示
	private String flash;//flash 信息
	private String html; //网页提取信息
	
	private String appstrs; //app跳转
	private String code;   //二维码显示区

	private int twidth;
	private int theight;

	private String code2;   //二维码
	
	private String netcamera;   //网络摄像

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		
		fatherurl = mfile;
		// 先查询节目是否存在
		// 获取节目
		InteractItem item = (InteractItem) session.get("interactitem");
		if (item.getId() == 0) {
			// 插入节目
			sm.insert("insert_one_interactitem", item);
			// 并且返回刚插入节目的信息
			item = (InteractItem) sm.queryForObject("see_zjinteractitem", item);
			session.put("interactitem", item);
			LogHandle.insertTheLog(LogType.type6, urid, Constant.LOCAL.getA00443()+ ":" + item.getName(), 1,1);
		} else {
			// 节目已存在查找
			item = (InteractItem) sm.queryForObject("see_zjinteractitem", item);
			int ocheck = (Integer) session.get("urcheck");
			if (ocheck == 0 || ocheck == 2) {
				item.setOcheck(0);
			} else if (ocheck == 1 || ocheck == 3) {
				item.setOcheck(1);
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

		f = new File(dir + File.separator + "index.html");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(content.getBytes("UTF-8"));
		oldFileWriter.close();

		f = new File(dir + File.separator + "go.html");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(gcontent.getBytes("UTF-8"));
		oldFileWriter.close();

		Scene tempScene = (Scene) session.get("scene");
		if (tempScene != null) {
			String fblTxt = tempScene.getTx() + "*" + tempScene.getTy();
			f = new File(dir + File.separator + "fbl.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(fblTxt.getBytes("UTF-8"));
			oldFileWriter.close();

		}

		if (mtable == null || "".equals(mtable)) {
			if (new File(dir + File.separator + "table.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "table.html");
				FileHandle.deleteFile(dir + File.separator + "table.txt");
			}
		} else {
			if (new File(dir + File.separator + "table.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "table.html");
				FileHandle.deleteFile(dir + File.separator + "table.txt");
			}
			try {
				String[] tabletxts = mtable.split("\\*");
				HttpURLConnection huc = (HttpURLConnection) new URL(
						tabletxts[0]).openConnection();
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
				f = new File(dir + File.separator + "table.html");
				oldFileWriter = new FileOutputStream(f);
				oldFileWriter.write(htmlshow.getBytes("UTF-8"));
				oldFileWriter.close();

				mtable = tabletxts[1] + "*" + tabletxts[2] + "*" + tabletxts[3]
						+ "*" + tabletxts[4];
				f = new File(dir + File.separator + "table.txt");
				oldFileWriter = new FileOutputStream(f);
				oldFileWriter.write(mtable.getBytes("UTF-8"));
				oldFileWriter.close();

			} catch (Exception e) {

			}

		}

		//添加item.txt
		if (new File(dir + File.separator + "item.txt").exists()) {
			FileHandle.deleteFile(dir + File.separator + "item.txt");
		}
		f = new File(dir + File.separator + "item.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(item.getName().getBytes("UTF-8"));
		oldFileWriter.close();
		
		if (bginfo == null || "".equals(bginfo)) {
			if (new File(dir + File.separator + "bg.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "bgtxt");
			}
			f = new File(dir + File.separator + "bg.txt");
			f.createNewFile();

		} else {
			if (new File(dir + File.separator + "bg.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "bg.txt");
			}
			f = new File(dir + File.separator + "bg.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(bginfo.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
		
		if (code == null || "".equals(code)) {
			if (new File(dir + File.separator + "code.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "code.txt");
			}

		} else {
			if (new File(dir + File.separator + "code.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "code.txt");
			}
			f = new File(dir + File.separator + "code.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(code.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
		
		if (flash == null || "".equals(flash)) {
			if (new File(dir + File.separator + "flash.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "flash.txt");
			}

		} else {
			if (new File(dir + File.separator + "flash.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "flash.txt");
			}
			f = new File(dir + File.separator + "flash.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(flash.getBytes("UTF-8"));
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
		
		
		if (netcamera == null || "".equals(netcamera)) {
			if (new File(dir + File.separator + "netcamera.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "netcamera.txt");
			}

		} else {
			if (new File(dir + File.separator + "netcamera.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "netcamera.txt");
			}
			f = new File(dir + File.separator + "netcamera.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(netcamera.getBytes("UTF-8"));
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
		
		if (html == null || "".equals(html)) {
			if (new File(dir + File.separator + "html.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "html.txt");
			}

		} else {
			if (new File(dir + File.separator + "html.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "html.txt");
			}
			f = new File(dir + File.separator + "html.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(html.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
		if (hltxt == null || "".equals(hltxt)) {
			if (new File(dir + File.separator + "hl.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "hl.html");
				FileHandle.deleteFile(dir + File.separator + "hl.txt");
			}
		} else {
			if (new File(dir + File.separator + "hl.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "hl.html");
				FileHandle.deleteFile(dir + File.separator + "hl.txt");
			}
			try {
				String[] hltxts = hltxt.split("\\_");
				HttpURLConnection huc = (HttpURLConnection) new URL(hltxts[0])
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

			} catch (Exception e) {

			}

			f = new File(dir + File.separator + "hl.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(hltxt.getBytes("UTF-8"));
			oldFileWriter.close();
		}

		// 世界时钟
		if (!"".equals(wtime)) {
			if (new File(dir + File.separator + "wtime.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "wtime.html");
				FileHandle.deleteFile(dir + File.separator + "wtime.txt");
			}
			try {
				String[] wtimes = wtime.split("\\*");
				HttpURLConnection huc = (HttpURLConnection) new URL(wtimes[0])
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
				f = new File(dir + File.separator + "wtime.html");
				oldFileWriter = new FileOutputStream(f);
				oldFileWriter.write(htmlshow.getBytes("UTF-8"));
				oldFileWriter.close();

			} catch (Exception e) {

			}
			f = new File(dir + File.separator + "wtime.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(wtime.getBytes("UTF-8"));
			oldFileWriter.close();

		} else {
			if (new File(dir + File.separator + "wtime.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "wtime.html");
				FileHandle.deleteFile(dir + File.separator + "wtime.txt");
			}

		}
		if (timeTxt == null || "".equals(timeTxt)) {
			if (new File(dir + File.separator + "time.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "time.html");
				FileHandle.deleteFile(dir + File.separator + "time.txt");
			}
		} else {
			if (new File(dir + File.separator + "time.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "time.html");
				FileHandle.deleteFile(dir + File.separator + "time.txt");
			}
			f = new File(dir + File.separator + "time.html");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(timeHtml.getBytes("UTF-8"));
			oldFileWriter.close();

			f = new File(dir + File.separator + "time.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(timeTxt.getBytes("UTF-8"));
			oldFileWriter.close();
		}
		
		if (av == null || "".equals(av)) {
			if (new File(dir + File.separator + "av.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "av.txt");
			}
		} else {
			if (new File(dir + File.separator + "av.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "av.txt");
			}
			f = new File(dir + File.separator + "av.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(av.getBytes("UTF-8"));
			oldFileWriter.close();
		}

		if (ssshow == null || "".equals(ssshow)) {
			if (new File(dir + File.separator + "camera.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "camera.txt");
			}
		} else {
			if (new File(dir + File.separator + "camera.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "camera.txt");
			}
			f = new File(dir + File.separator + "camera.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(ssshow.getBytes("UTF-8"));
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

		if (text == null || "".equals(text)) {
			if (new File(dir + File.separator + "text.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "text.txt");
			}
		} else {
			if (new File(dir + File.separator + "text.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "text.txt");
			}
			f = new File(dir + File.separator + "text.txt");
			oldFileWriter = new FileOutputStream(f);
			text = text.replaceAll("<STRONG>", "").replaceAll("</STRONG>", "")
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
			.replaceAll("</p>", "");

			oldFileWriter.write(text.getBytes("UTF-8"));
			oldFileWriter.close();
		}

		if (img == null || "".equals(img)) {
			if (new File(dir + File.separator + "img.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "img.txt");
			}
		}else{
			
			//判断是否互动图片 如果是放都最后加载
			String imgs[]=img.trim().split("\\*");
			String transpantimgs="";
			String publicimgs="";
			for (int i = 0; i < imgs.length; i++) {
				String imgss[]=imgs[i].split("\\~");
				if(imgss.length==8){
					if(imgss[5].equals("transpant.png")){
						if(transpantimgs.length()==0){
							transpantimgs=imgs[i];
						}else{
							transpantimgs+="*"+imgs[i];
						}
					}else{
						if(publicimgs.length()==0){							
							publicimgs=imgs[i];
						}else{
							publicimgs+="*"+imgs[i];
						}
					}
				}
			}
			if(publicimgs.length()==0&&transpantimgs.length()!=0){
				img=transpantimgs;
			}else if(publicimgs.length()!=0&&transpantimgs.length()==0){
				img=publicimgs;
			}else{
				img=publicimgs+"*"+transpantimgs;
			}
			f = new File(dir + File.separator + "img.txt");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(img.getBytes("UTF-8"));
			oldFileWriter.close();
			
		}
		

		if (!citykey.equals("")) {
			int temptype = 0;
			String[] cs = citykey.split("_");

			f = new File(dir + File.separator + "tq.txt");
			oldFileWriter = new FileOutputStream(f);
			int time = Integer.parseInt(cs[0]) * 3600;
			String[] pros = cs[2].split("&");
			String imgsize = pros[4].split("=")[1];
			String dx = pros[2].split("=")[1];
			if (cs[2].indexOf("gettq2") == -1) {
				temptype = 0;
			} else {
				temptype = 1;
			}
			String con = cs[1] + "*" + time + "*" + pros[2].split("=")[1] + "*"
					+ pros[1].split("=")[1] + "*" + cs[3] + "*" + cs[4] + "*"
					+ cs[5] + "*" + cs[6] + "*" + pros[4].split("=")[1] + "*"
					+ temptype;
			oldFileWriter.write(con.getBytes("UTF-8"));
			oldFileWriter.close();
			Tq tq = new Tq();
			Tq tq2 = new Tq();
			if (Integer.parseInt(cs[1]) >= 101010100) {
				Tq tqs = (Tq) sm.queryForObject("g_wotq_citykey",
						cs[1]);
				tq.setCity(tqs.getCity());
				tq.setDay(tqs.getDay().split("\\|")[0]);
				tq.setGif(tqs.getGif().split("\\|")[0]);
				tq.setContent(tqs.getContent().split("\\|")[0]);
				tq2 = new Tq();
				tq2.setDay(tqs.getDay().split("\\|")[1]);
				tq2.setGif(tqs.getGif().split("\\|")[1]);
				tq2.setContent(tqs.getContent().split("\\|")[1]);
			} else {
				tq = (Tq) sm.queryForObject("g_enwotq_citykey", cs[1]);
			}
			String tqcontent = "";
			if (temptype == 0) {
				tqcontent = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
						+ "<!-- saved from url=(0014)about:internet -->"
						+ "<html xmlns='http://www.w3.org/1999/xhtml'>"
						+ "<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head>"
						+ "<body style='background-color:transparent' scroll=no><div  align='left' id='tqdiv' style='font-family:黑体;font-size:"
						+ dx
						+ "px;color:#"
						+ pros[1].split("=")[1]
						+ ";'>"
						+ "<table width='100%' height='100%' border='0' align='left' >"
						+ "<tr><td  align='center'><img width='"
						+ imgsize
						+ "px'  height='"
						+ imgsize
						+ "px' src='"
						+ tq.getGif()
						+ "'/></div></td>"
						+ "</tr><tr><td align='center'>"
						+ tq.getCity()
						+ "&nbsp;&nbsp;"
						+ tq.getDay()
						+ "</div></td>"
						+ "</tr><tr><td align='center'>"
						+ tq.getContent()
						+ "</div></td>"
						+ "</tr></table></div></body>";
			} else {
				tqcontent = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
						+ "<!-- saved from url=(0014)about:internet -->"
						+ "<html xmlns='http://www.w3.org/1999/xhtml'>"
						+ "<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head>"
						+ "<body style='background-color:transparent' scroll=no><div  align='left' id='tqdiv' style='font-family:黑体;font-size:"
						+ dx
						+ "px;color:#"
						+ pros[1].split("=")[1]
						+ ";'>"
						+ "<table width='100%' height='100%' border='0' align='left' >"
						+ "<tr><td  align='center'><img width='"
						+ imgsize
						+ "px'  height='"
						+ imgsize
						+ "px' src='"
						+ tq.getGif()
						+ "'/></div></td><td  align='center'><img width='"
						+ imgsize
						+ "px'  height='"
						+ imgsize
						+ "px' src='"
						+ tq2.getGif()
						+ "'/></div></td>"
						+ "</tr><tr><td align='center'>"
						+ tq.getCity()
						+ "&nbsp;今天&nbsp;"
						+ tq.getDay()
						+ "</div></td><td  align='center'>明天&nbsp;"
						+ tq2.getDay()
						+ "</td></tr><tr><td align='center'>"
						+ tq.getContent()
						+ "</div></td><td align='center'>"
						+ tq2.getContent()
						+ "</div></td>"
						+ "</tr></table></div></body>";

			}
			f = new File(dir + File.separator + "tq.html");
			oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(tqcontent.getBytes("UTF-8"));
			oldFileWriter.close();

		} else {
			if (new File(dir + File.separator + "tq.html").exists()) {
				FileHandle.deleteFile(dir + File.separator + "tq.html");
			}
			if (new File(dir + File.separator + "tq.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "tq.txt");
			}
		}

		if (!rsskey.equals("")) {
			int temptype = 0;
			String type = "";
			String[] rs = rsskey.split("\\_\\^");
			if (rs.length == 6) {
				f = new File(dir + File.separator + "rss.txt");
				oldFileWriter = new FileOutputStream(f);

				String[] pros = rs[0].split("&");
				if (rs[0].indexOf("getrss2") == -1) {
					temptype = 1;
					type = "up";
				} else {
					temptype = 2;
					type = "left";
				}

				Rss rss = (Rss) sm.queryForObject("find_rss_byurl",
						pros[0].split("\\=")[1]);
				String rsscon = rss.getContent().replaceAll("<STRONG>", "")
						.replaceAll("</STRONG>", "").replaceAll("<U>", "")
						.replaceAll("</U>", "").replaceAll("<STRIKE>", "")
						.replaceAll("</STRIKE>", "").replaceAll("<EM>", "")
						.replaceAll("</EM>", "").replaceAll("<P>", "")
						.replaceAll("</P>", "").replaceAll("&nbsp;", " ")
						.replaceAll("<P aligncenter>", "")
						.replaceAll("<P alignleft>", "")
						.replaceAll("<P alignright>", "").replaceAll("\\*", "");
				String tempfcolor = pros[1].split("\\=")[1];
				String fcolor = "-16777216";
				if (tempfcolor.equals("ED1C24")) {
					fcolor = "-65536";
				}
				if (tempfcolor.equals("3F48CC")) {
					fcolor = "-16776961";
				}
				if (tempfcolor.equals("FFC90E")) {
					fcolor = "-256";
				}
				if (tempfcolor.equals("22B14C")) {
					fcolor = "-16711936";
				}
				if (tempfcolor.equals("FFFFFF")) {
					fcolor = "-2";
				}
				if (tempfcolor.equals("7F7F7F")) {
					fcolor = "-7829368";
				}
				if (tempfcolor.equals("000000")) {
					fcolor = "-16777216";
				}

				String con = pros[0].split("\\=")[1] + "*" + rs[1] + "*"
						+ pros[2].split("\\=")[1] + "*" + fcolor + "*"
						+ pros[4].split("\\=")[1] + "*" + temptype + "*"
						+ rs[2] + "*" + rs[3] + "*" + rs[4] + "*" + rs[5] + "*"
						+ rsscon;

				oldFileWriter.write(con.getBytes("UTF-8"));
				oldFileWriter.close();
			}
		} else {

			if (new File(dir + File.separator + "rss.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "rss.txt");
			}
		}

		String vsjm = "";
		String tvam = vname.trim();
		String[] tems;
		String[] vss;
		String asname = "";
		String dsdf;
		String asxad = "";
		String tev = "";
		String imgs = "";
		int qie = 0;
		String liu = "";
		int weizh = 0;
		String gog = "";
		int ship = 0;
		int count = 0;
		if (tvam.length() > 0) {
			tems = tvam.split("\\^");
			for (int i = 0; i < tems.length; i++) {
				vname = tems[i];
				if (vname.length() > 2) {
					weizh = vname.indexOf('|');
					try {
						qie = Integer
								.parseInt(vname.substring(1, weizh).trim());
						if (qie == 0) {
							qie = 5;
						}
					} catch (Exception e) {
						// TODO: handle exception
					}
					vname = vname.substring(weizh + 1, vname.length()).trim();
					if (vname.indexOf(":") == -1 && vname.indexOf("#") == -1) {
						vss = vname.split("\\|");
						dsdf = vss[0];
						asname = dsdf.substring(0, dsdf.lastIndexOf("."));
						String asx = asname + ".asx";
						asxad += asx + " ";
						String content = "";
						content += "<ASX>";
						for (int j = 0; j < vss.length; j++) {
							dsdf = vss[j];
							if (dsdf.endsWith(".mp3") || dsdf.endsWith(".wma")
									|| dsdf.endsWith(".wav")) {
								if (tev.isEmpty()) {
									tev = dsdf;
								} else {
									tev += "|" + dsdf;
								}
								if (ship == 3) {
									gog += "|" + dsdf;
								} else {
									ship = 3;
									gog = "";
									if (gog.length() == 0) {
										gog += "2_0@" + dsdf;
									} else {
										gog += "#" + "2_0@" + dsdf;
									}

								}
								// videowidth=1;
								// videoheight=1;
								content += "<Entry>";
								content += "<Ref href =\"../";
								content += dsdf;
								content += "\"/>";
								content += "</Entry>";
								count = 0;
							} else {
								if (count == 0) {
									gog = "";
								}
								if (dsdf.endsWith(".jpg")
										|| dsdf.endsWith(".gif")
										|| dsdf.endsWith(".png")) {
									liu += dsdf + " ";
									imgs = imgs + " " + dsdf;
									if (ship == 2) {
										gog += "|" + dsdf;
									} else {
										ship = 2;
										if (gog.isEmpty()) {
											gog += "1_" + qie + "@" + dsdf;
										} else {
											gog += "#" + "1_" + qie + "@"
													+ dsdf;
										}
									}
									// 把图片copy到现在场景里面
									// String oldfile = Constant.FILES
									// + File.separator + dsdf;
									// String newfile = Constant.FILES
									// + File.separator + mfile
									// + File.separator + dsdf;
									// FileHandle.copy(oldfile, newfile);

								} else {
									if (tev.isEmpty()) {
										tev = dsdf;
									} else {
										tev += "|" + dsdf;
									}
									if (ship == 1) {
										gog += "|" + dsdf;
									} else {
										ship = 1;
										if (gog.length() == 0) {
											gog += "0_0@" + dsdf;
										} else {
											gog += "#" + "0_0@" + dsdf;
										}

									}

									content += "<Entry>";
									content += "<Ref href =\"../";
									content += dsdf;
									content += "\"/>";
									content += "</Entry>";
								}
								count++;

							}
						}
						content += "</ASX>";
						File asxFile = new File(Constant.FILES + File.separator
								+ mfile + File.separator + asx);
						FileOutputStream dsdsw = new FileOutputStream(asxFile);
						dsdsw.write(content.getBytes("utf-8"));
						dsdsw.close();
						vsjm = mfile + "*" + stime + "*" + gog + "*" + videox
								+ "*" + videoy + "*" + videowidth + "*"
								+ videoheight;
					} else if (vname.indexOf(":") != -1
							&& vname.indexOf("#") == -1) {
						vsjm = mfile + "*" + stime + "*" + "0_0@" + vname + "*"
								+ videox + "*" + videoy + "*" + videowidth
								+ "*" + videoheight;
					} else if (vname.indexOf(":") == -1
							&& vname.indexOf("#") != -1) {
						vsjm = mfile + "*" + stime + "*" + "3_0@0*" + videox
								+ "*" + videoy + "*" + videowidth + "*"
								+ videoheight;
					}
				} else {
					vsjm = mfile + "*" + stime + "**0*0*0*0";
				}
			}
		} else {
			vsjm = mfile + "*" + stime + "**0*0*0*0";
		}

		f = new File(dir + File.separator + "vsjm.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(vsjm.getBytes("utf-8"));
		oldFileWriter.close();

		// x86视频(多区域)
		String x86vsjm = "";
		String x86vsjm3 = "";
		String x86tvamstr = x86vname.trim();
		String[] x86tvams;
		String x86tvam = "";
		String[] x86tems;
		String[] x86vss;
		String x86asname = "";
		String x86dsdf;
		String x86asxad = "";
		String x86tev = "";
		String x86imgs = "";
		int x86qie = 0;
		String x86liu = "";
		int x86weizh = 0;
		String x86gog = "";
		int x86ship = 0;
		int x86count = 0;
		String[] x86vxs;
		String[] x86vys;
		String[] x86vws;
		String[] x86vhs;
		String[] x86volofss;
		String x86vx = "0";
		String x86vy = "0";
		String x86vw = "200";
		String x86vh = "200";
		String x86vol="0";
		if (x86tvamstr.length() > 0) {
			x86tvams = x86tvamstr.split("\\%");
			x86vxs = x86videox.split("\\%");
			x86vys = x86videoy.split("\\%");
			x86vws = x86videowidth.split("\\%");
			x86vhs = x86videoheight.split("\\%");
			x86volofss=x86volofs.split("\\%");
			for (int i = 0; i < x86tvams.length; i++) {
				x86tems = x86tvams[i].split("\\^");
				if (x86tvams.length == x86vxs.length) {
					x86vx = x86vxs[i];
					x86vy = x86vys[i];
					x86vw = x86vws[i];
					x86vh = x86vhs[i];
					x86vol=x86volofss[i];
				}
				x86gog = "";
				x86ship = 0;
				for (int j = 0; j < x86tems.length; j++) {
					x86vname = x86tems[j];
					if (x86vname.length() > 2) {
						x86weizh = x86vname.indexOf('|');
						try {
							x86qie = Integer.parseInt(x86vname.substring(1,
									x86weizh).trim());
							if (x86qie == 0) {
								x86qie = 5;
							}
						} catch (Exception e) {
							// TODO: handle exception
						}
						x86vname = x86vname.substring(x86weizh + 1,
								x86vname.length()).trim();

						if (x86vname.indexOf(":") == -1
								&& x86vname.indexOf("#") == -1) {
							x86vss = x86vname.split("\\|");
							x86dsdf = x86vss[0];
							asname = x86dsdf.substring(0,
									x86dsdf.lastIndexOf("."));
							String x86asx = asname + ".asx";
							asxad += x86asx + " ";
							String content = "";
							content += "<ASX>";

							for (int k = 0; k < x86vss.length; k++) {
								x86dsdf = x86vss[k];
								if (x86dsdf.endsWith(".mp3")
										|| x86dsdf.endsWith(".wma")
										|| x86dsdf.endsWith(".wav")) {
									if (x86tev.isEmpty()) {
										x86tev = x86dsdf;
									} else {
										x86tev += "|" + x86dsdf;
									}
									if (x86ship == 3) {
										x86gog += "|" + x86dsdf;
									} else {
										x86ship = 3;
										x86gog = "";
										if (x86gog.length() == 0) {
											x86gog += "2_0@" + x86dsdf;
										} else {
											x86gog += "#" + "2_0@" + x86dsdf;
										}

									}
									content += "<Entry>";
									content += "<Ref href =\"../";
									content += x86dsdf;
									content += "\"/>";
									content += "</Entry>";
									x86count = 0;
								} else {
									if (x86count == 0) {
										x86gog = "";
									}
									if (x86dsdf.endsWith(".jpg")
											|| x86dsdf.endsWith(".gif")
											|| x86dsdf.endsWith(".png")) {
										x86liu += x86dsdf + " ";
										x86imgs = x86imgs + " " + x86dsdf;
										if (x86ship == 2) {
											x86gog += "|" + x86dsdf;
										} else {
											x86ship = 2;
											if (x86gog.isEmpty()) {
												x86gog += "1_" + x86qie + "@"
														+ x86dsdf;
											} else {
												x86gog += "#" + "1_" + x86qie
														+ "@" + x86dsdf;
											}
										}

									} else {
										if (x86tev.isEmpty()) {
											x86tev = x86dsdf;
										} else {
											x86tev += "|" + x86dsdf;
										}
										if (x86ship == 1) {
											x86gog += "|" + x86dsdf;
										} else {
											x86ship = 1;
											if (x86gog.length() == 0) {
												x86gog += "0_0@" + x86dsdf;
											} else {
												x86gog += "#" + "0_0@"
														+ x86dsdf;
											}

										}

									}
									x86count++;

								}
							}
							content += "</ASX>";
							File asxFile = new File(Constant.FILES
									+ File.separator + mfile + File.separator
									+ x86asx);
							FileOutputStream dsdsw = new FileOutputStream(
									asxFile);
							dsdsw.write(content.getBytes("UTF-8"));
							dsdsw.close();

							if ("".equals(x86vsjm)) {
								x86vsjm = mfile + "*" + stime + "*" + x86gog
										+ "*" + x86vx + "*" + x86vy + "*"
										+ x86vw + "*" + x86vh;
								x86vsjm3 = mfile + "*" + stime + "*" + x86gog
								+ "*" + x86vx + "*" + x86vy + "*"
								+ x86vw + "*" + x86vh+"*"+x86vol;
								
							} else {
								x86vsjm = x86vsjm + "$" + mfile + "*" + stime
										+ "*" + x86gog + "*" + x86vx + "*"
										+ x86vy + "*" + x86vw + "*" + x86vh;
								x86vsjm3 = x86vsjm3 + "$" + mfile + "*" + stime
								+ "*" + x86gog + "*" + x86vx + "*"
								+ x86vy + "*" + x86vw + "*" + x86vh+"*"+x86vol;

							}

						}else if (x86vname.indexOf(":") != -1
								&& x86vname.indexOf("#") == -1) {
							x86vsjm = mfile + "*" + stime + "*" + "0_0@" + x86vname + "*"
									+ videox + "*" + videoy + "*" + videowidth
									+ "*" + videoheight;
							x86vsjm3=x86vsjm;
						}
					}
				}
			}
		} else {
			x86vsjm = mfile + "*" + stime + "**0*0*0*0";
			x86vsjm3=x86vsjm;
		}

		f = new File(dir + File.separator + "vsjm2.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(x86vsjm.getBytes("UTF-8"));
		oldFileWriter.close();
		
		f = new File(dir + File.separator + "vsjm3.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(x86vsjm3.getBytes("UTF-8"));
		oldFileWriter.close();

		String kejm;
		kejm = name + "@" + mfile + "@" + mcontent + "@" + tev + "@" + fcontent
				+ "@" + sf + "@" + tson;
		f = new File(dir + File.separator + "key.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(kejm.getBytes("UTF-8"));
		oldFileWriter.close();

		// 获取视频和图片
		String logsimg = "";
		String logsvideo = "";
		String fs = "";
		int key;
		String[] ss;
		SceneInfo al;
		Sucai sc;
		ArrayList sl;
		String tf;
		String tna;
		String m44;
		if (fcontent.length() > 0) {
			String[] fss = fcontent.split("\\/");
			for (int i = 0; i < fss.length; i++) {
				fs = fss[i];
				key = Integer.parseInt(fs.substring(0, 1));
				ss = fs.substring(1, fs.length()).split("\\|");
				al = new SceneInfo();

				al.setType(key);
				sl = new ArrayList();
				if (key == 4) {
					al.setStime(Integer.parseInt(ss[5]));
					for (int j = 6; j < ss.length; j++) {
						tf = ss[j];
						sc = (Sucai) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_sc_filename", tf);
						if (sc != null) {
							if (logsimg.indexOf(sc.getName()) == -1) {
								if ("".equals(logsimg)) {
									logsimg = sc.getName();
								} else {
									logsimg = logsimg + "," + sc.getName();
								}
							}
						}

					}
				} else if (key == 1) {
					String bgfilestr = "";
					if (ss[4].indexOf("_") > -1) {
						if (ss[4].length() - 4 > 2) {	
						   bgfilestr = ss[4].substring(2, ss[4].length() - 4);
						}
					} else {
						if (ss[4].length() - 4 > 0) {	
						  bgfilestr = ss[4].substring(0, ss[4].length() - 4);
						}
					}
                    if(bgfilestr.equals("")){
						
					}else{
						sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
								"sel_sc_filename_like", bgfilestr);
						if (sc != null) {
							if (logsimg.indexOf(sc.getName()) == -1) {
								if ("".equals(logsimg)) {
									logsimg = sc.getName();
								} else {
									logsimg = logsimg + "," + sc.getName();
								}
							}
						}
						
					}
				} else if (key == 5) {
					sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_sc_filename", ss[4]);
					if (sc != null) {
						if (logsimg.indexOf(sc.getName()) == -1) {
							if ("".equals(logsimg)) {
								logsimg = sc.getName();
							} else {
								logsimg = logsimg + "," + sc.getName();
							}
						}
					}
				} else if (key == 6 || key == 7 || key == 8 || key == 9) {
					al.setStime(Integer.parseInt(ss[5]));
					m44 = ss[6];
					m44 = m44.substring(0, m44.lastIndexOf("0"));
					sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_sc_filename", m44);
					if (sc != null) {
						if (logsimg.indexOf(sc.getName()) == -1) {
							if ("".equals(logsimg)) {
								logsimg = sc.getName();
							} else {
								logsimg = logsimg + "," + sc.getName();
							}
						}
					}
				}

			}
		}

		String contt = vsjm;
		String tempd;

		contt = contt.trim();
		String[] cts = contt.split("\\*");
		String logvss = "";
		if (cts.length == 7) {
			logvss = cts[2].trim();

		}
		if (logvss.length() > 0) {
			String sv;
			if (logvss.indexOf(':') != -1) {

			} else {
				String[] svss = logvss.split("\\#");
				for (int i = 0; i < svss.length; i++) {
					// 等于于0表示是视频
					if (Integer.parseInt(svss[i].substring(0, 1)) == 0) {
						String svsss = svss[i]
								.substring(svss[i].indexOf('@') + 1);
						String[] fss = svsss.split("\\|");
						for (int j = 0; j < fss.length; j++) {
							sv = fss[j];
							if (new File(Constant.FILES + File.separator + sv)
									.exists()) {
								int cur = sv.lastIndexOf(".jm");
								if (cur != -1) {
									sc = (Sucai) SqlConnect.getSqlMapInstance()
											.queryForObject(
													"sel_sc_filename_like",
													sv.substring(0, cur));
								} else {
									sc = (Sucai) SqlConnect.getSqlMapInstance()
											.queryForObject("sel_sc_filename",
													sv);
								}
								if (sc != null) {
									if (logsvideo.indexOf(sc.getName()) == -1) {
										if ("".equals(logsvideo)) {
											logsvideo = sc.getName();
										} else {
											logsvideo = logsvideo + ","
													+ sc.getName();
										}
									}
								}

							}
						}
					} else {
						String svsss = svss[i]
								.substring(svss[i].indexOf('@') + 1);
						String[] fss = svsss.split("\\|");
						for (int j = 0; j < fss.length; j++) {
							sv = fss[j];
							if (new File(Constant.FILES + File.separator + sv)
									.exists()) {

								sc = (Sucai) SqlConnect.getSqlMapInstance()
										.queryForObject("sel_sc_filename", sv);

								if (sc != null) {
									if (logsimg.indexOf(sc.getName()) == -1) {
										if ("".equals(logsimg)) {
											logsimg = sc.getName();
										} else {
											logsimg = logsimg + ","
													+ sc.getName();
										}
									}
								}
							}

						}

					}

				}
			}
		}
		String logs = "";
		if ("".equals(logsvideo)) {
			logsvideo = " ";
		}
		if ("".equals(logsimg)) {
			logsimg = " ";
		}
		logs = item.getName().replaceAll("\\|", "") + "|"
				+ logsimg.replaceAll("\\|", "") + "|"
				+ logsvideo.replaceAll("\\|", "");
		f = new File(dir + File.separator + "logsc.txt");
		oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(logs.getBytes("UTF-8"));
		oldFileWriter.close();

		String tostr = x86imgs
				+ " "
				+ x86asxad
				+ " "
				+ imgs
				+ " "
				+ asxad
				+ " jqfont.js "
				+ " tmp.txt "
				+ " jqfont2.js "
				+ " main_vs.swf "
				+ "go.html "
				+ "see.html "
				+ " index.html "
				+ " key.txt "
				+ " vsjm.txt "
				+ " "
				+ fcontent
				+ "tq.txt"
				+ "tq.html"
				+ " text.txt"
				+ " img.txt"
				+ " rss.txt time.txt time.html"
				+ " av.txt camera.txt gncj.txt hl.txt hl.html "
				+ " wtime.txt wtime.html  fbl.txt table.txt table.html vsjm2.txt logsc.txt lc.txt bg.txt " +
				  " flash.txt html.txt item.txt jp.txt vsjm3.txt app.txt code.txt 2code.txt netcamera.txt "+appstrs;

		String ourdir = Constant.FILES + File.separator + mfile
				+ File.separator;
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

		String cccontet = new Date().toString() + new Date().getTime()
				+ new Date().getTime() + new Date().toString();
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
			oldFileWriter.write(cccontet.getBytes("utf-8"));
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

		DoZip zip = new DoZip();
		zip.zip(dir, dir + ".zip");

		// 获取场景(查找场景是否存在)
		// see_scfilename_scene
		// Object obj=sm.queryForObject("see_scfilename_scene",mfile);
		if (obj == null) {
			scene = (Scene) session.get("scene");
			scene.setFilename(mfile);
			scene.setName(name);
			scene.setMcontent(mcontent);
			scene.setUrid(urid);
			scene.setTson(tson);
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
			scene.setTson(tson);
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
						len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
					}
				}
				
			}
			clen+=len;
		}
		
		item.setLen(clen);
		// 更新节目
		sm.update("upd_interactitem", item);
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
			se.setSf(sf);
			se.setTx(twidth);
			se.setTy(theight);
			se.setName(interactname);
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
		return SUCCESS;

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

	public int getVideox() {
		return videox;
	}

	public void setVideox(int videox) {
		this.videox = videox;
	}

	public int getVideoy() {
		return videoy;
	}

	public void setVideoy(int videoy) {
		this.videoy = videoy;
	}

	public int getVideowidth() {
		return videowidth;
	}

	public void setVideowidth(int videowidth) {
		this.videowidth = videowidth;
	}

	public int getVideoheight() {
		return videoheight;
	}

	public void setVideoheight(int videoheight) {
		this.videoheight = videoheight;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
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

	

	public List getScenes() {
		return scenes;
	}

	public void setScenes(List scenes) {
		this.scenes = scenes;
	}

	public String getCitykey() {
		return citykey;
	}

	public void setCitykey(String citykey) {
		this.citykey = citykey;
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

	public String getFatherurl() {
		return fatherurl;
	}

	public void setFatherurl(String fatherurl) {
		this.fatherurl = fatherurl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRsskey() {
		return rsskey;
	}

	public void setRsskey(String rsskey) {
		this.rsskey = rsskey;
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

	public String getOneurl() {
		return oneurl;
	}

	public void setOneurl(String oneurl) {
		this.oneurl = oneurl;
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

	public String getX86volofs() {
		return x86volofs;
	}

	public void setX86volofs(String x86volofs) {
		this.x86volofs = x86volofs;
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
	public String getInteractname() {
		return interactname;
	}

	public void setInteractname(String interactname) {
		this.interactname = interactname;
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
}
