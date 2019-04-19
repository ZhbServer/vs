package com.vshow.control.statics;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Pages;
import com.vshow.control.data.SucaiPlayCount;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import java.util.Calendar;

public class ToSeePlayCountInfoAction implements Action {

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private Pages ps; // 分页
	private Integer pagetype; // 页码类型(10,20,30)
	private String stype = ""; // 素材类型
	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String mark = ""; //终端名
	private String name = ""; //节目名
	private String sname = ""; //素材名

	private List<SucaiPlayCount> spcList;
	private SucaiPlayCount spc;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

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
		
		// 当前页码 
		if (id <= 0) {
			id = 1;
		}

		spc = new SucaiPlayCount();
		spc.setStype(Integer.parseInt(stype));
		spc.setBtime(btime);
		spc.setEtime(etime);
		spc.setMark(mark);
		spc.setName(name);
		spc.setSname(sname);

		total = (Integer) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_between_bitem_etime_count", spc);

		if (pagetype == -1) {
			pagetype = total;
		}

		spc.setStartid((id - 1) * pagetype);
		spc.setPagetype(pagetype);

		spcList = SqlConnect.getSqlMapInstance().queryForList(
				"sel_between_bitem_etime", spc);

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

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public List<SucaiPlayCount> getSpcList() {
		return spcList;
	}

	public void setSpcList(List<SucaiPlayCount> spcList) {
		this.spcList = spcList;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
}
