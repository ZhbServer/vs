package com.vshow.control.zdy.item.factoryplan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemMaterial;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxSelItemMaterialAction implements Action {

	private int itemid;
	
	private List<ItemMaterial> materiallists; //节目元素集合

	@Override
	public String execute() throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		materiallists = (List<ItemMaterial>)SqlConnect.getSqlMapInstance().queryForList("sel_itemmaterial_byitmeid",itemid);
		
		subStringList(materiallists);
		
		map.put("materiallists", materiallists);
		
		List<String> sucaiNamesList=new ArrayList<String>();
	
		if(materiallists.size()>=1){
			
			ItemMaterial itemMaterial=materiallists.get(0);
			
			String fileNames=itemMaterial.getFilenames();
			
			String[] fileNamesArray=fileNames.split("\\,");
			
			String tempSucaiName="";
			
		    for (int i = 0; i < fileNamesArray.length; i++) {
		    	
		    	tempSucaiName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_sucai_name_by_filename", fileNamesArray[i]);
		    	
		    	if(tempSucaiName==null){
		    		sucaiNamesList.add(fileNamesArray[i]);
		    		
		    	}else{
		    		sucaiNamesList.add(tempSucaiName);
		    	}
				
			}	
			
		}
		
		map.put("sucaiNamesList", sucaiNamesList);
		
		JSONArray jsons = JSONArray.fromObject(map);

		return GsonUtil.getGson(map);
		//return jsons.toString();
	}

	
	// 显示截取名字(素材)
	public void subStringList(List<ItemMaterial> list) {
		try {
			for (ItemMaterial itemM : list) {
				
				Scene scene=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid", itemid);
				if(scene!=null){
					itemM.setMfile(scene.getFilename());
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public List<ItemMaterial> getMateriallists() {
		return materiallists;
	}

	public void setMateriallists(List<ItemMaterial> materiallists) {
		this.materiallists = materiallists;
	}
	
}
