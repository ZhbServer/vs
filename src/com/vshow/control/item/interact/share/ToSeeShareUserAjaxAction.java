package com.vshow.control.item.interact.share;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScShare;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;

public class ToSeeShareUserAjaxAction implements Action {
	// 节目id;
	private String qx;
	private int count = 0;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		String qxs[] = qx.split(",");
		for (int i = 0; i < qxs.length; i++) {
			Integer userid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("get_interact_item_userid_id",Integer.parseInt(qxs[i]));
			if(userid != uid){
				count = 1;
				break;
			}
		}
		
		return GsonUtil.getGson(count);
	}
	
	public String getQx() {
		return qx;
	}

	public void setQx(String qx) {
		this.qx = qx;
	}

	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}

}
