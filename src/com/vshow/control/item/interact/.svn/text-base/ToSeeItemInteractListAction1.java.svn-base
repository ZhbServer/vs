package com.vshow.control.item.interact;

import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemGroup;
import com.vshow.control.data.InteractItemGroupRelation;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Pages;

import com.vshow.control.data.Sucai;
import com.vshow.control.item.ItemUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToSeeItemInteractListAction1 implements Action {

	private List<InteractItem> items;

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

		InteractItem item = new InteractItem();
		// 查看分组
		if (igr == null) {
			igr = new InteractItemGroupRelation();
			igr.setItemgroupid((Integer) session.get("igid"));
			item.setGpid((Integer) session.get("igid"));
		} else {
			item.setGpid(igr.getItemgroupid());
			session.put("igid", igr.getItemgroupid());
			igr.setItemgroupid((Integer) session.get("igid"));
		}

		if (igr.getItemgroupid() > 0) {
			Object obj = SqlConnect.getSqlMapInstance().queryForObject(
					"interact_item_group_uid", igr.getItemgroupid());
			if (obj != null) {
				int gsuid = (Integer) obj;
				session.put("giuid", gsuid);
			} else {
				item.setGpid(0);
			}

		} else {
			session.remove("giuid");
		}
		
		// 查询当前用户，下级用户的节目
		item.setUserid(uid);
		item.setTkey(tkey);
		// 起始页,页码类型,分组id
		// 当前页码
		if (id <= 0) {
			id = 1;
		}
		
		if(ser != null){
			ser = URLDecoder.decode(ser,"UTF-8");
		}

		if (sel == 0) {
			if (igr.getItemgroupid() == -1) {// 查询共享节目
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_interact_itemshare_page_count", item);
			} else if (igr.getItemgroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_interact_item_page_self_count", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 查询全部节目
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_interactitem_all_count", item);
				} else {// 查询其他分组节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_interact_item_page_other_count", item);
				}
			}
		} else if (sel == 1) {
			item.setName(ser);
			if (igr.getItemgroupid() == -1) {// 条件查询共享节目
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_interact_itemshare_page_name_count", item);
			} else if (igr.getItemgroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_interact_item_name_page_self_count", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 条件查询全部节目
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_interactitem_ser_name_count", item);
				} else {// 条件查询其他分组节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_interact_item_name_page_other_count",
									item);
				}
			}
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		item.setStartid((id - 1) * pagetype);
		item.setPagetype(pagetype);
		if (sel == 0) {
			if (igr.getItemgroupid() == -1) {// 查询共享节目
				items = SqlConnect.getSqlMapInstance().queryForList(
						"sel_interact_itemshare_page", item);
			} else if (igr.getItemgroupid() == -2) {
				items = SqlConnect.getSqlMapInstance().queryForList(
						"sel_interact_item_page_self", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 查询全部节目
					items = SqlConnect.getSqlMapInstance().queryForList(
							"sel_interactitem_all", item);
				} else {// 查询其他分组节目
					items = SqlConnect.getSqlMapInstance().queryForList(
							"sel_interact_item_page_other", item);
				}
			}
		} else if (sel == 1) {
			item.setName(ser);
			if (igr.getItemgroupid() == -1) {// 条件查询共享节目
				items = SqlConnect.getSqlMapInstance().queryForList(
						"sel_interact_itemshare_name_page", item);
			} else if (igr.getItemgroupid() == -2) {
				items = SqlConnect.getSqlMapInstance().queryForList(
						"sel_interact_item_name_page_self", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 条件查询全部节目
					items = SqlConnect.getSqlMapInstance().queryForList(
							"sel_interactitem_ser_name", item);
				} else {// 条件查询其他分组节目
					items = SqlConnect.getSqlMapInstance().queryForList(
							"sel_interact_item_name_page_other", item);
				}
			}
		}
		getItemSize(items);
		getItemGx(items,uid);
		ItemUtil.checkEditInteractItemState(items,2);
		String tempFileName="";
		for (InteractItem interactItem : items) {
			tempFileName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_scene_filename", interactItem.getId());
			interactItem.setFilename(tempFileName);
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

		InteractItemGroup ig = new InteractItemGroup();
		ig.setId(igr.getItemgroupid());
		ig.setUserid(uid);
		if(igr.getItemgroupid()==0|| igr.getItemgroupid()==-2){
			isSelf = 1;
		}else{
			if(igr.getItemgroupid()==-1 ){
				isSelf = 0;
			}else{
				isSelf = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_iitgroup_id_uid",ig);
			}
		}
		
		return SUCCESS;
	}

	public List<InteractItem> getItems() {
		return items;
	}

	public void setItems(List<InteractItem> items) {
		this.items = items;
	}

	public void getItemSize(List<InteractItem> items) {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		for (int i = 0; i < items.size(); i++) {
			InteractItem item = items.get(i);
			float flen = (float) item.getLen() / 1024 / 1024;

			item.setSize(dcmFmt.format(flen));

			float allflen = (float) item.getAlllen() / 1024 / 1024;

			item.setAllsize(dcmFmt.format(allflen));
		}
	}
	
	
	public void getItemGx(List<InteractItem> items,int uid) {
		for (int i = 0; i < items.size(); i++) {
			InteractItem item = items.get(i);
			if(item.getUserid() != uid){
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
