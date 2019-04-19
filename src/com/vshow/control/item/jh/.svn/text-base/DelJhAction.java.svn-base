package com.vshow.control.item.jh;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class DelJhAction implements Action {

	
	private int[] qx;
	private int jhtype;
	
	
	@Override
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		String jhnames="";
		String tempjhname="";
		Jh tempJh;
		
		//计划id
		for (int i = 0; i < qx.length; i++) {
			tempjhname=(String)SqlConnect.getSqlMapInstance().queryForObject("see_jh_name",qx[i]);
			if(jhnames.length()==0){
				jhnames=tempjhname;
			}else{
				jhnames=jhnames+","+tempjhname;
			}
			
			tempJh=new Jh();
			tempJh.setType(jhtype);
			tempJh.setId(qx[i]);
			SqlConnect.getSqlMapInstance().delete("del_jh", tempJh);
		}
		//添加日志
		LogHandle.insertTheLog(LogType.type16, urid,Constant.LOCAL.getA00651()+"["+Constant.LOCAL.getA00646()+"]:" +jhnames, 1,1);
		
		return SUCCESS;
	}
	public int[] getQx() {
		return qx;
	}
	public void setQx(int[] qx) {
		this.qx = qx;
	}
	public int getJhtype() {
		return jhtype;
	}
	public void setJhtype(int jhtype) {
		this.jhtype = jhtype;
	}
	
 

}
