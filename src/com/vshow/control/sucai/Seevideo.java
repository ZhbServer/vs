package com.vshow.control.sucai;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;
import com.vshow.control.tool.SqlConnect;

public class Seevideo implements Action {

	private String name; // 素材名称
	private String size; // 大小
	private String sdate; // 上传时间
	private int stime; // 时长
	private String username; // 上传用户
	private String sharename = ""; // 共享对象
	
	private int storageType=0;     //0本地服务器   1乐视云

	private List<String> shareList;
	private String fname;
	private int lbyl;

	private int scid;

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		String shareId = "";
		Sucai sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
				"get_sc_all_id", scid);

		name = sc.getName();
		size = sc.getSize();
		sdate = sc.getSdate();
		stime = sc.getStime();
		fname = sc.getFilename().substring(0, sc.getFilename().lastIndexOf('.')) + "_.flv";
		username = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_user_name_id", sc.getUrid());

		shareList = (List<String>) SqlConnect.getSqlMapInstance().queryForList(
				"sel_sc_share_id", scid);
		if (shareList.size() > 0) {
			for (int i = 0; i < shareList.size(); i++) {
				shareId += shareList.get(i) + ",";
			}

			String[] shareArry = shareId.split(",");
			String name = "";
			for (int i = 0; i < shareArry.length; i++) {
				name = (String) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_user_name_id", Integer.parseInt(shareArry[i]));
				sharename += name + ",";
			}
			sharename = sharename.substring(0, sharename.length() - 1);
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
		//获取当前素材的存储方式
		SucaiCloud sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param", sc.getFilename());
		if(sCloud==null){
			storageType=0;
		}else{
			storageType=sCloud.getCloudtype();
		}
		
		return SUCCESS;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSharename() {
		return sharename;
	}

	public void setSharename(String sharename) {
		this.sharename = sharename;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getScid() {
		return scid;
	}

	public void setScid(int scid) {
		this.scid = scid;
	}

	public int getLbyl() {
		return lbyl;
	}

	public void setLbyl(int lbyl) {
		this.lbyl = lbyl;
	}
	
	public int getStorageType() {
		return storageType;
	}

	public void setStorageType(int storageType) {
		this.storageType = storageType;
	}

}
