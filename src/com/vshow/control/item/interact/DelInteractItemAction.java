package com.vshow.control.item.interact;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemShare;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.SqlConnect;

public class DelInteractItemAction extends ActionSupport {
	// 节目id;
	private int[] qx;
	private int pagetype=10;  //页码类型(10,20,30)
	
	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		Local local= (Local) session.get("local");
		// 追加删除文件的名字
		String logcontent = "";
		for (int i= 0; i  <qx.length;  i++) {
			
			//获取全部节目下的场景
			List list = sm.queryForList("sel_interactitem_allscene", qx[i]);
			for (int j = 0; j < list.size(); j++) {
				Scene scene=(Scene)list.get(j);
				// 删除节目与场景关联表
				sm.delete("del_interactitem_scene", scene.getId());
				// 删除本地文件和zip
				String zipPath = Constant.FILES + File.separator
						+ scene.getFilename() + ".zip";
				FileHandle.deleteFile(zipPath);
				String scenePath = Constant.FILES + File.separator
						+ scene.getFilename();
				FileHandle.delFolder(scenePath);
				// 删除场景表
				sm.delete("del_interactscene", scene.getId());
			}
			//通过节目id获取节目
			InteractItem item=(InteractItem)sm.queryForObject("sel_id_interactitem",qx[i]);
			if (logcontent == "") {
				logcontent = item.getName();
			} else {
				logcontent = logcontent + "," + item.getName();
			}
			
			//删除节目
			sm.delete("del_interactitem", qx[i]);
			
			//删除节目共享
			sm.delete("del_interact_item_share_itemid", qx[i]);
		    
			//删除节目分组关系
			sm.delete("del_interactitemgrouprelation_id", qx[i]);
			
		}
		LogHandle.insertTheLog(LogType.type7, urid,Constant.LOCAL.getA00444()+":" + logcontent, 1,1);
		return SUCCESS;
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
