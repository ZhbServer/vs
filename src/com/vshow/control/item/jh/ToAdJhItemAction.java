package com.vshow.control.item.jh;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAdJhItemAction implements Action {

	private int jhid;     //计划id
    private String validitySdate; //开始时间
	private String validityEdate; //结束时间
	private String validityXdate; //下载时间
	private List<Item> listis; // 节目集合

	private List listsfgp; // 分组集合（自己）
	private List listfagp; // 分组集合(父辈)

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1节目名) 
	private Pages ps;     //分页
    private int pagetype=7;  //页码类型(10,20,30)
	private Item item;
	private ItemGroupRelation igr; // 分组
	private List yxitemlist; // 已选节目集合
	private String filenames; // 获取已选节目id
	
	private int jhtype;
	
	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		item=new Item();
		//查看分组
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
		
		
		
		
		//查询当前用户，下级用户的节目
		item.setTkey(tkey);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
        item.setStartid((id - 1) * pagetype);
		item.setPagetype(pagetype);
		if(sel==0){
			listis=SqlConnect.getSqlMapInstance().queryForList("sel_item_ocheck_page", item);
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_ocheck_page_count", item);
		}else if(sel==1){
			item.setName(ser);
			listis=SqlConnect.getSqlMapInstance().queryForList("sel_item_name_page", item);
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_name_page_count", item);
			
			
		}
		getItemSize(listis);
		if(pagetype==0){
		}else{
			if (total % pagetype > 0) { 
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}
		}
		if (totalpage == 0) {
			totalpage = 1;
		}
		qian = id - 1;
		hou = id + 1;
		if (hou >= totalpage) {
			hou = totalpage;
		}
		
		ps = Constant.getPages(totalpage, id);
		
		ItemGroup ig = new ItemGroup();
		ig.setTkey(tkey);
		ig.setUserid(uid);
		
		//获取分组(自己，下级)
		listsfgp = SqlConnect.getSqlMapInstance().queryForList("item_self_group_all", ig);

		
		//获取已选
		if (filenames != null) {
			if (!"".equals(filenames)) {
				filenames = filenames.trim();
				List list = new ArrayList();
				String[] sids = filenames.split("\\|");
				Pattern pattern = Pattern.compile("[0-9]*");
				Matcher isNum = pattern.matcher(sids[0]);
				if (!isNum.matches()) {
					for (int i = 0; i < sids.length; i++) {

						Item s = (Item) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_item_all_id", sids[i]);
						list.add(s);
					}
				} else {
					for (int i = 0; i < sids.length; i++) {

						Item s = (Item) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_item_all_id",
										Integer.parseInt((sids[i])));
						list.add(s);
					}
				}

				subStringList(list);
				yxitemlist = list;
			}
		}
		
		String result=SUCCESS;
		if(jhtype==1){
			result= "success2";
		}else if(jhtype==2){
			result= "success3";
		}
		return result;
		
		
	}
	
	public String getValidityXdate() {
		return validityXdate;
	}

	public void setValidityXdate(String validityXdate) {
		this.validityXdate = validityXdate;
	}
	
	public List getYxitemlist() {
		return yxitemlist;
	}

	public void setYxitemlist(List yxitemlist) {
		this.yxitemlist = yxitemlist;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}

	// 显示截取名字(素材)
	public void subStringList(List<Item> list) {
		for (Item item : list) {
			int sName = item.getName().length();
			if (sName >= 20) {
				item.setNamesub(item.getName().substring(0, 19) + "...");
			} else {
				item.setNamesub(item.getName());
			}
		}
	}
	
	public String getValiditySdate() {
		return validitySdate;
	}

	public void setValiditySdate(String validitySdate) {
		this.validitySdate = validitySdate;
	}

	public String getValidityEdate() {
		return validityEdate;
	}

	public void setValidityEdate(String validityEdate) {
		this.validityEdate = validityEdate;
	}
	  public int getJhid() {
			return jhid;
		}

		public void setJhid(int jhid) {
			this.jhid = jhid;
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

		public List getListfagp() {
			return listfagp;
		}

		public void setListfagp(List listfagp) {
			this.listfagp = listfagp;
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

		
		public int getJhtype() {
			return jhtype;
		}

		public void setJhtype(int jhtype) {
			this.jhtype = jhtype;
		}
		
	public void getItemSize(List<Item> items) {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		for (int i = 0; i < items.size(); i++) {
			Item item = items.get(i);
			float flen = (float) item.getLen() / 1024 / 1024;

			item.setSize(dcmFmt.format(flen));
		}
	}

}
