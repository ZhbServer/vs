package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ClientGroup;

import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxZTreeRootAction implements Action {

	private User curruser;
	private List<ClientGroupTree> cgslist;
	private String ztree;

	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		curruser = new User();
		curruser.setId(uid);

		cgslist = new ArrayList<ClientGroupTree>();
		ClientGroupTree cgt = new ClientGroupTree();
		cgt.setId("0");
		cgt.setPid("0");
		cgt.setName(Constant.LOCAL.getA00815());
		cgt.setTarget("");
		cgt.setUrl("");
		cgt.setClick("showcg1list(0,'ajaxclientcg1.vs',0)");
		ClientGroup cg = new ClientGroup();
		cg.setUid(uid);
		cg.setPid(Integer.parseInt(cgt.getPid()));
		List<ClientGroup> sonlist = (List<ClientGroup>) SqlConnect
				.getSqlMapInstance().queryForList("sel_cg_all_level_pid", cg);
		if (sonlist.size() > 0) {
			cgt.setIsParent("true");
		} else {
			cgt.setIsParent("fasle");
		}
		cgslist.add(cgt);

		JSONArray jsons = JSONArray.fromObject(cgslist);
		map.put("cgslist", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public User getCurruser() {
		return curruser;
	}

	public void setCurruser(User curruser) {
		this.curruser = curruser;
	}

	public List<ClientGroupTree> getCgslist() {
		return cgslist;
	}

	public void setCgslist(List<ClientGroupTree> cgslist) {
		this.cgslist = cgslist;
	}

	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
	}

}
