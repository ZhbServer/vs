package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAdTqAction implements Action {

	private String ip;
	private List list;
	private int height;
	private int width;
	private int xy_x=0;
	private int xy_y=0;
   
	

	private String sortableListSpans;
	
	private int tqtime=5;  //天气城市切换时间
	private int fresh=6;     //刷新数据时间
	private int dx=18;               //字体大小
	private String wfcolor="000000"; //字体颜色
	

	private List<ProgramWeather> sortableList=new ArrayList<ProgramWeather>();
	
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		list = sm.queryForList("see_tq_all");
		ip = Constant.IP;
		
		
		
		
		
		if(sortableListSpans==null||sortableListSpans.equals("")){}else{
			
			String slss[]=sortableListSpans.split("\\@");
			ProgramWeather pw;
			for (int i = 0; i < slss.length; i++) {
				String sllsss[]=slss[i].split("\\--");
				if(sllsss.length==2){
					pw=new ProgramWeather();
					pw.setWeatherCity(sllsss[0]);
					pw.setWeatherQtime(Integer.parseInt(sllsss[1]));
					sortableList.add(pw);
				}
			}
		}
	    return SUCCESS;
	}
	
	
	public int getTqtime() {
		return tqtime;
	}
	public void setTqtime(int tqtime) {
		this.tqtime = tqtime;
	}
	public int getFresh() {
		return fresh;
	}
	public void setFresh(int fresh) {
		this.fresh = fresh;
	}
	public int getDx() {
		return dx;
	}
	public void setDx(int dx) {
		this.dx = dx;
	}
	public String getWfcolor() {
		return wfcolor;
	}
	public void setWfcolor(String wfcolor) {
		this.wfcolor = wfcolor;
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

	private float sf;
	
	public List getList() {
			return list;
	}

	public String getIp() {
			return ip;
	}
	
	public String getSortableListSpans() {
		return sortableListSpans;
	}
	public void setSortableListSpans(String sortableListSpans) {
		this.sortableListSpans = sortableListSpans;
	}
	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setList(List list) {
		this.list = list;
	}

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}
	
	
	public List<ProgramWeather> getSortableList() {
		return sortableList;
	}
	public void setSortableList(List<ProgramWeather> sortableList) {
		this.sortableList = sortableList;
	}
}
