package com.vshow.control.index;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.AllMark;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToNoEnterClientAction extends ActionSupport {
	private List noclients;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
    private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
    private String info;

    private String ip; 
    private String openIntro; 
	public String getOpenIntro() {
		return openIntro;
	}

	public void setOpenIntro(String openIntro) {
		this.openIntro = openIntro;
	}
	

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
	    ip=Constant.IP;
		// 判断当前页数
		if (id <= 0) {
			id = 1;
		}
		
		AllMark amk=new AllMark();
		amk.setStartid((id - 1) * pagetype);
		amk.setPagetype(pagetype);
		
		
		noclients=SqlConnect.getSqlMapInstance().queryForList(
				"sel_unclient", amk);
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_unclient_count");
		
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public List getNoclients() {
		return noclients;
	}

	public void setNoclients(List noclients) {
		this.noclients = noclients;
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
