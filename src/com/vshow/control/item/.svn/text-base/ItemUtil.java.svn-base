package com.vshow.control.item;

import java.sql.SQLException;
import java.util.List;

import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemEditHistory;
import com.vshow.control.tool.SqlConnect;

public class ItemUtil {

	 //验证终端最后修改用户是否为原制作人
	public static void checkEditItemState(List<Item> listis,int itemType) throws SQLException{
		ItemEditHistory ieh;
		
			for (Item item : listis) {
				ieh=new ItemEditHistory();
				ieh.setItemId(item.getId());
				ieh.setItemType(itemType);
				Integer editUid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_item_edit_history_last", ieh);
				if(editUid!=null){
					if(item.getUserid()!=editUid){
						item.setItemState(2);
					}
				}
			}
		
	}
	
	//互动
	public static void checkEditInteractItemState(List<InteractItem> listis,int itemType) throws SQLException{
		ItemEditHistory ieh;
		
			for (InteractItem item : listis) {
				ieh=new ItemEditHistory();
				ieh.setItemId(item.getId());
				ieh.setItemType(itemType);
				Integer editUid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_item_edit_history_last", ieh);
				if(editUid!=null){
					if(item.getUserid()!=editUid){
						item.setItemState(2);
					}
				}
			}
		
	}
	
}
