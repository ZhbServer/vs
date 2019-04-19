package com.vshow.control.rss;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Tq;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxAllRssAction implements Action {

	

	public String execute() throws Exception {
		List<Rss> rsss=SqlConnect.getSqlMapInstance().queryForList("gt_news_one");
		return GsonUtil.getGson(rsss);
	}

	
}
