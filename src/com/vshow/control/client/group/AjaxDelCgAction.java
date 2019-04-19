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
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxDelCgAction implements Action{
	
	// 终端分组id;
	private String tid;

	@Override
	public String execute() throws Exception {
	    
		 //获取当前用户
		 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		 
		 String gid="";
		 ClientGroup cg = (ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id",Integer.parseInt(tid));
		 if(cg==null){
			 
		 }else{
			 List<ClientGroup> cglist = SqlConnect.getSqlMapInstance().queryForList("sel_all_bytkey",cg.getTkey());//查询当前组下所有关联分组
			 for (int i = 0; i < cglist.size(); i++) {
				 gid = gid+cglist.get(i).getId()+",";//储存所有分组id
				 //删除分组
				 SqlConnect.getSqlMapInstance().delete("del_cg",cglist.get(i).getId());
				 
				 LogHandle.insertTheLog(LogType.type84, urid,Constant.LOCAL.getA00243()+cglist.get(i).getGname(), 1,1);
			 }
			 
			 String[] gids = gid.split(",");
			 for (int i = 0; i < gids.length; i++) {
				 List<ClientGroupRelation> cgrlist = (List<ClientGroupRelation>)SqlConnect.getSqlMapInstance().queryForList("sel_cgr_gid",Integer.parseInt(gids[i]));
				 for (int j = 0; j < cgrlist.size(); j++) {
					 ClientGroupRelation cgr = cgrlist.get(j);
					 SqlConnect.getSqlMapInstance().update("update_cgr_id_init",cgr.getId());
				}
			 }
		 }
		 
		 return GsonUtil.getGson("");
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

}
