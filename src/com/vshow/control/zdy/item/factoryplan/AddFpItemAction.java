package com.vshow.control.zdy.item.factoryplan;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.FactoryPlan;
import com.vshow.control.data.FactoryPlanItem;
import com.vshow.control.data.FactoryPlanItemRelation;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AddFpItemAction implements Action {

	private int fid;   //计划id
	private String clientids;  //终端ids
	private String filenames;  //节目元素
	
	@Override
	public String execute() throws Exception {
		
		int count = 0;
		int itemId=0;
		/**获取所有终端**/
		if (clientids != null && !"".equals(clientids)) {
			
			String[] cids = clientids.split("\\_");
			String[] files = filenames.split("\\_");
			String[] filess;
			for (int i = 0; i < cids.length; i++) {
				if(!files[i].equals("")){
					
					filess=files[i].split("\\|");
					if(filess.length==2){
						itemId=Integer.parseInt(filess[1]);
					}
						
					FactoryPlanItem fpi=new FactoryPlanItem();
					fpi.setFid(fid);
					fpi.setCid(Integer.parseInt(cids[i]));
					fpi.setFilenames(files[i].split("\\|")[0]);
					SqlConnect.getSqlMapInstance().insert("add_factoryplanitem", fpi);
					count++;	
				}
				
			}
		}
		
		FactoryPlan fp = new FactoryPlan();
		fp.setId(fid);
		fp.setItemC(count);
		SqlConnect.getSqlMapInstance().update("update_factoryplan_itemC", fp);
		
		
		
		SqlConnect.getSqlMapInstance().delete("del_factoryplanitem_relation",fid);
		FactoryPlanItemRelation  fpir=new FactoryPlanItemRelation();
		fpir.setFid(fid);
		fpir.setIid(itemId);
		SqlConnect.getSqlMapInstance().insert("add_factoryplanitem_relation", fpir);
		
		return GsonUtil.getGson("");
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}
}
