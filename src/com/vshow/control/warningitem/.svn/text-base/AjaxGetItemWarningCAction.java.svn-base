package com.vshow.control.warningitem;

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

public class AjaxGetItemWarningCAction extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Integer urid=(Integer)session.get("urid");
		
		
		Integer hzc=null;
		if(urid!=null){
		
			ClientWarningItem clientWarningItem=new ClientWarningItem();
			clientWarningItem.setUid(urid);
			
			hzc = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_warning_item_list_count", clientWarningItem);
			if(hzc==null){
				hzc=0;
			}
		}
		
		return  GsonUtil.getGson(hzc);
	}

}
