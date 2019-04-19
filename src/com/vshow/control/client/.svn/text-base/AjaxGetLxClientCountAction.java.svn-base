package com.vshow.control.client;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;
import com.vshow.control.data.ClientWarningItem;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;

public class AjaxGetLxClientCountAction extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Integer urid=(Integer)session.get("urid");
		
		
		Integer lxOut=null;
		if(urid!=null){
		
			User tuser=new User();
			tuser.setId(urid);
			lxOut=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_lxclinet_count", tuser);
			if(lxOut==null){
				lxOut=0;
			}
		}
		
		return  GsonUtil.getGson(lxOut);
	}

}
