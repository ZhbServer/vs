package com.vshow.control.item.share;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ItemShare;
import com.vshow.control.data.ScShare;
import com.vshow.control.tool.SqlConnect;

public class DelShareSucaiAction implements Action {

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
		for (int j = 0; j < shareArry.length; j++) {
			String [] share;
			String newshare="";
			ItemShare itemshare = new ItemShare();
			itemshare.setTkey(tkey);
			itemshare.setUserid(urid);
			itemshare.setItemid(Integer.parseInt(itemid));
			itemshare.setShareid(shareArry[j]);
			ItemShare old_itemshare = (ItemShare)SqlConnect.getSqlMapInstance().queryForObject("sel_all_item_shareid",itemshare);
			if(old_itemshare != null && old_itemshare.getShareid().length() > 0){
				share = old_itemshare.getShareid().split(",");
				for (int k = 0; k < share.length; k++) {
					if(!share[k].equals(shareArry[j])){
						newshare += share[k]+",";
					}
				}
				if(newshare.length()>1){//当前shareid 包含修改记录，等于shareid删除记录
					ItemShare up_itemshare = new ItemShare();
					up_itemshare.setId(old_itemshare.getId());
					up_itemshare.setShareid(newshare.substring(0,newshare.length()-1));
					SqlConnect.getSqlMapInstance().update("up_item_scshare",up_itemshare);
				}else{
					SqlConnect.getSqlMapInstance().delete("del_item_scshare",old_itemshare.getId());
				}
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
