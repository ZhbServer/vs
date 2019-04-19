package com.vshow.control.api.test.treasure;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemGroupRelation;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.item.ItemUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

/*
 *添加宝箱节目
 */

public class AddTreasureItemAction implements Action {

	private List<Item> items;

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1节目名)
	private Pages ps; // 分页
	private Integer pagetype = 10; // 页码类型(10,20,30)
	
	private InteractItem item;
	private InteractItemGroupRelation igr; // 分组
	
	private int isSelf;
	
	

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
				session.put("publicPagetype", 10);
				pagetype = 10;
			} else {
				pagetype = publicPagetype;
			}
		} else {
			session.put("publicPagetype", pagetype);
		}

		Item item = new Item();
				
		// 查询当前用户，下级用户的节目
		item.setUserid(uid);
		item.setTkey(tkey);
		// 起始页,页码类型,分组id
		// 当前页码
		if (id <= 0) {
			id = 1;
		}
		
		if (sel == 0) {		
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_page_all_count", item);
				
		} else if (sel == 1) {
			item.setName(ser);							
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_name_page_all_count", item);							
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		item.setStartid((id - 1) * pagetype);
		item.setPagetype(pagetype);
		if (sel == 0) {					
			items = SqlConnect.getSqlMapInstance().queryForList("sel_item_page_all", item);					
		} else if (sel == 1) {
			item.setName(ser);							
			items = SqlConnect.getSqlMapInstance().queryForList("sel_item_name_page_all", item);						
		}
		
		getItemSize(items);
		getItemGx(items,uid);
		ItemUtil.checkEditItemState(items,2);		
		String tempFileName;
		for (Item Item : items) {
			tempFileName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_item_id_scene_filename", Item.getId());
			Item.setFilename(tempFileName);
		}

		if (pagetype == 0) {
		} else {
			if (total % pagetype > 0) {
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}

		}
		qian = id - 1;
		hou = id + 1;
		if (hou >= totalpage) {
			hou = totalpage;
		}

		ps = Constant.getPages(totalpage, id);
	
		return SUCCESS;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
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
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getQian() {
		return qian;
	}

	public void setQian(int qian) {
		this.qian = qian;
	}

	public int getHou() {
		return hou;
	}

	public void setHou(int hou) {
		this.hou = hou;
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

	public Pages getPs() {
		return ps;
	}

	public void setPs(Pages ps) {
		this.ps = ps;
	}

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}

	public InteractItem getItem() {
		return item;
	}

	public void setItem(InteractItem item) {
		this.item = item;
	}

	public InteractItemGroupRelation getIgr() {
		return igr;
	}

	public void setIgr(InteractItemGroupRelation igr) {
		this.igr = igr;
	}

	public int getIsSelf() {
		return isSelf;
	}

	public void setIsSelf(int isSelf) {
		this.isSelf = isSelf;
	}

}
