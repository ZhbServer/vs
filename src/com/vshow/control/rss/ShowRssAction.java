package com.vshow.control.rss;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ShowRssAction implements Action {

	private int id;
	private String content;
	private String url;

	public String getContent() {
		return content;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public String execute() throws Exception {

		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		content = (String) sm.queryForObject("gt_nds_one_url", url);
		content = content.replaceAll("<STRONG>", "")
		.replaceAll("</STRONG>", "").replaceAll("<U>", "")
		.replaceAll("</U>", "").replaceAll("<STRIKE>", "")
		.replaceAll("</STRIKE>", "").replaceAll("<EM>", "")
		.replaceAll("</EM>", "").replaceAll("<P>", "")
		.replaceAll("</P>", "").replaceAll("&nbsp;", " ")
		.replaceAll("<P aligncenter>", "")
		.replaceAll("<P alignleft>", "")
		.replaceAll("<P alignright>", "").replaceAll("\\*", "");
		return SUCCESS;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
