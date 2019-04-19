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

public class SaveDishAction implements Action {
	
	private String dishTitle;
	
	private String dishArrayStr;
	
	private Integer dishEditId;

	

	public String execute() throws Exception {
		
		Dish dish =new  Dish();
		
		dish.setContent(dishArrayStr);
		
		dish.setTitle(dishTitle);
		
		dish.setLast_edit_time(DateUtil.getTime());
		
        int urcheck = (Integer) ActionContext.getContext().getSession().get("urcheck");
		
        if(urcheck==2){
        	urcheck=0;
        }
		dish.setOncheck(urcheck);
		
		
		if(dishEditId==null||dishEditId==0){
			
			int urid = (Integer) ActionContext.getContext().getSession().get("urid");
			
			dish.setUid(urid);
			
			dish.setCreate_time(DateUtil.getTime());
			
			SqlConnect.getSqlMapInstance().insert("add_dish",dish);
			
		}else{
			
			dish.setId(dishEditId);
			
			SqlConnect.getSqlMapInstance().insert("up_dish",dish);
			
		}
	
		return SUCCESS;
	}

	public String getDishTitle() {
		return dishTitle;
	}

	public void setDishTitle(String dishTitle) {
		this.dishTitle = dishTitle;
	}

	public String getDishArrayStr() {
		return dishArrayStr;
	}

	public void setDishArrayStr(String dishArrayStr) {
		this.dishArrayStr = dishArrayStr;
	}

	public Integer getDishEditId() {
		return dishEditId;
	}

	public void setDishEditId(Integer dishEditId) {
		this.dishEditId = dishEditId;
	}
}
