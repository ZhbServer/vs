package com.vshow.control.tq.ch;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Tq;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxAllTqAction implements Action {

	

	public String execute() throws Exception {
		List<Tq> tqs=SqlConnect.getSqlMapInstance().queryForList("get_tqyb");
		return GsonUtil.getGson(tqs);
	}

	
}
