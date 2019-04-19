package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToMoveClientAction implements Action {

	private User curruser;
	private List<ClientGroupTree> cgslist;

	private String cidsstr; // 已选终端id,多个以"_"隔开
	private String ztree;

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");

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
		List<ClientGroup> sonlist = (List<ClientGroup>) SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid", cg);
		if (sonlist.size() > 0) {
			cgt.setIsParent("true");
		} else {
			cgt.setIsParent("fasle");
		}
		cgslist.add(cgt);

		JSONArray jsons = JSONArray.fromObject(cgslist);
		ztree = jsons.toString();

		return SUCCESS;
	}

	public User getCurruser() {
		return curruser;
	}

	public void setCurruser(User curruser) {
		this.curruser = curruser;
	}

	public String getCidsstr() {
		return cidsstr;
	}

	public void setCidsstr(String cidsstr) {
		this.cidsstr = cidsstr;
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
