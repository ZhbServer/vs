package com.vshow.control.item;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.collections.map.HashedMap;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Client;
import com.vshow.control.data.ItemEditHistory;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ItemRelatedFileListAction implements Action {

	private int itemId;     //节目id
	private List<Sucai> sucaiList;
	private int itemType;   //节目类型   1普通节目  2互动节目
	@Override
	public String execute() throws Exception {
	  
		String fcontent="";
		
		if(itemType==1){
			
			fcontent=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_item_fcontent", itemId);
			
		}else if(itemType==2){
			
			fcontent=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_fcontent", itemId);
			
		}
		
		if(fcontent!=null&&!fcontent.equals("")){
			
			try {
				JSONArray jsonArray = JSONArray.fromObject(fcontent);
				
				sucaiList=new ArrayList<Sucai>();
				
				Sucai sucai;
				
			    for (Object object : jsonArray) {
				
					sucai=(Sucai)SqlConnect.getSqlMapInstance().queryForObject("sel_sc_filename",object.toString());
					
					if(sucai!=null){
						
						sucaiList.add(sucai);
						
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
		}
		
		return SUCCESS;
	}
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	public int getItemType() {
		return itemType;
	}
	public void setItemType(int itemType) {
		this.itemType = itemType;
	}


	public List<Sucai> getSucaiList() {
		return sucaiList;
	}


	public void setSucaiList(List<Sucai> sucaiList) {
		this.sucaiList = sucaiList;
	}
	
	
	
	
	
}
