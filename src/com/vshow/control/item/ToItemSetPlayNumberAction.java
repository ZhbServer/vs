package com.vshow.control.item;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;



import com.opensymphony.xwork.Action;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.tool.SqlConnect;

public class ToItemSetPlayNumberAction implements Action {

	
	
	
	private String itemPlayNumberJson;  //素材初始化数据
	
	private String itemIdStr;   //节目id
	
	private int fbtype=1;  //发布类型 1普通节目 2互动节目 
	
	@Override
	public String execute() throws Exception {
		
		 
		itemIdStr=itemIdStr.replaceAll("\\_", "\\,");

		if(fbtype==1){
			List<Item> items=SqlConnect.getSqlMapInstance().queryForList("sel_itemIdStr", itemIdStr);
			for (Item item : items) {
		        item.setPlayNumber(1);
			}
			   //初始化数据源转换json
			JSONArray jsonArr = JSONArray.fromObject(items);
			
			itemPlayNumberJson=jsonArr.toString();
		}else{
			List<InteractItem> items=SqlConnect.getSqlMapInstance().queryForList("sel_interact_itemIdStr", itemIdStr);
			for (InteractItem item : items) {
		        item.setPlayNumber(1);
			}
			   //初始化数据源转换json
			JSONArray jsonArr = JSONArray.fromObject(items);
			
			itemPlayNumberJson=jsonArr.toString();
		}
       
		
        
       
        
     
		
		
		return SUCCESS;
	}

	public int getFbtype() {
		return fbtype;
	}

	public void setFbtype(int fbtype) {
		this.fbtype = fbtype;
	}

	public String getItemIdStr() {
		return itemIdStr;
	}

	public void setItemIdStr(String itemIdStr) {
		this.itemIdStr = itemIdStr;
	}

	

	public String getItemPlayNumberJson() {
		return itemPlayNumberJson;
	}

	public void setItemPlayNumberJson(String itemPlayNumberJson) {
		this.itemPlayNumberJson = itemPlayNumberJson;
	}

}
