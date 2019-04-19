package com.vshow.control.sucai;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScTree;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxSCSonZTreeRootAction implements Action {

	private int sctype;
	private List<ScTree> sclist;
	private ScTree itree;

	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String urtkey = (String) session.get("urtkey");
		sclist = new ArrayList<ScTree>();
		itree = new ScTree();
		itree.setId(-1);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00817());
		itree.setClick("showsonlist_sc(-1)");
		itree.setIsParent("false");
		sclist.add(itree);

		itree = new ScTree();
		itree.setId(-2);
		itree.setPid("0");
		itree.setName(Constant.LOCAL.getA00849());
		itree.setClick("showsonlist_sc(-2)");
		itree.setIsParent("false");
		sclist.add(itree);

		ScGroup ig = new ScGroup();
		ig.setTkey(urtkey);
		ig.setType(sctype);
		List<ScGroup> scgroup = SqlConnect.getSqlMapInstance().queryForList("sel_scgroup_all", ig);
		if (scgroup.size() > 0) {
			for (int i = 0; i < scgroup.size(); i++) {
				ig = scgroup.get(i);
				itree = new ScTree();
				itree.setId(ig.getId());
				itree.setPid("0");
				if (ig.getUserid() != uid) {
					String newName = ig.getName() + "(" + ig.getUname() + ")";
					if(newName.length()>18){
						newName = newName.substring(0,18)+"...";
					}
					itree.setName(newName);
					itree.setSos("1");
				} else {
					String newName = ig.getName();
					if(newName.length()>18){
						newName = newName.substring(0,18)+"...";
					}
					itree.setName(newName);
					itree.setSos("0");
				}
				itree.setClick("showsonlist_sc(" + ig.getId() + ")");
				itree.setIsParent("false");
				sclist.add(itree);
			}
		}

		JSONArray jsons = JSONArray.fromObject(sclist);
		map.put("sclist", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public int getSctype() {
		return sctype;
	}

	public void setSctype(int sctype) {
		this.sctype = sctype;
	}

}
