package com.vshow.control.item.group;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.sun.star.report.Groups;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxDelGroupItemAction extends ActionSupport {

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
				"sel_itemgroup_name_id", tid);

		// 查询这个分组下的所有节目id
		List<Integer> gsscids = SqlConnect.getSqlMapInstance().queryForList(
				"sel_group_item_id_all", tid);

		// 删除节目
		for (int j = 0; j < gsscids.size(); j++) {
			// 通过节目id查询场景
			Scene scene = (Scene) SqlConnect.getSqlMapInstance()
					.queryForObject("sel_fnvn_iid", gsscids.get(j));

			// 删除本地文件和zip
			String zipPath = Constant.FILES + File.separator
					+ scene.getFilename() + ".zip";
			FileHandle.deleteFile(zipPath);
			String scenePath = Constant.FILES + File.separator
					+ scene.getFilename();
			FileHandle.delFolder(scenePath);
			// 删除场景表
			SqlConnect.getSqlMapInstance().delete("del_scene", scene.getId());

			// 获取节目名
			tempitemname = (String) SqlConnect.getSqlMapInstance()
					.queryForObject("sel_item_name", gsscids.get(j));

			if (itemlogcontent.length() == 0) {
				itemlogcontent = tempitemname;
			} else {
				itemlogcontent = itemlogcontent + "," + tempitemname;
			}
			// 删除节目
			SqlConnect.getSqlMapInstance()
					.delete("del_item_id", gsscids.get(j));

		}

		if (logcontent == "") {
			logcontent = str;
		} else {
			logcontent = logcontent + "," + str;
		}
		// 删除分组
		SqlConnect.getSqlMapInstance().delete("del_itemgroup_id", tid);
		// 删除分组关系
		SqlConnect.getSqlMapInstance().delete("del_itgrouprelation_id", tid);

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
