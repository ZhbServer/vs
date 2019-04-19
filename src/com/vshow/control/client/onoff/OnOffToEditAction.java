package com.vshow.control.client.onoff;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ShutNew;
import com.vshow.control.tool.Local;

public class OnOffToEditAction implements Action {

	
	private String selonoff;
	
	private int editHh;//时
	private int editMm;//分
	private int editType;//类型
	
	
	private int editZq1;// 周一
	private int editZq2;// 周二
	private int editZq3;// 周三
	private int editZq4;// 周四
	private int editZq5;// 周五
	private int editZq6;// 周六
	private int editZq7;// 周日
	private int editZq8;// 每天
	
	public String execute() throws Exception {
		
		//周期_类型_stime:etime
		
		String selofs[]=selonoff.split("\\_");
		
		if(selofs.length==3){
			
			//editZq=Integer.parseInt(selofs[0]);
			
			String zqs[]=selofs[0].split("\\|");
			Integer zq;
			for (int i = 0; i < zqs.length; i++) {
				 zq=Integer.parseInt(zqs[i]);
				  
				   switch (zq) {
				   
				       case 1:
				             editZq1=1;
					         break;
				       case 2:
					         editZq2=2;
						     break;
				       case 3:
					         editZq3=3;
						     break;
				       case 4:
					         editZq4=4;
						     break;
				       case 5:
					         editZq5=5;
						     break;
				       case 6:
					         editZq6=6;
						     break;
				       case 7:
					         editZq7=7;
						     break;
				       case 8:
					         editZq8=8;
						     break;

				     
				   } 
			}
			
			editType=Integer.parseInt(selofs[1]);
			
			String hms[]=selofs[2].split("\\:");
			
			if(hms.length==2){
				editHh=Integer.parseInt(hms[0]);
				editMm=Integer.parseInt(hms[1]);
			}
		}
		
		return SUCCESS;
	}

	

	public int getEditZq1() {
		return editZq1;
	}



	public void setEditZq1(int editZq1) {
		this.editZq1 = editZq1;
	}



	public int getEditZq2() {
		return editZq2;
	}



	public void setEditZq2(int editZq2) {
		this.editZq2 = editZq2;
	}



	public int getEditZq3() {
		return editZq3;
	}



	public void setEditZq3(int editZq3) {
		this.editZq3 = editZq3;
	}



	public int getEditZq4() {
		return editZq4;
	}



	public void setEditZq4(int editZq4) {
		this.editZq4 = editZq4;
	}



	public int getEditZq5() {
		return editZq5;
	}



	public void setEditZq5(int editZq5) {
		this.editZq5 = editZq5;
	}



	public int getEditZq6() {
		return editZq6;
	}



	public void setEditZq6(int editZq6) {
		this.editZq6 = editZq6;
	}



	public int getEditZq7() {
		return editZq7;
	}



	public void setEditZq7(int editZq7) {
		this.editZq7 = editZq7;
	}



	public int getEditZq8() {
		return editZq8;
	}



	public void setEditZq8(int editZq8) {
		this.editZq8 = editZq8;
	}



	public int getEditHh() {
		return editHh;
	}



	public void setEditHh(int editHh) {
		this.editHh = editHh;
	}



	public int getEditMm() {
		return editMm;
	}



	public void setEditMm(int editMm) {
		this.editMm = editMm;
	}



	public int getEditType() {
		return editType;
	}



	public void setEditType(int editType) {
		this.editType = editType;
	}



	
	public String getSelonoff() {
		return selonoff;
	}



	public void setSelonoff(String selonoff) {
		this.selonoff = selonoff;
	}
	
}
