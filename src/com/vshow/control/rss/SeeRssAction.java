package com.vshow.control.rss;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Fbl;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Rss;
import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class SeeRssAction implements Action {

	private List<Rss> rsss;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private Pages ps; // 分页
	private Integer pagetype = 10; // 页码类型(10,20,30)

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

		if (id <= 0) {
			id = 1;
		}

		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_rss_all_page_count");
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		Rss temprss = new Rss();
		temprss.setStartid((id - 1) * pagetype);
		temprss.setPagetype(pagetype);

		rsss = SqlConnect.getSqlMapInstance().queryForList("sel_rss_all_page",
				temprss);
		subStringList(rsss);

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

	// 截取字符串

	public void subStringList(List<Rss> list) {
		for (Rss rss : list) {
			if (rss.getContent() != null) {
				int loglen = rss.getContent().length();
				if (loglen >= 15) {
					rss.setContentsub((rss.getContent().substring(0, 14) + "..."));
				} else {
					rss.setContentsub(rss.getContent());
				}
			}
		}
	}

	public List<Rss> getRsss() {
		return rsss;
	}

	public void setRsss(List<Rss> rsss) {
		this.rsss = rsss;
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
