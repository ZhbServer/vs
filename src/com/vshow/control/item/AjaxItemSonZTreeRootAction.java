package com.vshow.control.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ClientGroup;

import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemTree;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxItemSonZTreeRootAction implements Action {

	private String cgid;
	private String type;
	private List<ItemTree> itemlist;
	private ItemTree itree;

	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String urtkey = (String) session.get("urtkey");
		
		itemlist = new ArrayList<ItemTree>();
		itree = new ItemTree();
		itree.setId(-1);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00148());
		itree.setClick("showsonlist(-1)");
		itree.setIsParent("false");
		itemlist.add(itree);
		
		itree = new ItemTree();
		itree.setId(-2);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00850());
		itree.setClick("showsonlist(-2)");
		itree.setIsParent("false");
		itemlist.add(itree);
		
		ItemGroup ig = new ItemGroup();
		ig.setTkey(urtkey);
		List<ItemGroup> itemgroup = SqlConnect.getSqlMapInstance().queryForList("sel_itemgroup_all", ig);
		if(itemgroup.size() > 0){
			for (int i = 0; i < itemgroup.size(); i++) {
				ig = itemgroup.get(i);
				itree = new ItemTree();
				itree.setId(ig.getId());
				itree.setPid("0");
				if(ig.getUserid() != uid){
					String newName = ig.getName() + "(" + ig.getUname() + ")";
					if(newName.length()>18){
						newName = newName.substring(0,18)+"...";
					}
					itree.setName(newName);
					itree.setSos("1");
				}else{
					String newName = ig.getName();
					if(newName.length()>18){
						newName = newName.substring(0,18)+"...";
					}
					itree.setName(newName);
					itree.setSos("0");
				}
				itree.setClick("showsonlist("+ig.getId()+")");
				itree.setIsParent("false");
				itemlist.add(itree);
			}
		}

		JSONArray jsons = JSONArray.fromObject(itemlist);
		map.put("itemlist", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public List<ItemTree> getItemlist() {
		return itemlist;
	}

	public void setItemlist(List<ItemTree> itemlist) {
		this.itemlist = itemlist;
	}

	public String getCgid() {
		return cgid;
	}

	public void setCgid(String cgid) {
		this.cgid = cgid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
