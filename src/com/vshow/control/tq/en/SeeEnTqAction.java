package com.vshow.control.tq.en;

import java.util.List;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Tq;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class SeeEnTqAction implements Action {
	private List<Tq> entqs;
	public List<Tq> getEntqs() {
		return entqs;
	}

	public void setEntqs(List<Tq> entqs) {
		this.entqs = entqs;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

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
		Tq temptq=new Tq();
		temptq.setStartid((id - 1) * pagetype);
		temptq.setPagetype(pagetype);
		
		
		entqs = SqlConnect.getSqlMapInstance().queryForList("sel_tq_en_all_page",temptq);
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_tq_en_all_page_count");
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

}
