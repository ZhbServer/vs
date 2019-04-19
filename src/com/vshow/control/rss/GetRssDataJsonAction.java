package com.vshow.control.rss;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.JsonValue;
import com.vshow.control.tool.SqlConnect;

public class GetRssDataJsonAction implements Action {

	private String url;
	private String content; //返回值
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		String rsscontent = (String) sm.queryForObject("gt_nds_one_url",url);
		JsonValue jv=new JsonValue();
		jv.setCode(rsscontent);
		JSONArray jsonArray = JSONArray.fromObject(jv);
		content = jsonArray.toString();
		return SUCCESS;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
