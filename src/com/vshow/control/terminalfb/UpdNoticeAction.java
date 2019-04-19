package com.vshow.control.terminalfb;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Notice;
import com.vshow.control.tool.SqlConnect;

public class UpdNoticeAction extends ActionSupport {

	private int nid;
	
	private String fonttitle;
	private String fontcontent;
	private int fontcolor;
	private int fontsize;
	private int fonttype;
	private int backcolor;
	private int fontspeed;
	private int up;
	private String sdate;
	private String edate;
	
	private String fontcontent2;
	private int fontcolor2;
	private int fontsize2;
	private int fonttype2;
	private int backcolor2;
	private int fontspeed2;
	private int up2;
	private String noticePostion="0"; //隐藏双通知  第二个通知 upmove 参数作为 新通知的 位置  1 顶部0.5 中部 0 底部

	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();

		//添加通知
		Notice nc = new Notice();
		nc.setFonttitle(fonttitle);
		nc.setFontcontent(fontcontent);
		nc.setFontcolor(fontcolor);
		nc.setFontsize(fontsize);
		nc.setFonttype(fonttype);
		nc.setBackcolor(backcolor);
		nc.setFontspeed(fontspeed);
		nc.setUp2(noticePostion);
		nc.setUp(up);
		nc.setSdate(sdate);
		nc.setEdate(edate);
		if(fontcontent2!=null&&!"".equals(fontcontent2)){
			nc.setFontcontent2(fontcontent2);
			nc.setFontcolor2(fontcolor2);
			nc.setFontsize2(fontsize2);
			nc.setFonttype2(fonttype2);
			nc.setBackcolor2(backcolor2);
			nc.setFontspeed2(fontspeed2);
			nc.setUp2("");
			
		}
		nc.setId(nid);
		sm.insert("update_notice", nc);
		
		return SUCCESS;
	}

	public String getNoticePostion() {
		return noticePostion;
	}

	public void setNoticePostion(String noticePostion) {
		this.noticePostion = noticePostion;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getFonttitle() {
		return fonttitle;
	}

	public void setFonttitle(String fonttitle) {
		this.fonttitle = fonttitle;
	}

	public String getFontcontent() {
		return fontcontent;
	}

	public void setFontcontent(String fontcontent) {
		this.fontcontent = fontcontent;
	}

	public int getFontcolor() {
		return fontcolor;
	}

	public void setFontcolor(int fontcolor) {
		this.fontcolor = fontcolor;
	}

	public int getFontsize() {
		return fontsize;
	}

	public void setFontsize(int fontsize) {
		this.fontsize = fontsize;
	}

	public int getFonttype() {
		return fonttype;
	}

	public void setFonttype(int fonttype) {
		this.fonttype = fonttype;
	}

	public int getBackcolor() {
		return backcolor;
	}

	public void setBackcolor(int backcolor) {
		this.backcolor = backcolor;
	}

	public int getFontspeed() {
		return fontspeed;
	}

	public void setFontspeed(int fontspeed) {
		this.fontspeed = fontspeed;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getFontcontent2() {
		return fontcontent2;
	}

	public void setFontcontent2(String fontcontent2) {
		this.fontcontent2 = fontcontent2;
	}

	public int getFontcolor2() {
		return fontcolor2;
	}

	public void setFontcolor2(int fontcolor2) {
		this.fontcolor2 = fontcolor2;
	}

	public int getFontsize2() {
		return fontsize2;
	}

	public void setFontsize2(int fontsize2) {
		this.fontsize2 = fontsize2;
	}

	public int getFonttype2() {
		return fonttype2;
	}

	public void setFonttype2(int fonttype2) {
		this.fonttype2 = fonttype2;
	}

	public int getBackcolor2() {
		return backcolor2;
	}

	public void setBackcolor2(int backcolor2) {
		this.backcolor2 = backcolor2;
	}

	public int getFontspeed2() {
		return fontspeed2;
	}

	public void setFontspeed2(int fontspeed2) {
		this.fontspeed2 = fontspeed2;
	}

	public int getUp2() {
		return up2;
	}

	public void setUp2(int up2) {
		this.up2 = up2;
	}
}