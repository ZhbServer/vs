package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class MoveClientAction implements Action {

	private String curruserid[]; // 已选分组(id,分组类型 )

	private String cidsstr; // 已选终端id,多个以"_"隔开
	
	private int info; //返回信息

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
      
        try {
        	if(curruserid.length==1){
            	String currs[]=curruserid[0].split("\\,");
            	if(currs.length==2){
            		ClientGroupRelation cgr=new ClientGroupRelation();
        			cgr.setUid(uid);
            		cgr.setGid(Integer.parseInt(currs[0]));
        			cgr.setGtype(Integer.parseInt(currs[1]));
            		//分割终端
            		String cids[]=cidsstr.split("\\_");
            		for (int i = 0; i < cids.length; i++) {
            		    cgr.setCid(Integer.parseInt(cids[i]));
            			//获取当前终端所在分组
            			SqlConnect.getSqlMapInstance().update("update_cgr",cgr);
            			//SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
    				}
            		
            	}
            }
        	info = 1;
		} catch (Exception e) {
			info = 0;
			e.printStackTrace();
		}
        
		return SUCCESS;
	}

	public String[] getCurruserid() {
		return curruserid;
	}

	public void setCurruserid(String[] curruserid) {
		this.curruserid = curruserid;
	}

	public String getCidsstr() {
		return cidsstr;
	}

	public void setCidsstr(String cidsstr) {
		this.cidsstr = cidsstr;
	}

	public int getInfo() {
		return info;
	}

	public void setInfo(int info) {
		this.info = info;
	}
	
}
