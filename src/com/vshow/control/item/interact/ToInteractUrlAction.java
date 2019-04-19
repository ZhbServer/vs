package com.vshow.control.item.interact;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToInteractUrlAction extends ActionSupport {
	private int iid;
	private List scenes;


	private String interacturl;   //当前场景链接
	private String mfile;
	private String selfname="";      //当前链接场景名  
	private String selffilename="";  //当前链接filename
	private String stype="";         //跳转类型   scenetype,apptype
	private String apppack="";       //包名



	

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        int uid = (Integer) session.get("urid");
        InteractItem item = new InteractItem();

		
		// 节目iid
		InteractItem interactitem = (InteractItem) session.get("interactitem");
		if (interactitem != null) {
			//获取当前节目下全部场景
			scenes = SqlConnect.getSqlMapInstance().queryForList("sel_item_interact_allscene", interactitem.getId()); 
		}
		
		Scene tempscene = (Scene) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_scene_filenames", interacturl);
		
		if (tempscene != null) {
			selfname = tempscene.getName();
			selffilename=tempscene.getFilename();
		}
		
		
		
		
		return SUCCESS;
	}

	public String getApppack() {
		return apppack;
	}

	public void setApppack(String apppack) {
		this.apppack = apppack;
	}
	
	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
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

	

	public String getInteracturl() {
		return interacturl;
	}

	public void setInteracturl(String interacturl) {
		this.interacturl = interacturl;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public String getSelfname() {
		return selfname;
	}

	public void setSelfname(String selfname) {
		this.selfname = selfname;
	}

	public String getSelffilename() {
		return selffilename;
	}

	public void setSelffilename(String selffilename) {
		this.selffilename = selffilename;
	}
}
