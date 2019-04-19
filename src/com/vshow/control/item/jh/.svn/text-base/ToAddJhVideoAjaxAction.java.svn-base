package com.vshow.control.item.jh;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class ToAddJhVideoAjaxAction implements Action {

	private List<Item> listis; // 节目集合

	private List listsfgp; // 分组集合（自己）

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1文件名,用户名) 
	private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
	
    private Item item;
	private ItemGroupRelation igr; // 分组

	private int xy_x=0;
	private int xy_y=0;

	private String initSucaiListJson="";  //素材初始化数据
	private String yxSucaiListJson="";    //已选素材数据
	
	private List listdefaultgp; // 分组集合（默认）
	
	private String filenames; // 获取已选素材id
	private List yxsclist; // 已选素材集合


	
	private int jhid;  //计划id
	private int jhtype;  //计划类型 1轮播 2插播

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		if (id <= 0) {
			id = 1;
		}
		
		item = new Item();
		// 查看分组
		if (igr == null) {
			igr = new ItemGroupRelation();
			igr.setItemgroupid((Integer) session.get("igid"));
			item.setGpid((Integer) session.get("igid"));
		} else {
			item.setGpid(igr.getItemgroupid());
			session.put("igid", igr.getItemgroupid());
			igr.setItemgroupid((Integer) session.get("igid"));
		}

		if (igr.getItemgroupid() > 0) {
			Object obj = SqlConnect.getSqlMapInstance().queryForObject(
					"item_group_uid", igr.getItemgroupid());
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
		item.setTkey(tkey);
		item.setUserid(uid);
		// 起始页,页码类型,分组id
		// 当前页码
		if (id <= 0) {
			id = 1;
		}

		if (sel == 0) {
			if (igr.getItemgroupid() == -1) {// 查询共享节目
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_itemshare_page_count", item);
			} else if (igr.getItemgroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_item_page_self_count", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 查询全部节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_item_page_all_count", item);
				} else {// 查询其他分组节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_item_page_other_count", item);
				}
			}
		} else if (sel == 1) {
			item.setName(ser);
			if (igr.getItemgroupid() == -1) {// 条件查询共享节目
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_itemshare_page_name_count", item);
			} else if (igr.getItemgroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_item_name_page_self_count", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 条件查询全部节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_item_name_page_all_count",
									item);
				} else {// 条件查询其他分组节目
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_item_name_page_other_count",
									item);
				}
			}
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		item.setStartid((id - 1) * pagetype);
		item.setPagetype(total);
		if (sel == 0) {
			if (igr.getItemgroupid() == -1) {// 查询共享节目
				listis = SqlConnect.getSqlMapInstance().queryForList(
						"sel_itemshare_page", item);
			} else if (igr.getItemgroupid() == -2) {
				listis = SqlConnect.getSqlMapInstance().queryForList(
						"sel_item_page_self", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 查询全部节目
					listis = SqlConnect.getSqlMapInstance().queryForList(
							"sel_item_page_all", item);
				} else {// 查询其他分组节目
					listis = SqlConnect.getSqlMapInstance().queryForList(
							"sel_item_page_other", item);
				}
			}
		} else if (sel == 1) {
			item.setName(ser);
			if (igr.getItemgroupid() == -1) {// 条件查询共享节目
				listis = SqlConnect.getSqlMapInstance().queryForList(
						"sel_itemshare_name_page", item);
			} else if (igr.getItemgroupid() == -2) {
				listis = SqlConnect.getSqlMapInstance().queryForList(
						"sel_item_name_page_self", item);
			} else {
				if (igr.getItemgroupid() == 0) {// 条件查询全部节目
					listis = SqlConnect.getSqlMapInstance().queryForList(
							"sel_item_name_page_all", item);
				} else {// 条件查询其他分组节目
					listis = SqlConnect.getSqlMapInstance().queryForList(
							"sel_item_name_page_other", item);
				}
			}
		}
		getItemSize(listis);
		getItemGx(listis, uid);
		
		
		//初始化数据源转换json
		JSONArray jsonArr = JSONArray.fromObject(listis);
		
		initSucaiListJson=jsonArr.toString();
		
		
		return GsonUtil.getGson(listis);

	}

	public String getYxSucaiListJson() {
		return yxSucaiListJson;
	}

	public void setYxSucaiListJson(String yxSucaiListJson) {
		this.yxSucaiListJson = yxSucaiListJson;
	}

	// 显示截取名字(素材)
	public void subStringList(List<Sucai> list) {
		for (Sucai sc : list) {
			int sName = sc.getName().length();
			if (sName >= 20) {
				sc.setNamesub(sc.getName().substring(0, 19) + "...");
			} else {
				sc.setNamesub(sc.getName());
			}
		}
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

	public List<Item> getListis() {
		return listis;
	}

	public void setListis(List<Item> listis) {
		this.listis = listis;
	}

	public List getListsfgp() {
		return listsfgp;
	}

	public void setListsfgp(List listsfgp) {
		this.listsfgp = listsfgp;
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

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public ItemGroupRelation getIgr() {
		return igr;
	}

	public void setIgr(ItemGroupRelation igr) {
		this.igr = igr;
	}

	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}

	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}

	public String getInitSucaiListJson() {
		return initSucaiListJson;
	}

	public void setInitSucaiListJson(String initSucaiListJson) {
		this.initSucaiListJson = initSucaiListJson;
	}

	public List getListdefaultgp() {
		return listdefaultgp;
	}

	public void setListdefaultgp(List listdefaultgp) {
		this.listdefaultgp = listdefaultgp;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}

	public List getYxsclist() {
		return yxsclist;
	}

	public void setYxsclist(List yxsclist) {
		this.yxsclist = yxsclist;
	}

	public int getJhid() {
		return jhid;
	}

	public void setJhid(int jhid) {
		this.jhid = jhid;
	}

	public int getJhtype() {
		return jhtype;
	}

	public void setJhtype(int jhtype) {
		this.jhtype = jhtype;
	}
	
}
