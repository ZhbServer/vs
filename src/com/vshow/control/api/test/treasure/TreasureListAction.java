package com.vshow.control.api.test.treasure;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

/*
 *宝箱活动数据以及分页
 */

public class TreasureListAction extends BaseAction {
	
	private List<Treasure> Tres;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1节目名)
    private Pages ps;     //分页

	private Integer pagetype=10;  //页码类型(10,20,30)
		
	private Treasure treasure; 
	
	
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		String creator=(String) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_user", uid);//创建人
				
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
		
		
		//搜索查询
		if (sel == 0) {//查询全部
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_all_page_count",creator);			
		} else if (sel == 1) {//活动名
			String name=ser;	
			total = (Integer)SqlConnect.getSqlMapInstance().queryForObject("go_treasure_name_page",creator, name);
		}else if (sel == 2) {//活动状态
			String ban=ser;									
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_ban_page",creator, ban);
		}else if (sel == 3) {//上线状态
			String onStatus=ser;						
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_onStatus_page",creator,onStatus);
		}
							
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}
		
		Treasure Tre=new Treasure();				
		Tre.setStartid((id - 1) * pagetype);
		Tre.setPagetype(pagetype);
		Tre.setCreator(creator);
		//搜索查询
		if (sel == 0) {//查询全部
			Tres = SqlConnect.getSqlMapInstance().queryForList("go_treasure_all",Tre);
		} else if (sel == 1) {//活动名
			Tre.setTreasureName(ser);				
			Tres = SqlConnect.getSqlMapInstance().queryForList("go_treasure_name", Tre);
		}else if (sel == 2) {//活动状态			
			Tre.setBan(ser);
			Tres = SqlConnect.getSqlMapInstance().queryForList("go_treasure_ban", Tre);
		}else if (sel == 3) {//上线状态			
			Tre.setOnStatus(ser);
			Tres = SqlConnect.getSqlMapInstance().queryForList("go_treasure_onStatus", Tre);
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


	public List<Treasure> getTres() {
		return Tres;
	}


	public void setTres(List<Treasure> tres) {
		Tres = tres;
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


	public Treasure getTreasure() {
		return treasure;
	}


	public void setTreasure(Treasure treasure) {
		this.treasure = treasure;
	}
	
	

}
