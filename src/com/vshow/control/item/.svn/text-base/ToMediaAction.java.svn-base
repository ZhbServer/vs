package com.vshow.control.item;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.program.ProgramComplexMediaManager;

public class ToMediaAction implements Action {

	private int height;
	private int width;
    private String title="";
    private int sspeed=3;
    private int stype=0;
    private int xy_x=0;
	private int xy_y=0;
	
	


	private String yxSucaiListJson="";

	public String execute() throws Exception {
		String titles[]=title.split("\\-");
		if(titles.length==2){
			sspeed=Integer.parseInt(titles[1]);
			stype=Integer.parseInt(titles[0]);
		}
		
		if(!yxSucaiListJson.equals("null")){
			//播放列表数据源
			if(!yxSucaiListJson.equals("")){
				ProgramComplexMediaManager pcmms=(ProgramComplexMediaManager)JSONObject.toBean(JSONObject.fromObject(yxSucaiListJson), ProgramComplexMediaManager.class);
				
				JSONArray jsonArr = JSONArray.fromObject(pcmms.getmMediaList());
				
				yxSucaiListJson=jsonArr.toString();
				
				
				
			}
			
			
		}
		
		return SUCCESS;
	}

	
	public String getYxSucaiListJson() {
		return yxSucaiListJson;
	}



	public void setYxSucaiListJson(String yxSucaiListJson) {
		this.yxSucaiListJson = yxSucaiListJson;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSspeed() {
		return sspeed;
	}

	public void setSspeed(int sspeed) {
		this.sspeed = sspeed;
	}

	public int getStype() {
		return stype;
	}

	public void setStype(int stype) {
		this.stype = stype;
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

}
