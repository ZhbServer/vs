package com.vshow.control.item;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;


import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdFlashtoAction implements Action {


	private String info;
	private float sf;
	private int width;
	private int height;
	private int xy_x;
	private int xy_y;
	private String filenames;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Scene se = (Scene) session.get("scene");
		// 通过背景id找素材的文件名
		String fileName = (String) SqlConnect.getSqlMapInstance()
		.queryForObject("sel_sc_filename2", Integer.parseInt(filenames));
		String ourdir = Constant.FILES + File.separator + se.getFilename() + File.separator;
		String alldir = Constant.FILES + File.separator;
		String ourfi = "";
		String allfi = "";
		String cufi = "";
		boolean dot = false;
		cufi = fileName.trim();
		ourfi = ourdir + cufi;
		allfi = alldir + cufi;
		if (new File(ourfi).exists()) {
			dot = true;
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
				dot = true;
			} catch (Exception e) {

			}
		}
		if(dot)
		{
			info = fileName + "-" + width + "-" + height+"-"+xy_x+"-"+xy_y+"-"+filenames;
		}
		else
		{
			info="";
		}
		return SUCCESS;
	}

	

	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
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



	public String getFilenames() {
		return filenames;
	}



	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}



	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
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

}
