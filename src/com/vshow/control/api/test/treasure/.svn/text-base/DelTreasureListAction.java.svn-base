package com.vshow.control.api.test.treasure;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.SqlConnect;
/*
 *删除
 */
public class DelTreasureListAction extends ActionSupport {
	

	private int qx[];
	
	public String execute() throws Exception {
		
		for (int i = 0; i < qx.length; i++) {

			Treasure tre=new Treasure();
			tre.setId(qx[i]);
						
			SqlConnect.getSqlMapInstance().delete("del_treasure", tre);
								   
		}
						
		return SUCCESS;
			
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}

}
