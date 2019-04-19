package com.vshow.control.log;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.UserCheck;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class CountLogLoginListAction extends ActionSupport {
	
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1用户名) 
	private Pages ps;     //分页
    private Integer pagetype=10;  //页码类型(10,20,30)
    private List<UserCheck> userCheckList;  //日志集合
    
    
    
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
		
		
		UserCheck tempUc=new UserCheck();
		//查询当前用户，下级用户的素材
		//templog.setTkey(tkey);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		
		if(sel==0){
			total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_user_check_all_count");
		}else{
			tempUc.setAccount(ser);
		    total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_user_check_account_all_count",tempUc);
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}
		
		tempUc.setStartid((id - 1) * pagetype);
		tempUc.setPagetype(pagetype);
		
		if(sel==0){
			userCheckList=SqlConnect.getSqlMapInstance().queryForList("sel_user_check_all",tempUc);
		}else if(sel==1){
			//tempUc.setUname(ser);
			userCheckList=SqlConnect.getSqlMapInstance().queryForList("sel_user_check_account_all",tempUc);
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
   
    
    
	public List<UserCheck> getUserCheckList() {
		return userCheckList;
	}



	public void setUserCheckList(List<UserCheck> userCheckList) {
		this.userCheckList = userCheckList;
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

	
}
