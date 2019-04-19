package com.vshow.control.projection;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Projection;

import com.vshow.control.tool.SqlConnect;

public class ToUpdateProjectionAction implements Action {
	
	
	
	private Projection editPt;

	private int pid;

	public String execute() throws Exception {
		
		//int urid = (Integer) ActionContext.getContext().getSession().get("urid");
		
		//pt.setUid(urid);
		
		editPt=(Projection)SqlConnect.getSqlMapInstance().queryForObject("see_projection_id", pid);
		
		return SUCCESS;
		
		
	}

	
	
	public Projection getEditPt() {
		return editPt;
	}


	public void setEditPt(Projection editPt) {
		this.editPt = editPt;
	}

	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}

}
