package com.vshow.control.item;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Client;
import com.vshow.control.data.ItemEditHistory;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ItemEditHistoryAction implements Action {

	private int itemId;     //节目id
	private List<ItemEditHistory> itemEditHistoryList;
	private int itemType;   //节目类型
	@Override
	public String execute() throws Exception {
	
		ItemEditHistory itemEditHistory=new ItemEditHistory();
		
		itemEditHistory.setItemId(itemId);
		
		itemEditHistory.setItemType(itemType);
		
		itemEditHistoryList=SqlConnect.getSqlMapInstance().queryForList("sel_item_edit_history_list", itemEditHistory);
		
		return SUCCESS;
	}
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public List<ItemEditHistory> getItemEditHistoryList() {
		return itemEditHistoryList;
	}
	public void setItemEditHistoryList(List<ItemEditHistory> itemEditHistoryList) {
		this.itemEditHistoryList = itemEditHistoryList;
	}
	public int getItemType() {
		return itemType;
	}
	public void setItemType(int itemType) {
		this.itemType = itemType;
	}
	
	
	
}
