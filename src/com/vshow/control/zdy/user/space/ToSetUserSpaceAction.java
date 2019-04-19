package com.vshow.control.zdy.user.space;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.UserSpace;
import com.vshow.control.tool.SqlConnect;

public class ToSetUserSpaceAction extends ActionSupport {

	private Float total; // 用户存储空间
	private float scTotal = 0.00f; // 素材资源使用大小
	private int uid; // 用户ID
	private Integer state;

	public String execute() throws Exception {
		
		scTotal = getUSTotal.doMain(uid); // 获取总的用户存储空间大小

		total = (Float) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_us_total_uid", uid);
		
		state = (Integer)SqlConnect.getSqlMapInstance().queryForObject(
				"sel_desc_state_byuid", uid);
		if(state == null){
			state = 1;
		}
		
		return SUCCESS;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

	public float getScTotal() {
		return scTotal;
	}

	public void setScTotal(float scTotal) {
		this.scTotal = scTotal;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
