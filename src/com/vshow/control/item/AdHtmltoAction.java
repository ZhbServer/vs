package com.vshow.control.item;
import com.opensymphony.xwork.ActionSupport;
public class AdHtmltoAction extends ActionSupport {

	private String info;
	private String time="0";
	private String htm="";
	private int gun;
	private int width;
	private int height;
	private int xy_x=0;
	private int xy_y=0;
	
	//private String suo;
	//private String ml;
	private int gao;
	private int html_show=0;


	public String execute() throws Exception {

		//outname = htm + "|" + time + "|" + gun + "_" + gao+"_"+width+"_"+height;
		info = htm + "|" + time + "|" + gun + "_1_" + gao+"|"+width+"_"+height+"|"+xy_x+"_"+xy_y+"|"+html_show;;
		return SUCCESS;
	}



	public int getHtml_show() {
		return html_show;
	}



	public void setHtml_show(int html_show) {
		this.html_show = html_show;
	}



	public void setGao(int gao) {
		this.gao = gao;
	}
	
	

	public void setHtm(String htm) {
		this.htm = htm;
	}


	public int getWidth() {
		return width;
	}





	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public String getHtm() {
		return htm;
	}



	public int getGao() {
		return gao;
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
	public int getGun() {
		return gun;
	}
	public void setGun(int gun) {
		this.gun = gun;
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

}
