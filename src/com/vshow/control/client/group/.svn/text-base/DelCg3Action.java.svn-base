package com.vshow.control.client.group;

import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelCg3Action implements Action{
	
	// 终端分组id;
	private int[] qx;
	private int pagetype=10;  //页码类型(10,20,30)
	

	@Override
	public String execute() throws Exception {
	    
		 //获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 
		 String tempCg3name="";
		 ClientGroupRelation cgr;
		 for (int i = 0; i < qx.length; i++) {
			 
			 //获取当前用户下面三级分组名
			 if(tempCg3name.length()==0){
				 tempCg3name=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_gname", qx[i]);
			 }else{
				 tempCg3name=tempCg3name+","+(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_gname", qx[i]);
			 }
					
			 //删除终端分组关系
			 SqlConnect.getSqlMapInstance().delete("del_cgr_gid",qx[i]);
			 
			 //删除分组
			 SqlConnect.getSqlMapInstance().delete("del_cg",qx[i]);
		}
		 
		 LogHandle.insertTheLog(LogType.type84, urid,Constant.LOCAL.getA00243()+"[3]:" + tempCg3name, 1,1);
		 
		 return SUCCESS;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	
}
