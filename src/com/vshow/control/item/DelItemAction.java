package com.vshow.control.item;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.SqlConnect;

public class DelItemAction implements Action {

	
	private int[] qx;
	


	
	//分组
	private ItemGroupRelation igr; // 分组



	
	private int pagetype=10;  //页码类型(10,20,30)
	

	

	public String execute() throws Exception {

		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		
		String itemlogcontent="";  //记录删除的节目名
		String tempitemname="";
		// 批量删除
		for (int i = 0; i < qx.length; i++) {
		
			  // 通过节目id查询场景
			  Scene scene = (Scene) SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid", qx[i]);
				
			  // 删除本地文件和zip
			  String zipPath = Constant.FILES + File.separator+ scene.getFilename() + ".zip";
			  FileHandle.deleteFile(zipPath);
			  String scenePath = Constant.FILES + File.separator+ scene.getFilename();
			  FileHandle.delFolder(scenePath);
			  // 删除场景表
			  SqlConnect.getSqlMapInstance().delete("del_scene", scene.getId());
				
				//获取节目名
			  tempitemname=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_item_name",qx[i]);
				
				if(itemlogcontent.length()==0){
					itemlogcontent=tempitemname;
				}else{
					itemlogcontent=itemlogcontent+","+tempitemname;
				}
				//删除节目
			   SqlConnect.getSqlMapInstance().delete("del_item_id", qx[i]);	
			   //删除节目共享
			   SqlConnect.getSqlMapInstance().delete("del_item_share_itemid", qx[i]);
			   // 删除节目分组关系
			   SqlConnect.getSqlMapInstance().delete("del_itgrouprelation_id", qx[i]);
		} 
		
		LogHandle.insertTheLog(LogType.type7, urid, Constant.LOCAL.getA00392()+":" + itemlogcontent,1,1);


		return SUCCESS;
		
		
	}


	
	public ItemGroupRelation getIgr() {
		return igr;
	}



	public void setIgr(ItemGroupRelation igr) {
		this.igr = igr;
	}



	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	
	
	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
}
