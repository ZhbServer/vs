package com.vshow.control.item;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Item;

public class ItemToAddSceneAction implements Action {
	
	
	private Item item;
    private String info;
	

	@Override
	public String execute() throws Exception {
		if(item!=null){
			info=item.getName().replaceAll("\\@","");
			info=info+"@"+item.getFblid();
		}
		return SUCCESS;
	}
	public Item getItem() {
		return item;
	}

	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setItem(Item item) {
		this.item = item;
	}
}
