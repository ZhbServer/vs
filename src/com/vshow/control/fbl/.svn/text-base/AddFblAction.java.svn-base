package com.vshow.control.fbl;


import java.util.List;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AddFblAction implements Action {
    private Fbl fbl;
	
    private int subType=0;

	public String execute() throws Exception {
	    int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		SqlConnect.getSqlMapInstance().insert("add_fbl",fbl);
		LogHandle.insertTheLog(LogType.type59, urid,Constant.LOCAL.getA00174()+":" + fbl.getName(), 1,1);
		if(subType==1){
			//获取全部fel
			List<Fbl> fbls=SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all");
			
			return GsonUtil.getGson(fbls);
		}
		return SUCCESS;
	}
	
	public int getSubType() {
		return subType;
	}

	public void setSubType(int subType) {
		this.subType = subType;
	}

	public Fbl getFbl() {
		return fbl;
	    }

		public void setFbl(Fbl fbl) {
			this.fbl = fbl;
		}


}
