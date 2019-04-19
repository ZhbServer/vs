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

public class OnOffDelToAction implements Action {

	private String task;
	private String selonoff;
	private List ls;
    private String clientids;
	private String cgids; 

	
	
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		Local local= (Local) session.get("local");
		ls = new ArrayList();
		if (task == null) {
			task = "";
		}
		
		String theone = "";
		ShutNew sn;
		String temstr;
		String[] temstrs;
		String[] ss2;
		String dayscontent;
		int flags=0;
		if (task.length() > 0) {
			String[] ss = task.split("\\/");
			task="";
			for (int i = 0; i < ss.length; i++) {
				theone = ss[i].trim();
				if (theone.length() > 0) {
					
						if(theone.equals(selonoff)&&flags==0){
								
						}else{
							if(task.length()==0){
								task=theone;
							}else{
								task=task+"/"+theone;
							}
						    ss2 = theone.split("\\_");
						    if (ss2.length == 3) {
						    	
							   sn = new ShutNew();
							   temstr = ss2[0];
							   temstrs=temstr.split("\\|");
							   dayscontent="";
							
							
							   for (int j = 0; j < temstrs.length; j++) {
								
									if(dayscontent.length()==0){
										if(temstrs[j].equals("8")){
											dayscontent=local.getA00483();
										} else if (temstrs[j].equals("7")) {
											dayscontent=local.getA00482();
										} else if (temstrs[j].equals("6")) {
											dayscontent=local.getA00481();
										} else if (temstrs[j].equals("5")) {
											dayscontent=local.getA00480();
										} else if (temstrs[j].equals("4")) {
											dayscontent=local.getA00479();
										} else if (temstrs[j].equals("3")) {
											dayscontent=local.getA00478();
										} else if (temstrs[j].equals("2")) {
											dayscontent=local.getA00476();
										} else if (temstrs[j].equals("1")) {
											dayscontent=local.getA00475();
										}
									}else{
										if(temstrs[j].equals("8")){
											dayscontent+="|"+local.getA00483();
										} else if (temstrs[j].equals("7")) {
											dayscontent+="|"+local.getA00482();
										} else if (temstrs[j].equals("6")) {
											dayscontent+="|"+local.getA00481();
										} else if (temstrs[j].equals("5")) {
											dayscontent+="|"+local.getA00480();
										} else if (temstrs[j].equals("4")) {
											dayscontent+="|"+local.getA00479();
										} else if (temstrs[j].equals("3")) {
											dayscontent+="|"+local.getA00478();
										} else if (temstrs[j].equals("2")) {
											dayscontent+="|"+local.getA00476();
										} else if (temstrs[j].equals("1")) {
											dayscontent+="|"+local.getA00475();
										}
									}
								
							}
							
					        sn.setDayscontent(dayscontent);
							
							sn.setType(Integer.parseInt(ss2[1]));
							
							temstr = ss2[2];
							sn.setSdate(temstr);
							sn.setTheone(theone);
							ls.add(sn);
						}
					}
						
					if(flags==0){
						if(theone.equals(selonoff)){
						    flags=1;
						}
					}
					
					
					
				}
			}
		}
		return SUCCESS;
	}

	

	public String getSelonoff() {
		return selonoff;
	}



	public void setSelonoff(String selonoff) {
		this.selonoff = selonoff;
	}



	


	public List getLs() {
		return ls;
	}

	

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}
	

	public String getClientids() {
		return clientids;
	}



	public void setClientids(String clientids) {
		this.clientids = clientids;
	}



	public String getCgids() {
		return cgids;
	}



	public void setCgids(String cgids) {
		this.cgids = cgids;
	}




	public void setLs(List ls) {
		this.ls = ls;
	}
	
	
}
