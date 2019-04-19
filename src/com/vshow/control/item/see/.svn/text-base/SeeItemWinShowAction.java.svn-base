package com.vshow.control.item.see;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.SqlConnect;

public class SeeItemWinShowAction extends ActionSupport {
	
	private String filename;
	private Scene scene;
	
	@Override
	public String execute() throws Exception {
		
		scene=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scfilename_scene", filename);
		
		return SUCCESS;
	
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Scene getScene() {
		return scene;
	}
	public void setScene(Scene scene) {
		this.scene = scene;
	}
	

}
