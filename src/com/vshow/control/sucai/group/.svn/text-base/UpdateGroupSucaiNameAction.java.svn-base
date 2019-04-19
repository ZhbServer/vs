package com.vshow.control.sucai.group;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ScGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class UpdateGroupSucaiNameAction extends ActionSupport {

	private String uscgname;
	private int scgid;
	private String info;
	private int type;// 分组类型（素材类型 1 背景 2音频 3视频 4图片 5FLASH 6PPT 7Word 8Excel 9PDF
						// 10文本）

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");

		ScGroup scg = new ScGroup();
		scg.setId(scgid);
		scg.setName(uscgname);
		SqlConnect.getSqlMapInstance().update("upd_scgroup_name_id", scg);

		String sstype = "";
		if (type == 1) {
			sstype = "[" + Constant.LOCAL.getA00058() + "]";
		} else if (type == 4) {
			sstype = "[" + Constant.LOCAL.getA00061() + "]";
		} else if (type == 3) {
			sstype = "[" + Constant.LOCAL.getA00060() + "]";
		} else if (type == 2) {
			sstype = "[" + Constant.LOCAL.getA00059() + "]";
		} else if (type == 5) {
			sstype = "[FLASH]";
		} else if (type == 6) {
			sstype = "[PPT]";
		} else if (type == 7) {
			sstype = "[Word]";
		} else if (type == 8) {
			sstype = "[Excel]";
		} else if (type == 9) {
			sstype = "[PDF]";
		} else if (type == 10) {
			sstype = "[" + Constant.LOCAL.getA00062() + "]";
		}
		LogHandle.insertTheLog(LogType.type4, urid, Constant.LOCAL.getA00102()
				+ sstype + ":" + uscgname, 1, 1);

		info=uscgname;
		return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setUscgname(String uscgname) {
		this.uscgname = uscgname;
	}

	public void setScgid(int scgid) {
		this.scgid = scgid;
	}
}
