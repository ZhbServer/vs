package com.vshow.control.kh.cut;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;

public class AjaxGetHzCAction extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Integer urid=(Integer)session.get("urid");
		Integer caveat = (Integer) session.get("caveat");
		if(caveat==null){
			caveat=0;
		}
		Integer hzc=null;
		if(urid!=null){
			User tuser=new User();
			tuser.setId(urid);
			tuser.setCaveat(caveat);
			hzc=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_view_cut_client_hz_count", tuser);
			if(hzc==null){
				hzc=0;
			}
		}
		
		return  GsonUtil.getGson(hzc);
	}

}
