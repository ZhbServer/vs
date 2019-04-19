package com.vshow.control.item;

import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.ItemShare;
import com.vshow.control.data.Pages;

import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxToSeeItemListMobileAction implements Action {

	
	private List<Item> listis; // 节目集合

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
		
		Item item = new Item();
		
		item.setGpid(0);
		

		// 查询当前用户，下级用户的节目
		item.setTkey(tkey);
		
		item.setUserid(uid);
		
		item.setOcheck(1);
		
		// 起始页,页码类型
		// 当前页码
		if (page <= 0) {
			
			page = 1;
			
		}
		
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_page_all_ocheck_count", item);
		
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		pagetype=-1;
		if (pagetype == -1) {
			pagetype = total;
		}
        
		item.setStartid((page - 1) * pagetype);
		
		item.setPagetype(pagetype);
		
		
		listis = SqlConnect.getSqlMapInstance().queryForList("sel_item_page_all_ocheck", item);
		
		getItemSize(listis);
		
		getItemGx(listis, uid);
		
		ItemUtil.checkEditItemState(listis,1);
		
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
		page+=1;
		
		if(page>=totalpage){
			
			page=totalpage;
		
		}
		
		JSONArray jsons = JSONArray.fromObject(listis);
		
		Map<String,Object> map= new HashMap<String,Object>(); 
		
		map.put("itemlist", listis);
		
		map.put("page", page+"");

		map.put("totalpage", totalpage);
		
		return GsonUtil.getGson(map);
		
		
	}

	public List<Item> getListis() {
		return listis;
	}

	public void setListis(List<Item> listis) {
		this.listis = listis;
	}

	public void getItemSize(List<Item> items) {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		for (int i = 0; i < items.size(); i++) {
			Item item = items.get(i);
			float flen = (float) item.getLen() / 1024 / 1024;

			item.setSize(dcmFmt.format(flen));
		}
	}

	public void getItemGx(List<Item> items, int uid) {
		for (int i = 0; i < items.size(); i++) {
			Item item = items.get(i);
			if (item.getUserid() != uid) {
				item.setIsgx(1);
			}
		}
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
