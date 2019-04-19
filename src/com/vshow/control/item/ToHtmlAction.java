package com.vshow.control.item;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.program.ProgramHtml;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.tool.Local;

public class ToHtmlAction implements Action {

	private String time="0";
	private String htm="";
	private int gun=0;
	
	

	private int xy_x=0;
	private int xy_y=0;
	private int width;
	private int height;
	
	
	
	private int html_show=0;
   
	private String sortableListSpans="";
	
	
	
	private int htime=5;
	
	

	private List<ProgramHtml> sortableList=new ArrayList<ProgramHtml>();
	
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        if(time.equals("")){
        	time="0";
        } 
        
        
        if(sortableListSpans==null||sortableListSpans.equals("")){}else{
        	sortableListSpans=unescape(sortableListSpans);
			String slss[]=sortableListSpans.split("\\@");
			ProgramHtml ph;
			for (int i = 0; i < slss.length; i++) {
				String sllsss[]=slss[i].split("\\--");
				if(sllsss.length==4){
					ph=new ProgramHtml();
					//sllsss[0]=sllsss[0].replaceAll("amp;", "");
					ph.setHtmlUrl(sllsss[0]);
					ph.setHtmlQtime(Integer.parseInt(sllsss[1]));
					ph.setmShowNavigation(Integer.parseInt(sllsss[2]));
					ph.setmShowPCWeb(Integer.parseInt(sllsss[3]));
					sortableList.add(ph);
				}
			}
		}


		return SUCCESS;
	}

	public String unescape(String src) {
		  StringBuffer tmp = new StringBuffer();
		  tmp.ensureCapacity(src.length());
		  int lastPos = 0, pos = 0;
		  char ch;
		  while (lastPos < src.length()) {
		   pos = src.indexOf("%", lastPos);
		   if (pos == lastPos) {
		    if (src.charAt(pos + 1) == 'u') {
		     ch = (char) Integer.parseInt(src
		       .substring(pos + 2, pos + 6), 16);
		     tmp.append(ch);
		     lastPos = pos + 6;
		    } else {
		     ch = (char) Integer.parseInt(src
		       .substring(pos + 1, pos + 3), 16);
		     tmp.append(ch);
		     lastPos = pos + 3;
		    }
		   } else {
		    if (pos == -1) {
		     tmp.append(src.substring(lastPos));
		     lastPos = src.length();
		    } else {
		     tmp.append(src.substring(lastPos, pos));
		     lastPos = pos;
		    }
		   }
		  }
		  return tmp.toString();
		 }
	
	public int getHtime() {
		return htime;
	}

	public void setHtime(int htime) {
		this.htime = htime;
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

	public void setHtm(String htm) {
		this.htm = htm;
	}

	public int getGun() {
		return gun;
	}

	public void setGun(int gun) {
		this.gun = gun;
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

	public int getHtml_show() {
		return html_show;
	}

	public void setHtml_show(int html_show) {
		this.html_show = html_show;
	}

	public String getSortableListSpans() {
		return sortableListSpans;
	}

	public void setSortableListSpans(String sortableListSpans) {
		this.sortableListSpans = sortableListSpans;
	}

	public List<ProgramHtml> getSortableList() {
		return sortableList;
	}

	public void setSortableList(List<ProgramHtml> sortableList) {
		this.sortableList = sortableList;
	}

}
