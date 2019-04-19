package com.vshow.control.rss;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class SeeRssInfoAction implements Action {

	private int id;
	private String content;
	@Override
	public String execute() throws Exception {
		content=(String)SqlConnect.getSqlMapInstance().queryForObject("gt_nds_one", id);
		return SUCCESS;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
