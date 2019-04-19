package com.vshow.control.interfaces.view;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.Notice;
import com.vshow.control.data.NoticeJh;
import com.vshow.control.data.NoticeJhRelation;
import com.vshow.control.data.Record;
import com.vshow.control.interfaces.DllTxt;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;

public class DataAddAction extends ActionSupport {

	

	public int getDid() {
		return did;
	}


	public void setDid(int did) {
		this.did = did;
	}


	private String bcolor;//背景颜色
	private String txtcontent; //文本内容
	private int fs;     //字体大小
	private String  fcolor;//字体颜色
	private int mDirection=2;//2静态文本0向上滚动1向左滚动3向下滚动
	
	private int did;
	
	public String execute() throws Exception {
		

		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		Local local= (Local) session.get("local");
		
		int uid = (Integer) session.get("urid");

		DllTxt dllTxt=new DllTxt();
		
		dllTxt.setBcolor(bcolor);
		
		dllTxt.setFcolor(fcolor);
		
		dllTxt.setFs(fs);
		
		dllTxt.setmDirection(mDirection);
		
		dllTxt.setTxtcontent(txtcontent);
		
		dllTxt.setUid(uid);

		
		if(did==0){
			
			sm.insert("insert_data", dllTxt);
		
		}else{
			dllTxt.setId(did);
			sm.update("update_data", dllTxt);
			
		}
		
		return SUCCESS;
	}


	public String getBcolor() {
		return bcolor;
	}


	public void setBcolor(String bcolor) {
		this.bcolor = bcolor;
	}


	public String getTxtcontent() {
		return txtcontent;
	}


	public void setTxtcontent(String txtcontent) {
		this.txtcontent = txtcontent;
	}


	public int getFs() {
		return fs;
	}


	public void setFs(int fs) {
		this.fs = fs;
	}


	public String getFcolor() {
		return fcolor;
	}


	public void setFcolor(String fcolor) {
		this.fcolor = fcolor;
	}


	public int getmDirection() {
		return mDirection;
	}


	public void setmDirection(int mDirection) {
		this.mDirection = mDirection;
	}

	





}
