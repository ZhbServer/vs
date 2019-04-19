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

public class OnOffNewSetToAction implements Action {

	private String task;
	private String sdate;
	private List ls;
	private String days;
    private int type;

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
		String temml = null;

		if (sdate != null) {
			temml = days + "_" + type+"_"+sdate;
		}

		if (temml != null) {
			if (task.length() == 0) {
				task = temml;
			} else {
				task += "/" + temml;
			}
		}
		String theone = "";
		ShutNew sn;
		String temstr;
		String[] temstrs;
		String[] ss2;
		String dayscontent;
		if (task.length() > 0) {
			String[] ss = task.split("\\/");
			for (int i = 0; i < ss.length; i++) {
				theone = ss[i].trim();
				if (theone.length() > 0) {
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
			}
		}
		return SUCCESS;
	}

	

	public String getDays() {
		return days;
	}



	public void setDays(String days) {
		this.days = days;
	}



	public List getLs() {
		return ls;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
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



	public String getSdate() {
		return sdate;
	}

	public void setLs(List ls) {
		this.ls = ls;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
