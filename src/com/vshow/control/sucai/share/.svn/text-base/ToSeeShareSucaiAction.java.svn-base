package com.vshow.control.sucai.share;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.ScShare;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToSeeShareSucaiAction implements Action {

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页

	private Pages ps; // 分页
	private Integer pagetype = 9; // 页码类型(9,20,30)

	private List<Sucai> listsc; // 素材集合

	private ScShare scshare;
	private int type;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

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
		if(type == 0){
			type = (Integer)session.get("type");
		}else{
			session.put("type", type);
		}

		// 起始页,页码类型,分组id
		// 当前页码
		if (id <= 0) {
			id = 1;
		}

		scshare = new ScShare();
		scshare.setStartid((id - 1) * pagetype);
		scshare.setPagetype(pagetype);
		scshare.setTkey(tkey);
		scshare.setUserid(uid);
		scshare.setType(type);

		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_scshare_page_count", scshare);

		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
			scshare.setPagetype(pagetype);
		}

		listsc = SqlConnect.getSqlMapInstance().queryForList(
				"sel_scshare_page", scshare);
		
		if(listsc.size() > 0){
			for (int i = 0; i < listsc.size(); i++) {
				Sucai sc = new Sucai();
				sc = listsc.get(i);
				if(sc.getType() == 3){
					sc.setVideo_img(sc.getFilename().substring(0, sc.getFilename().lastIndexOf('.')) + "_.jpg");
				}
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

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}

	public List<Sucai> getListsc() {
		return listsc;
	}

	public void setListsc(List<Sucai> listsc) {
		this.listsc = listsc;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
