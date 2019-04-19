package com.vshow.control.item.jh;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Jh;
import com.vshow.control.data.JhItem;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class JhItemListAction1 implements Action {

	private int jhid; // 计划id

	private List<JhItem> jhitems;
	private String jhitemlist;
	
	private String jhName;

    private List<Integer> weekList;

    private int posType=0;

    private int selfDay=0;

    private String validityXdate;
	

	public String getValidityXdate() {
		return validityXdate;
	}

	public void setValidityXdate(String validityXdate) {
		this.validityXdate = validityXdate;
	}

	@Override
	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		// TODO Auto-generated method stub
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		jhitems = SqlConnect.getSqlMapInstance().queryForList(
				"sel_jh_item_all", jhid);
		
		//获取计划类型
		Jh jh = (Jh)SqlConnect.getSqlMapInstance().queryForObject("see_jh_id", jhid);
		
		if(jh!=null&&jh.getType()==2){
			
			if(jhitems.size()>0){
				
				validityXdate=jhitems.get(0).getXiadate();	
			
			}
			
			
		}
		

		JSONArray jsons = JSONArray.fromObject(jhitems);
		jhitemlist = jsons.toString();

		// 获取计划名
		jhName = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"see_jh_name", jhid);
		
		
		weekList=new ArrayList<Integer>();
		
		weekList.add(8);
		weekList.add(1);
		weekList.add(2);
		weekList.add(3);
		weekList.add(4);
		weekList.add(5);
		weekList.add(6);
		weekList.add(7);

		return SUCCESS;
	}

	public List<Integer> getWeekList() {
		return weekList;
	}

	public void setWeekList(List<Integer> weekList) {
		this.weekList = weekList;
	}

	public String getJhName() {
		return jhName;
	}

	public void setJhName(String jhName) {
		this.jhName = jhName;
	}
	
	public int getJhid() {
		return jhid;
	}

	public void setJhid(int jhid) {
		this.jhid = jhid;
	}

	public List<JhItem> getJhitems() {
		return jhitems;
	}

	public void setJhitems(List<JhItem> jhitems) {
		this.jhitems = jhitems;
	}

	public String getJhitemlist() {
		return jhitemlist;
	}

	public void setJhitemlist(String jhitemlist) {
		this.jhitemlist = jhitemlist;
	}
	
	public int getPosType() {
		return posType;
	}

	public void setPosType(int posType) {
		this.posType = posType;
	}
	
	public int getSelfDay() {
		return selfDay;
	}

	public void setSelfDay(int selfDay) {
		this.selfDay = selfDay;
	}
	
}
