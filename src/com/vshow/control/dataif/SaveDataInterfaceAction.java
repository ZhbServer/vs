package com.vshow.control.dataif;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Sjjk;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class SaveDataInterfaceAction implements Action {

	private String dname;
	private String json;
	private String jsonStr;
	private String info="";

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		json = json.replaceAll("\'", "\"");
		jsonStr = jsonStr.replaceAll("\'", "\"");
		
		Sjjk sj = new Sjjk();
		sj.setName(dname);
		sj.setContent(json);
		sj.setSource(jsonStr);
		SqlConnect.getSqlMapInstance().insert("add_sjjk", sj);
		info = "1";
		
		return SUCCESS;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}
	

}
