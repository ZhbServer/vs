package com.vshow.control.item;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Scene;
import com.vshow.control.data.User;

import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToSeeItemInfoAction implements Action {

	private int itemid;
	private String name; // 节目名
	private String sdate; // 创建日期
	private int stime; // 节目时长
	private int ocheck; // 是否审核
	private String size; // 节目大小

	private User user; // 用户
	private Fbl fbl; // 分辨率
	private Scene scene; // 节目参数
	
	private int lbyl;
	private String sharename=""; //共享对象

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		List<String> shareList;
		String shareId = "";
		Item item = (Item) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_item_all_id", itemid);
		name = item.getName();
		sdate = item.getSdate();
		stime = item.getStime();
		ocheck = item.getOcheck();
		getItemSize(item);
		size = item.getSize();
		
		if(item != null){
			if(item.getUserid() != 0){
				user = (User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id",item.getUserid());
			}
			if(item.getFblid() != 0){
				fbl = (Fbl)SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id",item.getFblid());
			}
			if(item.getSceneid() != 0){
				scene = (Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_all_id",item.getSceneid());
			}
		}
		
		shareList = (List<String>)SqlConnect.getSqlMapInstance().queryForList("sel_item_share_id",itemid);
		if(shareList.size() > 0){
			for (int i = 0; i < shareList.size(); i++) {
				shareId += shareList.get(i)+",";
			}
			
			String [] shareArry = shareId.split(",");
			String name = "";
			for (int i = 0; i < shareArry.length; i++) {
				name = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_user_name_id",Integer.parseInt(shareArry[i]));
				sharename += name+",";
			}
			sharename = sharename.substring(0,sharename.length()-1);
		}
		
		
		if(shareList.size() > 0){
			for (int i = 0; i < shareList.size(); i++) {
				String [] arr = shareList.get(i).split(",");
				for (int j = 0; j < arr.length; j++) {
					if(arr[j].equals(String.valueOf(uid))){
						lbyl = 1;
					}
				}
			}
		}
		if(lbyl != 1){
			lbyl = 0;
		}
		return SUCCESS;
	}

	public void getItemSize(Item item) {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		float flen = (float) item.getLen() / 1024 / 1024;
		item.setSize(dcmFmt.format(flen));
	}
	
	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public int getStime() {
		return stime;
	}

	public void setStime(int stime) {
		this.stime = stime;
	}

	public int getOcheck() {
		return ocheck;
	}

	public void setOcheck(int ocheck) {
		this.ocheck = ocheck;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Fbl getFbl() {
		return fbl;
	}

	public void setFbl(Fbl fbl) {
		this.fbl = fbl;
	}

	public Scene getScene() {
		return scene;
	}

	public void setScene(Scene scene) {
		this.scene = scene;
	}

	public String getSharename() {
		return sharename;
	}

	public void setSharename(String sharename) {
		this.sharename = sharename;
	}

	public int getLbyl() {
		return lbyl;
	}

	public void setLbyl(int lbyl) {
		this.lbyl = lbyl;
	}
	
}
