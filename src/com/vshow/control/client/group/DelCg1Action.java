package com.vshow.control.client.group;

import java.util.List;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelCg1Action implements Action{
	
	// 终端分组id;
	private int[] qx;
	private int pagetype=10;  //页码类型(10,20,30)
	

	@Override
	public String execute() throws Exception {
	    
		 //获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 
		 String tempCg1name="";
		 String tempCg2name="";
		 String tempCg3name="";
		 ClientGroupRelation cgr;
		 List<ClientGroup> cg2s;
		 List<ClientGroup> cg3s;
		 for (int i = 0; i < qx.length; i++) {
			 
			 if(tempCg1name.length()==0){
				 tempCg1name=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_gname", qx[i]);
			 }else{
				 tempCg1name=tempCg1name+","+(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_gname", qx[i]);
			 }
			 
			 //获取当前一级分组下面的二级分组对象
			 cg2s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid", qx[i]);
			 for (ClientGroup cg2 : cg2s) {
				 
				//获取当前二级分组下面的三级分组对象
				 cg3s=SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid", cg2.getId());
				 for (ClientGroup cg3 : cg3s) {
					 if(tempCg3name.length()==0){
						 tempCg3name=cg3.getGname();
					 }else{
						 tempCg3name=tempCg3name+","+cg3.getGname();
					 }
					
					 
					//删除终端分组关系
					 SqlConnect.getSqlMapInstance().delete("del_cgr_gid",cg3.getId());
					 
					 //删除分组
					 SqlConnect.getSqlMapInstance().delete("del_cg",cg3.getId());
				
				 }
				 
				 
				 
				 
				 if(tempCg2name.length()==0){
					 tempCg2name=cg2.getGname();
				 }else{
					 tempCg2name=tempCg2name+","+cg2.getGname();
				 }
				
				 
				//删除终端分组关系
				 SqlConnect.getSqlMapInstance().delete("del_cgr_gid",cg2.getId());
				 
				 //删除分组
				 SqlConnect.getSqlMapInstance().delete("del_cg",cg2.getId());
				 
				 
			
			}
			 
	
			 

			 
			 
			//删除终端分组关系
			 SqlConnect.getSqlMapInstance().delete("del_cgr_gid",qx[i]);
			 
			 //删除分组
			 SqlConnect.getSqlMapInstance().delete("del_cg",qx[i]);
			 
		
		}
		 
		 LogHandle.insertTheLog(LogType.type84, urid,Constant.LOCAL.getA00243()+"[1]:" + tempCg1name+"[2]:"+tempCg2name+"[3]:"+tempCg3name, 1,1);
		 
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
