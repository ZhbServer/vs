package com.vshow.control.apk;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;


import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Apk;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.ImageUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class UpApkAction implements Action {

	private String fileFileName;
	private File file;

	public String execute()  {
		
		
		try {
			ActionContext ctx = ActionContext.getContext();
			
			Map session = ctx.getSession();
			int urid = (Integer) session.get("urid");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sf.format(new Date());
			SqlMapClient sm = SqlConnect.getSqlMapInstance();
			
			fileFileName=fileFileName.replaceAll("\\'", "").replaceAll("\\@", "").replaceAll("\\#", "").replaceAll("\\$", "").replaceAll("\\%", "").replaceAll("\\^", "").replaceAll("\\*", "").replaceAll("\\'", "").replaceAll("\\[", "")
	        .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");
			Apk apk=new Apk();
	        String type = fileFileName.substring(fileFileName.lastIndexOf('.') + 1,	fileFileName.length()).trim().toLowerCase();
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			String tempf = tempname + "." + type;
			apk.setFilename(tempf);
			File temfs = new File(Constant.FILES + File.separator + tempf);
			//file.renameTo(temfs);
			//System.out.println(tempf);
			FileHandle.copy3(file.getPath(), temfs.getPath());
			apk.setName(fileFileName);
					
			apk.setSdate(DateUtil.getTime());		
			
			apk.setTitle("");
			
			sm.insert("add_apk", apk);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ServletActionContext.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		
		
			
		return SUCCESS;
		
		
		
		
	}
	
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
	public String getFileFileName() {
		return fileFileName;
	}

	public File getFile() {
		return file;
	}

}
