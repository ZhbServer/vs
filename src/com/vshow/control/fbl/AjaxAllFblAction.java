package com.vshow.control.fbl;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxAllFblAction implements Action {

	

	public String execute() throws Exception {
		List<Fbl> fbls=SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all");
		return GsonUtil.getGson(fbls);
	}

	
}
