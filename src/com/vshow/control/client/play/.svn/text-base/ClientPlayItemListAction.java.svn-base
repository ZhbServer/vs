package com.vshow.control.client.play;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.tool.SqlConnect;

public class ClientPlayItemListAction extends ActionSupport {
	
	
	private String itemIdsAndType; //节目ids_节目类型
	private List<Item> items;
	private List scenes;
	private int checkItemState=0;
	private List<InteractItem> interactItems;
	
	@Override
	public String execute() throws Exception {
		
		String[]  iidstypes=itemIdsAndType.split("\\_");
		
		if(iidstypes.length==2){
			
			if(iidstypes[0].equals("")){
				
				checkItemState=1;
			
			}else{
				
				if(iidstypes[1].equals("1")){
					
					String itemids="";
					//String edh=iidstypes[0].substring(iidstypes[0].length()-1, iidstypes[0].length());
					
					//if(edh.equals(",")){
					//	itemids=iidstypes[0].substring(0, iidstypes[0].length()-1);
					//}else{
					//	itemids=iidstypes[0];
					//}
					String iidstypess[]=iidstypes[0].split(",");
				    itemids="";
					String tempItemIds="";
					for (int i = 0; i < iidstypess.length; i++) {
						tempItemIds=iidstypess[i];
						if(tempItemIds!=null&&!tempItemIds.equals("")){
							if(itemids.length()==0){
								itemids=tempItemIds;
							}else{
								itemids=itemids+","+tempItemIds;
							}
						}
					}
					
					
					if(itemids!=null&&!itemids.equals("")){
						
						items=SqlConnect.getSqlMapInstance().queryForList("sel_cp_items",itemids);
					
					}
					
				}else if(iidstypes[1].equals("2")){
					interactItems = SqlConnect.getSqlMapInstance().queryForList("sel_id_interactitem", Integer.parseInt(iidstypes[0].trim())); 
					for (InteractItem interactItem : interactItems) {
						String tempFileName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_scene_filename", interactItem.getId());
						interactItem.setFilename(tempFileName);
					}
					return "success2";
				}	
				
			}	
			
			
		}
		return SUCCESS;
		
	}
	public List<InteractItem> getInteractItems() {
		return interactItems;
	}
	public void setInteractItems(List<InteractItem> interactItems) {
		this.interactItems = interactItems;
	}
	public int getCheckItemState() {
		return checkItemState;
	}
	public void setCheckItemState(int checkItemState) {
		this.checkItemState = checkItemState;
	}
	public List getScenes() {
		return scenes;
	}
	public void setScenes(List scenes) {
		this.scenes = scenes;
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
}
