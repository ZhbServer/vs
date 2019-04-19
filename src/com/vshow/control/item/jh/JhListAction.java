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
import com.vshow.control.data.Jh;
import com.vshow.control.data.JhItem;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class JhListAction implements Action {

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1节目名) 
	private Pages ps;     //分页
    private Integer pagetype=10;  //页码类型(10,20,30)

	private List<Jh> jhs;
	private int jhtype=3;
	
	private int jhid; 
	
	private int requestType=0;  //请求方式 1提交保存计划
	
	private String validityXdate;
	
	public int getRequestType() {
		return requestType;
	}

	public void setRequestType(int requestType) {
		this.requestType = requestType;
	}

	public String getValidityXdate() {
		return validityXdate;
	}

	public void setValidityXdate(String validityXdate) {
		this.validityXdate = validityXdate;
	}

	public int getJhid() {
		return jhid;
	}

	public void setJhid(int jhid) {
		this.jhid = jhid;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		
		if(jhtype==1||jhtype==2){
			
			Integer jhItemCount=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_jh_items_count",jhid);
			//删除为空的当前计划
			if(jhItemCount==0){
				SqlConnect.getSqlMapInstance().delete("del_jh_id", jhid);
			}
			
			if(jhtype==2&&requestType==1){
			   
				
				JhItem jhItem=new JhItem();
				jhItem.setJhid(jhid);
				jhItem.setXiadate(validityXdate);
				
				SqlConnect.getSqlMapInstance().update("upd_jhitem_xiadata", jhItem);
				
				
			}
			
		}
		
		
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
		
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		Jh jh=new Jh();
		jh.setType(jhtype);
		jh.setUrid(uid);
		
		if(sel==0){
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("see_jh_page_count", jh);
		}
		//获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if(pagetype==-1){
			pagetype=total;
		}
		
        jh.setStartid((id - 1) * pagetype);
		jh.setPagetype(pagetype);
		if(sel==0){
			jhs=SqlConnect.getSqlMapInstance().queryForList("see_jh_page", jh);
		}else if(sel==1){
			
		}
		
		Integer jhitemc;
		for (Jh tjh : jhs) {
			jhitemc=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_jh_items_count",tjh.getId());
			tjh.setJhitemc(jhitemc);
		}
		
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
		
		String result=SUCCESS;
		if(jhtype==1){
			result= "success2";
		}else if(jhtype==2){
			result= "success3";
		}else if(jhtype==4){
			result= "success4";
		}
		return result;
		
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

	public List<Jh> getJhs() {
		return jhs;
	}

	public void setJhs(List<Jh> jhs) {
		this.jhs = jhs;
	}
	public int getJhtype() {
		return jhtype;
	}

	public void setJhtype(int jhtype) {
		this.jhtype = jhtype;
	}

	

	
}
