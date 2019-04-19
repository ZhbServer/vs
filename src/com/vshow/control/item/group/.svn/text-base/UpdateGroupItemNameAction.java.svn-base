package com.vshow.control.item.group;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ItemGroup;
import com.vshow.control.data.ScGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class UpdateGroupItemNameAction extends ActionSupport {
	
	
	private String uscgname;
	private int itemgid;
	
	
	private int id; // 当前页数
	private int pagetype=9;  //页码类型(9,20,30)

	

	

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		
	    ItemGroup scg=new ItemGroup();
	    scg.setId(itemgid);
	    scg.setName(uscgname);
	    SqlConnect.getSqlMapInstance().update("upd_itemgroup_name_id", scg);
	    
	  
	    
	    LogHandle.insertTheLog(LogType.type4, urid, Constant.LOCAL.getA00390()+":" + uscgname, 1,1);
	    
	    return SUCCESS;
	}
	
	
	
	
	public void setUscgname(String uscgname) {
		this.uscgname = uscgname;
	}
	
	
	public int getItemgid() {
		return itemgid;
	}




	public void setItemgid(int itemgid) {
		this.itemgid = itemgid;
	}




	public String getUscgname() {
		return uscgname;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
}
