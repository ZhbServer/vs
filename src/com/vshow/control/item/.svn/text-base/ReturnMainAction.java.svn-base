package com.vshow.control.item;

import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class ReturnMainAction implements Action {

	private int show_menu=0;
	private Integer igid=0;
	private Integer hzc=0;
	private Integer isMax=0;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Integer urid=(Integer)session.get("urid");
		//节目列表
		if(show_menu==1){
			igid=(Integer)session.get("igid");
		    if(igid==null){
		    	igid=0;
		    }
		}else if(show_menu==2){
			igid=(Integer)session.get("igid");
		    if(igid==null){
		    	igid=0;
		    }
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
		return SUCCESS;
	}
	
	public Integer getHzc() {
		return hzc;
	}
	public void setHzc(Integer hzc) {
		this.hzc = hzc;
	}
	
	public Integer getIgid() {
		return igid;
	}
	public void setIgid(Integer igid) {
		this.igid = igid;
	}
	public int getShow_menu() {
		return show_menu;
	}
	public void setShow_menu(int show_menu) {
		this.show_menu = show_menu;
	}
	public Integer getIsMax() {
		return isMax;
	}
	public void setIsMax(Integer isMax) {
		this.isMax = isMax;
	}

}
