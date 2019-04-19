package com.vshow.control.interfaces.view;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Notice;
import com.vshow.control.interfaces.DllTxt;
import com.vshow.control.tool.SqlConnect;

public class ToUpDataAction extends ActionSupport {
	
	
	private int did;
	
	private String bcolor;//背景颜色
	private String txtcontent; //文本内容
	private int fs;     //字体大小
	private String  fcolor;//字体颜色
	
	private int mDirection=2;//2静态文本0向上滚动1向左滚动3向下滚动

	@Override
	public String execute() throws Exception {
		if (did != 0) {
			
			DllTxt dllTxt = (DllTxt) SqlConnect.getSqlMapInstance().queryForObject(
					"see_data_id", did);
			
			bcolor=dllTxt.getBcolor();
			txtcontent=dllTxt.getTxtcontent();
			fs=dllTxt.getFs();
			fcolor=dllTxt.getFcolor();
			mDirection=dllTxt.getmDirection();
			
			
		}
		return SUCCESS;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
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
