package com.vshow.control.item;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;

import javax.imageio.ImageIO;



import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class SfSceneBjAction implements Action {

	
	private float sf;
	private String bfile;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		Scene se = (Scene) session.get("scene");
		
		float sfx = sf * se.getTx();
		float sfy = sf * se.getTy();
		File file = new File(Constant.FILES + File.separator +se.getFilename()+File.separator+bfile);
		BufferedImage bi = ImageIO.read(file);
		String sbfile = "";
		
		if (sf==0.9f) {
			sbfile = "9_" + bfile;
			
		} else if (sf==0.8f) {
			sbfile = "8_" + bfile;
			
		} else if (sf==0.7f) {
			sbfile = "7_" + bfile;
			
		} else if (sf==0.6f) {
			sbfile = "6_" + bfile;
			
		} else if (sf==0.5f) {
			sbfile = "5_" + bfile;
			
		} else if (sf==0.4f) {
			sbfile = "4_" + bfile;
			
		} else if (sf==0.3f) {
			sbfile = "3_" + bfile;
			
		} else if (sf==0.2f) {
			sbfile = "2_" + bfile;
			
		} else if (sf==0.1f) {
			sbfile = "1_" + bfile;
			
		}
		
		// 查找这个文件是否存在
		File cfile = new File(Constant.FILES + File.separator +se.getFilename()+File.separator+sbfile);
		if (!cfile.exists()) {
			FileOutputStream out = new FileOutputStream(Constant.FILES
					+ File.separator + se.getFilename() + File.separator
					+ sbfile);
			BufferedImage image = new BufferedImage((int) sfx, (int) sfy,
					BufferedImage.TYPE_INT_RGB);
			Graphics graphics = image.createGraphics();
			graphics.drawImage(bi.getScaledInstance((int) sfx, (int) sfy,
					Image.SCALE_SMOOTH), 0, 0, null);
			graphics.dispose();
			ImageIO.write(image, "png", out);
			out.flush();
			out.close();

		}
		return SUCCESS;
	}


	public float getSf() {
		return sf;
	}




	public void setSf(float sf) {
		this.sf = sf;
	}


	public String getBfile() {
		return bfile;
	}


	public void setBfile(String bfile) {
		this.bfile = bfile;
	}



}
