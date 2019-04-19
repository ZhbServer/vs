package com.vshow.control.screen;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Screen;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;

import com.vshow.control.tool.SqlConnect;

public class AddScreenAction implements Action {
	private Screen screen;

	public Screen getScreen() {
		return screen;
	}

	public void setScreen(Screen screen) {
		this.screen = screen;
	}

	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		screen.setFilename( Long.toString(System.currentTimeMillis())+"."+screen.getType());
		SqlConnect.getSqlMapInstance().insert("add_screen", screen);
		
		LogHandle.insertTheLog(LogType.type65, urid,Constant.LOCAL.getA00196()+":" + screen.getName(), 1,1);
		
		BufferedImage screenshot = (new Robot()).createScreenCapture(new Rectangle(screen.getPosx(), screen.getPosy(), screen.getWidth(), screen.getHeight()));
		File f = new File(Constant.SCREEN + File.separator + Constant.JIATOTAL+ Constant.TT + screen.getFilename());
		ImageIO.write(screenshot, screen.getType(), f);
		Constant.TOTAL = Constant.TT;
		return SUCCESS;
	}

}
