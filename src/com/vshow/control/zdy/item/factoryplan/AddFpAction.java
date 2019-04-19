package com.vshow.control.zdy.item.factoryplan;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.FactoryPlan;
import com.vshow.control.data.Jh;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddFpAction extends ActionSupport {

	private String fpName;

	private FactoryPlan fp;
	private int fid;

	@Override
	public String execute() throws Exception {
		String result = SUCCESS;
		int urid = (Integer) ActionContext.getContext().getSession().get("urid");
		fp = new FactoryPlan();
		fp.setName(fpName);
		fp.setItemC(0);
		fid = (Integer) SqlConnect.getSqlMapInstance().insert("add_factoryplan", fp);
		fp.setId(fid);
		String jhtypeName = "";
		// 添加日志
		LogHandle.insertTheLog(LogType.type15, urid, Constant.LOCAL.getA00650()+ "[" + jhtypeName + "]:" + fpName, 1, 1);

		return result;
	}

	public String getFpName() {
		return fpName;
	}

	public void setFpName(String fpName) {
		this.fpName = fpName;
	}

	public FactoryPlan getFp() {
		return fp;
	}

	public void setFp(FactoryPlan fp) {
		this.fp = fp;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

}
