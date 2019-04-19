package com.vshow.control.api.test.treasure;

import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.SqlConnect;
/*
 *启用，禁用
 */
public class OncheckBanAction extends BaseAction {
	
	
	private int qx[];
	private String ban;

	public String execute() throws Exception {
		
		for (int i = 0; i < qx.length; i++) {

			Treasure tre=new Treasure();
			tre.setId(qx[i]);
			tre.setBan(ban);
			if (ban!=null) {
				SqlConnect.getSqlMapInstance().update("update_treasure_ban", tre);
				
			}
		   
		}
						
		return SUCCESS;
			
	}

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	
}
