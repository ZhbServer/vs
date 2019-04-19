package com.vshow.control.client.group;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class SeeClientGroup1ListAction implements Action {

	

	private List<ClientGroup> cg1s;
	

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
    private Pages ps;     //分页
    private Integer pagetype=10;  //页码类型(10,20,30)

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		//分页类型存入session
		if(pagetype==null){
			
			//查看session是否有分页类型 null择默认10条显示
			Integer publicPagetype=(Integer)session.get("publicPagetype");
			if(publicPagetype==null){
				session.put("publicPagetype", 10);
				pagetype=10;
			}else{
				pagetype=publicPagetype;
			}
		}else{
			session.put("publicPagetype", pagetype);
		}
		
		if (id <= 0) {
			id = 1;
		}
		//获取当前用户
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		ClientGroup cg1=new ClientGroup();
		cg1.setUid(urid);
		cg1.setLevel(1);
		
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_cg_page_count",cg1);
		//获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if(pagetype==-1){
			pagetype=total;
		}
		
		cg1.setStartid((id - 1) * pagetype);
		cg1.setPagetype(pagetype);
		
		cg1s = SqlConnect.getSqlMapInstance().queryForList("sel_cg_page",cg1);
		
		if(pagetype==0){
		}else{
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
		
		//查询当前分组总个数
		Integer ccount;
		ClientGroupRelation cgr;
		for (ClientGroup fcg1 : cg1s) {
			cgr=new ClientGroupRelation();
			cgr.setGtype(1);
			cgr.setGid(fcg1.getId());
			ccount=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_cgr_gtype_ccount", cgr);
			fcg1.setGclientc(ccount);
		}
		
		return SUCCESS;
	}

	public List<ClientGroup> getCg1s() {
		return cg1s;
	}

	public void setCg1s(List<ClientGroup> cg1s) {
		this.cg1s = cg1s;
	}

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
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