package com.vshow.control.datainfo;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.DataHl;
import com.vshow.control.data.DataHlShow;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class SeeDataHlAction implements Action {

	private List<DataHlShow> dhs;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
    private Pages ps;     //分页

	private int pagetype=10;  //页码类型(10,20,30)

	public String execute() throws Exception {
		if (id <= 0) {
			id = 1;
		}
		
		
		Fbl tempfbl=new Fbl();
		tempfbl.setStartid((id - 1) * pagetype);
		tempfbl.setPagetype(pagetype);
		
		
		//fbls = SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all_page",tempfbl);
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_page_count");
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

	

	public List<DataHlShow> getDhs() {
		return dhs;
	}



	public void setDhs(List<DataHlShow> dhs) {
		this.dhs = dhs;
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
