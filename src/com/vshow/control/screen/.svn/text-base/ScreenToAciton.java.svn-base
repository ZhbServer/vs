package com.vshow.control.screen;



import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ScreenToAciton implements Action {

	private int posx;
	private int posy;
	private int width;
	private int height;
	private int stime;
	private String name;
	private String type;

	public void setType(String type) {
		this.type = type;
	}

	public void setPosx(int posx) {
		this.posx = posx;
	}

	public void setPosy(int posy) {
		this.posy = posy;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public void setStime(int stime) {
		this.stime = stime;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		String fname = Long.toString(System.currentTimeMillis()) + "." + type;
		Screen screen = new Screen();
		screen.setFilename(fname);
		screen.setHeight(height);
		screen.setName(name);
		screen.setPosx(posx);
		screen.setPosy(posy);
		screen.setStime(stime);
		screen.setType(type);
		screen.setWidth(width);
		sm.insert("in_on_scre", screen);
		try {
			BufferedImage screenshot = (new Robot())
					.createScreenCapture(new Rectangle(posx, posy, width,
							height));
			File f = new File(Constant.SCREEN + File.separator + Constant.JIATOTAL
					+ Constant.TT + fname);
			ImageIO.write(screenshot, type, f);
		} catch (Exception ex) {
		}
		Constant.TOTAL = Constant.TT;
		return SUCCESS;
	}

}
