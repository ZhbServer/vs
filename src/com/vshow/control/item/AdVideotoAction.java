package com.vshow.control.item;


import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdVideotoAction extends ActionSupport {

	private String mfile;
	private String info;


	private int width;
	private int height;
	private String filenames;
	private String names;
	private String url="";
	private int qie;
	private float sf;
	private String avs ="";
	private String ssshow="";
	private int volof=0;
	private int xy_x=0;
	private int xy_y=0;


	private String jsonData;   //播放列表数据


	public String execute() throws Exception {
		if (sf == 0) {
			sf = 1;
		}
		
		JSONObject jsonobject = JSONObject.fromObject(jsonData);
		ProgramComplexMediaManager programComplexMediaManager= (ProgramComplexMediaManager)JSONObject.toBean(jsonobject,ProgramComplexMediaManager.class);
		
		

		String ourdir = Constant.FILES + File.separator + mfile+ File.separator;
		String alldir = Constant.FILES + File.separator;
	
		String allfi = "";
		String ourfi = "";
		
		MorphDynaBean md;
		
		List mMediaList=programComplexMediaManager.getmMediaList();
		for (int i = 0; i < mMediaList.size(); i++) {
			md=(MorphDynaBean)mMediaList.get(i);
			
			Integer type=(Integer)md.get("type");
			
			if(type==1){

				Sucai s = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_sc_filename", md.get("path"));
				ourfi = ourdir + s.getFilename();
				allfi = alldir + s.getFilename();
				
				

				if (new File(ourfi).exists()) {
					//return;
				} else if (new File(allfi).exists()) {
					try {
						FileInputStream fis = new FileInputStream(allfi);
						FileOutputStream fos = new FileOutputStream(ourfi);
						byte[] buff = new byte[1024];
						int readed = -1;
						while ((readed = fis.read(buff)) > 0)
							fos.write(buff, 0, readed);
						fis.close();
						fos.close();
					
					} catch (Exception e) {
					}
				}
			}
		
			
		}
		
		
		
		info=jsonData;
		return SUCCESS;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getQie() {
		return qie;
	}

	public void setQie(int qie) {
		this.qie = qie;
	}

	// public int[] getZd() {
	// return zd;
	// }
	//
	// public void setZd(int[] zd) {
	// this.zd = zd;
	// }

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}

	public String getAvs() {
		return avs;
	}

	public void setAvs(String avs) {
		this.avs = avs;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getSsshow() {
		return ssshow;
	}

	public void setSsshow(String ssshow) {
		this.ssshow = ssshow;
	}

	public int getVolof() {
		return volof;
	}

	public void setVolof(int volof) {
		this.volof = volof;
	}
	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}

	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}
	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

}
