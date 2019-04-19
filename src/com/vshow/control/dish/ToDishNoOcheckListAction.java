package com.vshow.control.dish;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Dish;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Jh;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;

import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToDishNoOcheckListAction implements Action {
	
	
	private List<Dish> listis; // 菜品集合

	

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1节目名) 
	private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
	
  
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		Dish dish=new Dish();
		
		//查询当前用户，下级用户的节目
		dish.setTkey(tkey);
		dish.setUid(uid);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		dish.setStartid((id - 1) * pagetype);
		dish.setPagetype(pagetype);
		dish.setOncheck(0);
	
		if(sel==0){
			listis= SqlConnect.getSqlMapInstance().queryForList("sel_noncheck_dish_page", dish);
			
			User u = new User();
			u.setId(uid);
			u.setTkey(tkey);
			u.setOcheck(0);
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_noncheck_dish_all_count", u);
		}else if(sel==1){
			//item.setName(ser);
			//listis=SqlConnect.getSqlMapInstance().queryForList("sel_item_name_page", item);
			//total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_item_name_page_count", item);			
		}
		
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
		
		
	
		return SUCCESS;
	}
	
	public List<Dish> getListis() {
		return listis;
	}


	public void setListis(List<Dish> listis) {
		this.listis = listis;
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
	
}
