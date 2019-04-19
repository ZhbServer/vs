package com.vshow.control.init;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;
import com.vshow.control.data.ClientWarningItem;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;

public class LoginMainAction extends ActionSupport {
	
	private Integer hzc=0;
	
	private Integer wic=0;
	
	private Integer lxOut=0;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Object urname_obj=session.get("urname");
		Integer urid=(Integer)session.get("urid");
		if(urname_obj==null){
			
			session.put("error", Constant.LOCAL.getA00561());
			
			session.put("url", "tologin.vs");
			
			session.put("creturn", "login");
			
			return ERROR;
		}else{
			session.put("creturn", "success");
			
		}
		
		Integer caveat = (Integer) session.get("caveat");
		if(caveat==null){
			caveat=0;
		}
		
		if(new VVersion().cutt.equals("1")){
			User tuser=new User();
			tuser.setId(urid);
			tuser.setCaveat(caveat);
			hzc=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_view_cut_client_hz_count", tuser);
			if(hzc==null){
				hzc=0;
			}
		}
		
		
		if(new VVersion().clientLxOnOff.equals("1")){
			User tuser=new User();
			tuser.setId(urid);
			lxOut=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_lxclinet_count", tuser);
			if(lxOut==null){
				lxOut=0;
			}
		}
		
		
		if(new VVersion().warningitemOnOff.equals("1")){
			
			ClientWarningItem clientWarningItem=new ClientWarningItem();
			clientWarningItem.setUid(urid);
			
			wic = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_warning_item_list_count", clientWarningItem);
			if(wic==null){
				wic=0;
			}
			
			
		}
		
		return SUCCESS;
	}
	public Integer getLxOut() {
		return lxOut;
	}
	public void setLxOut(Integer lxOut) {
		this.lxOut = lxOut;
	}
	public Integer getWic() {
		return wic;
	}
	public void setWic(Integer wic) {
		this.wic = wic;
	}
	public Integer getHzc() {
		return hzc;
	}
	public void setHzc(Integer hzc) {
		this.hzc = hzc;
	}
	
	
	
}
