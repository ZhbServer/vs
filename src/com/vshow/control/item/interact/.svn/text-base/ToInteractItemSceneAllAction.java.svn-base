package com.vshow.control.item.interact;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToInteractItemSceneAllAction implements Action {

	private int iid;
	private List scenes;
	
	@Override
	public String execute() throws Exception {
		scenes = SqlConnect.getSqlMapInstance().queryForList("sel_item_interact_allscene", iid); 
		return SUCCESS;
	}
	
	
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public List getScenes() {
		return scenes;
	}
	public void setScenes(List scenes) {
		this.scenes = scenes;
	}
	

}
