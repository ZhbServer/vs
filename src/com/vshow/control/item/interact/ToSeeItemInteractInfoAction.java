package com.vshow.control.item.interact;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

public class ToSeeItemInteractInfoAction implements Action {

	private int itemId;
	private String name; // 节目名
	private String sdate; // 创建日期
	private int ocheck; // 是否审核
	private String size; // 节目大小
	private String filename; //节目文件
    private int itemType=2;  //节目类型  1为普通节目  2为互动节目 
	private String lable;//节目标签
	private User user; // 用户
	private Fbl fbl; // 分辨率
	
	private int lbyl;
	private String sharename=""; //共享对象

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		List<String> shareList;
		String shareId = "";
		InteractItem item = (InteractItem) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_id_interactitem", itemId);
		name = item.getName();
		sdate = item.getSdate();
		ocheck = item.getOcheck();
		getItemSize(item);
		size = item.getSize();
		lable=item.getLable();
		if(item != null){
			if(item.getUserid() != 0){
				user = (User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id",item.getUserid());
			}
			if(item.getFblid() != 0){
				fbl = (Fbl)SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id",item.getFblid());
			}
			filename = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename_id",item.getId());
		}
		
		shareList = (List<String>)SqlConnect.getSqlMapInstance().queryForList("sel_interact_item_share_id",itemId);
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

	public void getItemSize(InteractItem item) {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		float flen = (float) item.getLen() / 1024 / 1024;
		item.setSize(dcmFmt.format(flen));
	}
	
	public String getLable() {
		return lable;
	}

	public void setLable(String lable) {
		this.lable = lable;
	}

	public int getItemType() {
		return itemType;
	}

	public void setItemType(int itemType) {
		this.itemType = itemType;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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
