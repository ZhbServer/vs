package com.vshow.control.sucai.share;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.ScShare;
import com.vshow.control.tool.SqlConnect;

public class DelShareSucaiAction implements Action {

	private String scid;
	private String shareid;
	
	private int id; // 当前页数
	private int pagetype=9;  //页码类型(9,20,30)
   
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		shareid = shareid.substring(0,shareid.length()-1);
		
		String [] scArry = scid.split(",");
		String [] shareArry = shareid.split(",");
		for (int i = 0; i < scArry.length; i++) {
			for (int j = 0; j < shareArry.length; j++) {
				String [] share;
				String newshare="";
				ScShare scshare = new ScShare();
				scshare.setTkey(tkey);
				scshare.setUserid(urid);
				scshare.setScid(Integer.parseInt(scArry[i]));
				scshare.setShareid(shareArry[j]);
				ScShare old_scshare = (ScShare)SqlConnect.getSqlMapInstance().queryForObject("sel_all_shareid",scshare);
				if(old_scshare != null && old_scshare.getShareid().length() > 0){
					share = old_scshare.getShareid().split(",");
					for (int k = 0; k < share.length; k++) {
						if(!share[k].equals(shareArry[j])){
							newshare += share[k]+",";
						}
					}
					if(newshare.length()>1){//当前shareid 包含修改记录，等于shareid删除记录
						ScShare up_scshare = new ScShare();
						up_scshare.setId(old_scshare.getId());
						up_scshare.setShareid(newshare.substring(0,newshare.length()-1));
						SqlConnect.getSqlMapInstance().update("up_scshare",up_scshare);
					}else{
						SqlConnect.getSqlMapInstance().delete("del_scshare",old_scshare.getId());
					}
				}
			}
		}
		
		return SUCCESS;
		
	}
	
	public String getScid() {
		return scid;
	}

	public void setScid(String scid) {
		this.scid = scid;
	}

	public String getShareid() {
		return shareid;
	}

	public void setShareid(String shareid) {
		this.shareid = shareid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
