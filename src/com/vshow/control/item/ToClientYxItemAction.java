package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;
import com.vshow.control.tool.SqlConnect;

public class ToClientYxItemAction extends ActionSupport {
	private String itemsids;
	private List<Item> items=new ArrayList<Item>();
	
	@Override
	public String execute() throws Exception {
		/** 获取节目**/
		String itemids_s[] =itemsids.split("\\_") ;
		if (itemids_s.length > 0) {
			Item tempItem;
			
			for (int i = 0; i < itemids_s.length; i++) {
				tempItem=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_all_id",Integer.parseInt(itemids_s[i]));
				items.add(tempItem);
			}
			
		
		}	
		return SUCCESS;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public String getItemsids() {
		return itemsids;
	}
	public void setItemsids(String itemsids) {
		this.itemsids = itemsids;
	}
}
