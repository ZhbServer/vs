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

public class ToDishEditAction implements Action {
	
	private Integer id;
	
	private Dish dish;

	public String execute() throws Exception {
		
		dish=(Dish)SqlConnect.getSqlMapInstance().queryForObject("sel_dish_info_id", id);
		
		return SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}



}
