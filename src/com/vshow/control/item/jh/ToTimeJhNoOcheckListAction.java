package com.vshow.control.item.jh;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Jh;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;

import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToTimeJhNoOcheckListAction implements Action {
	
	
	private List<Jh> listis; // 节目集合

	private int type; //审核类型  1轮播 2插播

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
		
		Jh jh=new Jh();
		
		//查询当前用户，下级用户的节目
		jh.setTkey(tkey);
		jh.setUrid(uid);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
        jh.setStartid((id - 1) * pagetype);
		jh.setPagetype(pagetype);
		jh.setOcheck(2);
		jh.setType(type);
		if(sel==0){
			listis= SqlConnect.getSqlMapInstance().queryForList("sel_nocheck_jh_page", jh);
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_nocheck_jh_page_count", jh);
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
		
		String success="";
	    if(type==1){
	    	
	    	success="success1";
	    
	    }else if(type==2){
	    	
	    	success="success2";
	    	
	    }
	
		return success;
	}
	
	
	
	


	public int getType() {
		return type;
	}






	public void setType(int type) {
		this.type = type;
	}






	public List<Jh> getListis() {
		return listis;
	}






	public void setListis(List<Jh> listis) {
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
