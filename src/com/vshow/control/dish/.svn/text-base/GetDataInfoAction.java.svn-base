package com.vshow.control.dish;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientBind;
import com.vshow.control.data.ClientPeopleCode;
import com.vshow.control.data.ClientPlay;
import com.vshow.control.data.Dish;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;

public class GetDataInfoAction extends ActionSupport {
	
	private int did;
	
    private Dish dish;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
        dish=(Dish)SqlConnect.getSqlMapInstance().queryForObject("sel_noncheck_dish_info", did);
	    // 获取终端密码
		return SUCCESS;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	

}
