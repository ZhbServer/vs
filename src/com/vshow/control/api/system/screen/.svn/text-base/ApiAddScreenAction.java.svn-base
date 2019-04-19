package com.vshow.control.api.system.screen;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Screen;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.rss.Rssxml;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;

import com.vshow.control.tool.SqlConnect;

/**
 * 新增截屏
 * @param account账号
 * @param password 密码
 * @param name 名称
 * @param posx X坐标
 * @param posy Y坐标
 * @param width 宽
 * @param height 高
 * @param stime 刷新时间
 * @param type 类型
 * @author cyn
 * @version 6.1 API接口
 * 
 */
public class ApiAddScreenAction implements Action {
	
	private String password;
	private String account;
	private String content;
	
	private String name;
	private int posx;
	private int posy;
	private int width;
	private int height;
	private int stime;
	private String type;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				Screen screen = new Screen();
				screen.setName(name);
				screen.setPosx(posx);
				screen.setPosy(posy);
				screen.setWidth(width);
				screen.setHeight(height);
				screen.setStime(stime);
				screen.setType(type);
				screen.setFilename( Long.toString(System.currentTimeMillis())+"."+screen.getType());
				try{
					SqlConnect.getSqlMapInstance().insert("add_screen", screen);
					LogHandle.insertTheLog(LogType.type65, user.getId(),Constant.LOCAL.getA00196()+":" + screen.getName(), 1,1);
					
					BufferedImage screenshot = (new Robot()).createScreenCapture(new Rectangle(screen.getPosx(), screen.getPosy(), screen.getWidth(), screen.getHeight()));
					File f = new File(Constant.SCREEN + File.separator + Constant.JIATOTAL+ Constant.TT + screen.getFilename());
					ImageIO.write(screenshot, screen.getType(), f);
					Constant.TOTAL = Constant.TT;
					
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);

		content = jsons.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPosx() {
		return posx;
	}

	public void setPosx(int posx) {
		this.posx = posx;
	}

	public int getPosy() {
		return posy;
	}

	public void setPosy(int posy) {
		this.posy = posy;
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

	public int getStime() {
		return stime;
	}

	public void setStime(int stime) {
		this.stime = stime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
