package com.vshow.control.dish;

import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Dish;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.ItemShare;
import com.vshow.control.data.Pages;

import com.vshow.control.data.Sucai;
import com.vshow.control.item.ItemUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxToSeeDishListMobileAction implements Action {

	
	private List<Dish> listis; // 菜价集合

	private int page; // 当前页数
	
	private int total; // 数据总个数
	
	private int totalpage; // 总页数
	
    private Integer pagetype = 7; // 页码类型(10,20,30)

	
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		// 分页类型存入session
		if (pagetype == null) {

			// 查看session是否有分页类型 null择默认10条显示
			Integer publicPagetype = (Integer) session.get("publicPagetype");
			if (publicPagetype == null) {
				session.put("publicPagetype",7);
				pagetype = 7;
			} else {
				pagetype = publicPagetype;
			}
		} else {
			
			session.put("publicPagetype", pagetype);
		
		}
		
		Dish dish = new Dish();
		
		dish.setUid(uid);

		
		// 起始页,页码类型
		// 当前页码
		if (page <= 0) {
			
			page = 1;
			
		}
		
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_dish_page_all_count", dish);
		
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}
        
		dish.setStartid((page - 1) * pagetype);
		
		dish.setPagetype(pagetype);
		
		
		listis = SqlConnect.getSqlMapInstance().queryForList("sel_dish_page_all", dish);
	
		// 总页码
		if (pagetype == 0) {
		
		} else {
			if (total % pagetype > 0) {
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}

		}
		
		//当前页码
		
		
		if(page>=totalpage){
			
			page=totalpage;
		
		}
		
		JSONArray jsons = JSONArray.fromObject(listis);
		
		Map<String,Object> map= new HashMap<String,Object>(); 
		
		map.put("dishlist", listis);
		
		map.put("page", page+"");

		map.put("totalpage", totalpage);
		
		return GsonUtil.getGson(map);
		
		
	}

	

	public List<Dish> getListis() {
		return listis;
	}



	public void setListis(List<Dish> listis) {
		this.listis = listis;
	}



	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}



	
}
