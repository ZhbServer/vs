package com.vshow.control.dish;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Dish;
import com.vshow.control.data.Rss;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.SqlConnect;

public class DelDishAction implements Action {
	
	private Integer id;
	
	

	public String execute() throws Exception {
		
		SqlConnect.getSqlMapInstance().delete("del_data_dish", id);
		
		return SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}




}
