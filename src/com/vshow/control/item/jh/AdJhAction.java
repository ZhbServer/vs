package com.vshow.control.item.jh;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdJhAction extends ActionSupport {
	private String jhName;
	
	private Jh jh;
	private int jhid;
	private int jhtype;
	

	

	@Override
	public String execute() throws Exception {
		String result=SUCCESS;
	    int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
	    Integer jhocheck = (Integer)  ActionContext.getContext().getSession().get("jhocheck");
	    jh=new Jh();
		jh.setName(jhName);
		jh.setType(jhtype);
		jh.setUrid(urid);
		if(jhocheck==null){
			jhocheck=2;
		}
		jh.setOcheck(jhocheck);
		//jhid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_jh", jh);
		jhid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_jh2", jh);
		jh.setId(jhid);
		String jhtypeName="";
		if(jhtype==3){
			jhtypeName=Constant.LOCAL.getA00646();
		}else if(jhtype==1){
			result= "success2";
			jhtypeName=Constant.LOCAL.getA00647();
		}else if(jhtype==2){
			result= "success3";
			jhtypeName=Constant.LOCAL.getA00648();
		}else if(jhtype==4){
			result= "success4";
			jhtypeName=Constant.LOCAL.getB00310();
		}
		//添加日志
		//LogHandle.insertTheLog(LogType.type15, urid,Constant.LOCAL.getA00650()+"["+jhtypeName+"]:" +jhName, 1,1);
		
		return result;
	}
	
	public int getJhtype() {
		return jhtype;
	}

	public void setJhtype(int jhtype) {
		this.jhtype = jhtype;
	}
	
	public int getJhid() {
		return jhid;
	}

	public void setJhid(int jhid) {
		this.jhid = jhid;
	}
	
	public Jh getJh() {
		return jh;
	}

	public void setJh(Jh jh) {
		this.jh = jh;
	}

	public String getJhName() {
		return jhName;
	}
	public void setJhName(String jhName) {
		this.jhName = jhName;
	}
}
