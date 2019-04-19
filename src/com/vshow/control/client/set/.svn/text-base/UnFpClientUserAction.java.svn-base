package com.vshow.control.client.set;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.tool.SqlConnect;

public class UnFpClientUserAction implements Action {

	private String cidsstr; // 已选终端id,多个以"_"隔开
	private String curruserids; // 选中的用户

	private int info; // 返回信息

	@Override
	public String execute() throws Exception {

		ClientGroupRelation cgr;
		Integer cid;
		String curruseridss[]=curruserids.split("\\,");
		try {
			String cids[] = cidsstr.split("\\_");
			for (int i = 0; i < cids.length; i++) {
				
				cgr = new ClientGroupRelation();
				
				cgr.setCid(Integer.parseInt(cids[i]));
				
				for (int j = 0; j < curruseridss.length; j++) {
					
					cgr.setUid(Integer.parseInt(curruseridss[j]));
					
					cid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_cgr_cig_by_uid", cgr);
					
					if (cid != null) {
						SqlConnect.getSqlMapInstance().delete("del_cgr_cid_uid",cgr);
					}
				
				}
				
			}
			info = 1;
		} catch (Exception e) {
			info = 0;
			e.printStackTrace();
		}

		return SUCCESS;
	}

	
	public String getCurruserids() {
		return curruserids;
	}

	public void setCurruserids(String curruserids) {
		this.curruserids = curruserids;
	}
	public int getInfo() {
		return info;
	}

	public void setInfo(int info) {
		this.info = info;
	}

	public String getCidsstr() {
		return cidsstr;
	}

	public void setCidsstr(String cidsstr) {
		this.cidsstr = cidsstr;
	}

	
}
