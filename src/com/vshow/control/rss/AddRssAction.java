package com.vshow.control.rss;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Rss;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddRssAction implements Action {
	private Rss rss;

	public Rss getRss() {
		return rss;
	}

	public void setRss(Rss rss) {
		this.rss = rss;
	}

	public String execute() throws Exception {
		int urid = (Integer) ActionContext.getContext().getSession().get("urid");
		Integer rid = (Integer)SqlConnect.getSqlMapInstance().insert("add_rss", rss);
		try {
			Rssxml nt = new Rssxml();
			nt.doNews(rss.getUrl(), rid);
		} catch (Exception e) {
		}
		LogHandle.insertTheLog(LogType.type63, urid,Constant.LOCAL.getA00198()+":" + rss.getName(), 1,1);
		return SUCCESS;
	}

}
