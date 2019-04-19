package com.vshow.control.zdy.user.space;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.UserSpace;
import com.vshow.control.data.UserSpaceState;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxSaveUserSpaceAction implements Action {

	private float total;
	private int uid;
	private int ck;

	public String execute() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		UserSpace us = new UserSpace();
		us.setUserid(uid);
		us.setTotal(total);
		us.setDate(sdf.format(new Date()));
		
		UserSpaceState uss = new UserSpaceState();
		uss.setUserid(uid);
		uss.setState(ck);
		
		Integer stateC = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_stateCount_byuid",uid);
		
		if(stateC > 0){
			SqlConnect.getSqlMapInstance().update("update_user_space_state",uss);
		}else{
			SqlConnect.getSqlMapInstance().insert("add_user_space_state",uss);
		}
		
		if(ck == 0 && total != 0){
			SqlConnect.getSqlMapInstance().insert("add_user_space", us);
		}
		
		return GsonUtil.getGson("1");
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCk() {
		return ck;
	}

	public void setCk(int ck) {
		this.ck = ck;
	}

}
