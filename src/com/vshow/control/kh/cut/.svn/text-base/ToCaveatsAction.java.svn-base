package com.vshow.control.kh.cut;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.SqlConnect;

public class ToCaveatsAction implements Action {

	private int caveat;
	@Override
	public String execute() throws Exception {
		Integer caveatint=(Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_caveat");
		if(caveatint==null){
			caveatint=0;
		}
		caveat=caveatint;
		return SUCCESS;
	}
	public int getCaveat() {
		return caveat;
	}
	public void setCaveat(int caveat) {
		this.caveat = caveat;
	}

}
