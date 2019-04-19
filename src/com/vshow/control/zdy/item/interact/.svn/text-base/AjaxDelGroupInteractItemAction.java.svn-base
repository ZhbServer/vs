package com.vshow.control.zdy.item.interact;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.sun.star.report.Groups;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxDelGroupInteractItemAction extends ActionSupport {

	private int tid; // 分组id;
	private int pagetype; // 显示页数类型

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		Integer igid = (Integer) session.get("igid");
		if (igid == null) {
			igid = 0;
		}
		String logcontent = ""; // 记录删除的分组名
		String itemlogcontent = ""; // 记录删除的节目名
		String tempitemname = "";
		// 查询分组的名字
		String str = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_interactitemgroup_name_id", tid);

		// 查询这个分组下的所有节目id
		List<Integer> gsscids = SqlConnect.getSqlMapInstance().queryForList(
				"sel_group_interact_item_id_all", tid);

		// 删除节目
		for (int i = 0; i < gsscids.size(); i++) {
			//获取全部节目下的场景
			List list = SqlConnect.getSqlMapInstance().queryForList("sel_interactitem_allscene",gsscids.get(i));
			for (int j = 0; j < list.size(); j++) {
				Scene scene=(Scene)list.get(j);
				// 删除节目与场景关联表
				SqlConnect.getSqlMapInstance().delete("del_interactitem_scene", scene.getId());
				// 删除本地文件和zip
				String zipPath = Constant.FILES + File.separator
						+ scene.getFilename() + ".zip";
				FileHandle.deleteFile(zipPath);
				String scenePath = Constant.FILES + File.separator
						+ scene.getFilename();
				FileHandle.delFolder(scenePath);
				// 删除场景表
				SqlConnect.getSqlMapInstance().delete("del_interactscene", scene.getId());
			}
			//删除节目
			//通过节目id获取节目
			InteractItem item=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_id_interactitem",gsscids.get(i));
			if (logcontent == "") {
				logcontent = item.getName();
			} else {
				logcontent = logcontent + "," + item.getName();
			}
			SqlConnect.getSqlMapInstance().delete("del_interactitem", gsscids.get(i));

		}

		if (logcontent == "") {
			logcontent = str;
		} else {
			logcontent = logcontent + "," + str;
		}
		// 删除分组
		SqlConnect.getSqlMapInstance().delete("del_interactitemgroup_id", tid);
		// 删除分组关系
		SqlConnect.getSqlMapInstance().delete("del_interactitemgrouprelation_id", tid);

		// 添加日志

		if (itemlogcontent == "") {
			LogHandle.insertTheLog(LogType.type5, urid,
					Constant.LOCAL.getA00391() + ":" + logcontent, 1, 1);
		} else {
			LogHandle.insertTheLog(LogType.type5, urid,
					Constant.LOCAL.getA00391() + ":" + logcontent + "("
							+ Constant.LOCAL.getA00392() + ":" + itemlogcontent
							+ ")", 1, 1);
		}

		return GsonUtil.getGson("");
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

}
