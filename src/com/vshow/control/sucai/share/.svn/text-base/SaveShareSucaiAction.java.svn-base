package com.vshow.control.sucai.share;

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

import net.coobird.thumbnailator.Thumbnails;


import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.ScShare;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;

import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.ImageUtil;
import com.vshow.control.tool.SqlConnect;

public class SaveShareSucaiAction implements Action {

	private String scid;
	private String shareid;
	
	private int id; // 当前页数
	private int pagetype=9;  //页码类型(9,20,30)
   
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		shareid = shareid.substring(0,shareid.length()-1);
		
		String [] scArry = scid.split(",");
		String [] shareArry = shareid.split(",");
		String shareStr = "";
		for (int i = 0; i < scArry.length; i++) {
			for (int j = 0; j < shareArry.length; j++) {
				ScShare scshare = new ScShare();
				scshare.setTkey(tkey);
				scshare.setUserid(urid);
				scshare.setScid(Integer.parseInt(scArry[i]));
				scshare.setShareid(shareArry[j]);
				int count = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_scshare_exist",scshare);
				if(count == 0){
					shareStr += shareArry[j] +",";
				}
			}
			if(shareStr.length()>1){
				ScShare scshare = new ScShare();
				scshare.setTkey(tkey);
				scshare.setUserid(urid);
				scshare.setScid(Integer.parseInt(scArry[i]));
				scshare.setShareid(shareStr.substring(0,shareStr.length()-1));
				SqlConnect.getSqlMapInstance().insert("add_share",scshare);
				shareStr = "";
			}
		}
		
		return SUCCESS;
		
	}

	public String getScid() {
		return scid;
	}

	public void setScid(String scid) {
		this.scid = scid;
	}

	public String getShareid() {
		return shareid;
	}

	public void setShareid(String shareid) {
		this.shareid = shareid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
