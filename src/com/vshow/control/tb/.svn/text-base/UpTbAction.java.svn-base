package com.vshow.control.tb;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Tb;
import com.vshow.control.tool.SqlConnect;

public class UpTbAction extends ActionSupport {
	
	
    private String title;
    
	private int w;
	
	private int h;
	
	private int l;
	
	public int getTbId() {
		return tbId;
	}

	public void setTbId(int tbId) {
		this.tbId = tbId;
	}

	private int t;
	
	private int mType;  //0图片  1网址
	
	private String mUrl; //播放地址
	
	private long mTimeout; // 0不刷新  -1 io口刷新
	
	private int tbId;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		Tb tb=new Tb();
		tb.setTitle(title);
		tb.setL(l);
		tb.setT(t);
		tb.setW(w);
		tb.setH(h);
		tb.setmType(mType);
		tb.setmUrl(mUrl);
		tb.setmTimeout(mTimeout);
		tb.setUid(uid);
		
		if(tbId==0){
			SqlConnect.getSqlMapInstance().insert("insert_tb", tb);	
		}else{
			tb.setId(tbId);
			SqlConnect.getSqlMapInstance().update("up_tb",tb);
			
		}
		
		
		return SUCCESS;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getW() {
		return w;
	}

	public void setW(int w) {
		this.w = w;
	}

	public int getH() {
		return h;
	}

	public void setH(int h) {
		this.h = h;
	}

	public int getL() {
		return l;
	}

	public void setL(int l) {
		this.l = l;
	}

	public int getT() {
		return t;
	}

	public void setT(int t) {
		this.t = t;
	}

	public int getmType() {
		return mType;
	}

	public void setmType(int mType) {
		this.mType = mType;
	}

	public String getmUrl() {
		return mUrl;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}

	public long getmTimeout() {
		return mTimeout;
	}

	public void setmTimeout(long mTimeout) {
		this.mTimeout = mTimeout;
	}
}
