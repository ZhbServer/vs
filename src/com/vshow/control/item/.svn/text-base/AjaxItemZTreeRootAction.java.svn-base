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
import com.vshow.control.data.ItemTree;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxItemZTreeRootAction implements Action {

	private User curruser;
	private List<ItemTree> itemlist;
	private String ztree;

	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		curruser = new User();
		curruser.setId(uid);

		itemlist = new ArrayList<ItemTree>();
		ItemTree itree = new ItemTree();
		itree.setId(0);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00815());
		itree.setClick("showsonlist(0)");
		itree.setIsParent("true");
		itemlist.add(itree);

		JSONArray jsons = JSONArray.fromObject(itemlist);
		map.put("itemlist", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public User getCurruser() {
		return curruser;
	}

	public void setCurruser(User curruser) {
		this.curruser = curruser;
	}

	public List<ItemTree> getItemlist() {
		return itemlist;
	}

	public void setItemlist(List<ItemTree> itemlist) {
		this.itemlist = itemlist;
	}

	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
	}

}
