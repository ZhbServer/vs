package com.vshow.control.sucai;

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
import com.vshow.control.data.ScTree;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxSCZTreeRootAction implements Action {

	private List<ScTree> sclist;

	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();

		sclist = new ArrayList<ScTree>();
		ScTree itree = new ScTree();
		itree.setId(0);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00815());
		itree.setClick("showsonlist_sc(0)");
		itree.setIsParent("true");
		sclist.add(itree);

		JSONArray jsons = JSONArray.fromObject(sclist);
		map.put("sclist", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public List<ScTree> getSclist() {
		return sclist;
	}

	public void setSclist(List<ScTree> sclist) {
		this.sclist = sclist;
	}
}
