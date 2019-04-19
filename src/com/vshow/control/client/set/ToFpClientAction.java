package com.vshow.control.client.set;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToFpClientAction implements Action {

	private List<Client> clients;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1文件名,用户名)
	private Pages ps; // 分页
	private Integer pagetype = 10; // 页码类型(10,20,30)
	private int curruserid; // 选择用户

	@Override
	public String execute() throws Exception {

		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
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
		ClientGroupRelation cgr = new ClientGroupRelation();
		cgr.setUid(urid);

		if (sel == 0) {
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
					"sel_client_page_fp_count", cgr);
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		cgr.setStartid((id - 1) * pagetype);
		cgr.setPagetype(pagetype);

		if (sel == 0) {
			clients = (List<Client>) SqlConnect.getSqlMapInstance()
					.queryForList("sel_client_page_fp", cgr);
		}

		for (int i = 0; i < clients.size(); i++) {
			cgr = new ClientGroupRelation();
			int clientid = clients.get(i).getId();
			cgr.setCid(clientid);
			cgr.setUid(curruserid);

			Integer cid = (Integer) SqlConnect.getSqlMapInstance()
					.queryForObject("sel_cgr_cig_by_uid", cgr);
			if (cid != null) {
				clients.get(i).setFenpei(Constant.LOCAL.getA00453());
			} else {
				clients.get(i).setFenpei(Constant.LOCAL.getA00454());
			}
		}

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

	public List<Client> getClients() {
		return clients;
	}

	public void setClients(List<Client> clients) {
		this.clients = clients;
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

	public int getCurruserid() {
		return curruserid;
	}

	public void setCurruserid(int curruserid) {
		this.curruserid = curruserid;
	}

}
