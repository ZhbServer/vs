package com.vshow.control.item.share;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ItemShare;
import com.vshow.control.tool.SqlConnect;

public class SaveShareSucaiAction implements Action {

	private String itemid;
	private String shareid;
	
	private int id; // 当前页数
	private int pagetype=10;  //页码类型(9,20,30)
   
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		shareid = shareid.substring(0,shareid.length()-1);
		
		String [] shareArry = shareid.split(",");
		String shareStr = "";
			for (int j = 0; j < shareArry.length; j++) {
				ItemShare itemshare = new ItemShare();
				itemshare.setTkey(tkey);
				itemshare.setUserid(urid);
				itemshare.setItemid(Integer.parseInt(itemid));
				itemshare.setShareid(shareArry[j]);
				int count = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_itemshare_exist",itemshare);
				if(count == 0){
					shareStr += shareArry[j] +",";
				}
			if(shareStr.length()>1){
				ItemShare itemshare1 = new ItemShare();
				itemshare1.setTkey(tkey);
				itemshare1.setUserid(urid);
				itemshare1.setItemid(Integer.parseInt(itemid));
				itemshare1.setShareid(shareStr.substring(0,shareStr.length()-1));
				SqlConnect.getSqlMapInstance().insert("add_item_share",itemshare1);
				shareStr = "";
			}
		}
		
		return SUCCESS;
		
	}

	
	public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public String getShareid() {
		return shareid;
	}

	public void setShareid(String shareid) {
		this.shareid = shareid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
