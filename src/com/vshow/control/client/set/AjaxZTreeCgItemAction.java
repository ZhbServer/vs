package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxZTreeCgItemAction extends ActionSupport {
	private String cgid;
	private String type;
	private List<ClientGroupTree> cgslist;
    
	@Override
	public String execute() throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		ClientGroup c = new ClientGroup();
		c.setPid(Integer.parseInt(cgid));
		c.setUid(uid);
		cgslist = new ArrayList<ClientGroupTree>();
		List<ClientGroupTree> cgtlist = (List<ClientGroupTree>) SqlConnect.getSqlMapInstance().queryForList("sel_cg_id1", c);
		ClientGroupTree cgt;
		for (int i = 0; i < cgtlist.size(); i++) {
			cgt=new ClientGroupTree();
			cgt.setId(cgtlist.get(i).getId());
			cgt.setPid(cgtlist.get(i).getPid());
			/*if(areaCount.getString("count") == "0"){
				areat.setName((String)pageData.get("areaName"));
			}else{
				areat.setName((String)pageData.get("areaName")+"   ("+areaCount.getString("count")+")");
			}*/
			cgt.setName(cgtlist.get(i).getName());
			cgt.setTarget("");
			cgt.setUrl("");
			cgt.setClick("showcg1list('"+cgt.getId()+"','ajaxclientitem.vs',"+type+")");
			ClientGroup cg = new ClientGroup();
			cg.setUid(uid);
			cg.setPid(Integer.parseInt(cgtlist.get(i).getId()));
			List<ClientGroup> sonlist = (List<ClientGroup>) SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid",cg);
			if(sonlist.size()>0){
				cgt.setIsParent("true");
			}else{
				cgt.setIsParent("fasle");
			}
			cgslist.add(cgt);
		}
		
		JSONArray jsons=JSONArray.fromObject(cgslist);
		map.put("cgslist", jsons.toString());
		
		return  GsonUtil.getGson(map);
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

	public List<ClientGroupTree> getCgslist() {
		return cgslist;
	}

	public void setCgslist(List<ClientGroupTree> cgslist) {
		this.cgslist = cgslist;
	}

}
