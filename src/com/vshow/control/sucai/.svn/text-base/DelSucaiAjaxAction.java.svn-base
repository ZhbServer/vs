package com.vshow.control.sucai;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class DelSucaiAjaxAction implements Action {

	// 素材id;
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
			Sucai sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("get_sc_all_id",Integer.parseInt(qxs[i]));
			if(sc.getUrid() != urid){
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
