package com.vshow.control.item.jh;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.SqlConnect;

public class JhPlayItemListAction extends ActionSupport {
	
	
	private String itemIdsAndType; //节目ids_节目类型
	private List<Item> items;
	private int checkItemState=0;
	
	private int jhitemid;
	private JhItem jhitem;
	
	@Override
	public String execute() throws Exception {
		
		String[]  iidstypes=itemIdsAndType.split("\\_");
		if(iidstypes.length==2){
			if(iidstypes[0].equals("")){
				checkItemState=1;
			}else{
				if(iidstypes[1].equals("1")){
					String itemids="";
					String edh=iidstypes[0].substring(iidstypes[0].length()-1, iidstypes[0].length());
					if(edh.equals(",")){
						itemids=iidstypes[0].substring(0, iidstypes[0].length()-1);
					}else{
						itemids=iidstypes[0];
					}
					items=SqlConnect.getSqlMapInstance().queryForList("sel_cp_items",itemids);
				}
				jhitem = (JhItem)SqlConnect.getSqlMapInstance().queryForObject("sel_jh_item_byid", jhitemid);
			}	
		}
		
		return SUCCESS;
		
	}
	public int getCheckItemState() {
		return checkItemState;
	}
	public void setCheckItemState(int checkItemState) {
		this.checkItemState = checkItemState;
	}
	public String getItemIdsAndType() {
		return itemIdsAndType;
	}
	public void setItemIdsAndType(String itemIdsAndType) {
		this.itemIdsAndType = itemIdsAndType;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public int getJhitemid() {
		return jhitemid;
	}
	public void setJhitemid(int jhitemid) {
		this.jhitemid = jhitemid;
	}
	public JhItem getJhitem() {
		return jhitem;
	}
	public void setJhitem(JhItem jhitem) {
		this.jhitem = jhitem;
	}
}
