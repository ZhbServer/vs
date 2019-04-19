package com.vshow.control.item.touch;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToTouchSceneAction implements Action {

	private List<Item> listscene; // 节目场景集合
	
	
	private String editTouchtResources;

	public String getEditTouchtResources() {
		return editTouchtResources;
	}

	public void setEditTouchtResources(String editTouchtResources) {
		this.editTouchtResources = editTouchtResources;
	}

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		//获取当前用户
		int uid = (Integer) session.get("urid");

		
		InteractItem tempInteractItem=new InteractItem();
		tempInteractItem.setUserid(uid);
		tempInteractItem.setOcheck(1);
		
		listscene=SqlConnect.getSqlMapInstance().queryForList("sel_interact_item_filename_all", tempInteractItem);
		
		return SUCCESS;

	}

	public List<Item> getListscene() {
		return listscene;
	}

	public void setListscene(List<Item> listscene) {
		this.listscene = listscene;
	}

	

	// 显示截取名字(素材)
	/*
	 * public void subStringListGroup(List<Groups> list) { for (Groups gs :
	 * list) { int sName = gs.getName().length(); if (sName >= 10) {
	 * gs.setNamesub(gs.getName().substring(0, 8) + "..."); } else {
	 * gs.setNamesub(gs.getName()); } } }
	 */

}
