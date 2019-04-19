package com.vshow.control.tq.ch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.Tq;
import com.vshow.control.data.User;
import com.vshow.control.data.UserTree;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxGetTqAction extends ActionSupport {
	
	
	private String city;
	
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
	    
		//System.out.println(city);
	    
	    //获取天气信息
	    Tq tq=(Tq)SqlConnect.getSqlMapInstance().queryForObject("g_wotq", city);
	    
	    return  GsonUtil.getGson(tq);
	    
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}


}
