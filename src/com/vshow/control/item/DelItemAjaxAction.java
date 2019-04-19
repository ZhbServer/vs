package com.vshow.control.item;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Item;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class DelItemAjaxAction implements Action {
	// 节目id;
	private String qx;
	private int count = 0;
	
	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		
		String [] qxs = qx.split(",");
		for (int i= 0; i  <qxs.length;  i++) {
			Item item=(Item)sm.queryForObject("sel_item_all_id",Integer.parseInt(qxs[i]));
			if(item.getUserid() != urid){
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
