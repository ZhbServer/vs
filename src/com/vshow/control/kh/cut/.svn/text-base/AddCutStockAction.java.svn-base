package com.vshow.control.kh.cut;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddCutStockAction implements Action {

	private int qx[];
	private int stock;
	
	@Override
	public String execute() throws Exception {
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		Client client;
		CutM cm;
		for (int i = 0; i < qx.length; i++) {
		   client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", qx[i]);
		   if(client!=null){
				cm=new CutM();
				cm.setCdate(Constant.getCurrentDate());
				cm.setCuid(urid);
				cm.setCmark(client.getMark());
				cm.setCutcount(stock);
				SqlConnect.getSqlMapInstance().insert("add_cutm", cm);
		   }
		}
		return SUCCESS;
	}
	
	public int[] getQx() {
		return qx;
	}
	public void setQx(int[] qx) {
		this.qx = qx;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}

}
