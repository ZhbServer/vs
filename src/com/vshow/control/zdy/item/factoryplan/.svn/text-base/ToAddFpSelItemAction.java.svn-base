package com.vshow.control.zdy.item.factoryplan;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemMaterial;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAddFpSelItemAction implements Action {

	private List<ItemMaterial> mitemlists; //节目集合

	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1节目名)

	@Override
	public String execute() throws Exception {
		
		mitemlists = (List<ItemMaterial>)SqlConnect.getSqlMapInstance().queryForList("sel_itemmaterial_option");
		
		
		
		subStringList(mitemlists);
		
		return SUCCESS;
	}
	
	// 显示截取名字(素材)
	public void subStringList(List<ItemMaterial> list) {
		try {
			for (ItemMaterial itemM : list) {
				String itemName = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_item_name",itemM.getItemid());
				itemM.setItemName(itemName);
				int sName = itemM.getFilenames().length();
				if (sName >= 40) {
					itemM.setSubFnames(itemM.getFilenames().substring(0, 41) + "...");
				} else {
					itemM.setSubFnames(itemM.getFilenames());
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<ItemMaterial> getMitemlists() {
		return mitemlists;
	}

	public void setMitemlists(List<ItemMaterial> mitemlists) {
		this.mitemlists = mitemlists;
	}


	public String getSer() {
		return ser;
	}

	public void setSer(String ser) {
		this.ser = ser;
	}

	public int getSel() {
		return sel;
	}

	public void setSel(int sel) {
		this.sel = sel;
	}

}
