package com.vshow.control.item;

import java.util.List;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Sjjk;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class ToItemDataSourceAjaxAction implements Action {

	private List<Sjjk> sjjks; // 数据源集合

	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1文件名,用户名) 
	
	private String initSucaiListJson="";  //素材初始化数据

	@Override
	public String execute() throws Exception {

		Sjjk s = new Sjjk();
		s.setName(ser);
		
		sjjks = SqlConnect.getSqlMapInstance().queryForList(
				"sel_sjjk_all_ser",s);

		return GsonUtil.getGson(sjjks);
	}

	public String getSer() {
		return ser;
	}

	public void setSer(String ser) {
		this.ser = ser;
	}

	public int getSel() {
		return sel;
	}

	public void setSel(int sel) {
		this.sel = sel;
	}

	public String getInitSucaiListJson() {
		return initSucaiListJson;
	}

	public void setInitSucaiListJson(String initSucaiListJson) {
		this.initSucaiListJson = initSucaiListJson;
	}
}
