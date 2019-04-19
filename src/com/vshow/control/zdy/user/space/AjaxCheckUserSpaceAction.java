package com.vshow.control.zdy.user.space;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxCheckUserSpaceAction implements Action {

	private float filesize;
	private int uid;
	private int flag = 0;

	public String execute() throws Exception {
		Float userspaces = (Float) SqlConnect.getSqlMapInstance()
		.queryForObject("sel_us_total_uid", uid);
		
		if (userspaces != null && userspaces > 0) {
			filesize = filesize/1024/1024;
			float userSize = getUSTotal.doMain(uid); //获取总的用户存储空间大小
			if(userspaces < userSize + filesize){
				flag = 1;
			}
		} 

		return GsonUtil.getGson(flag);
	}


	public float getFilesize() {
		return filesize;
	}

	public void setFilesize(float filesize) {
		this.filesize = filesize;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}


	public int getFlag() {
		return flag;
	}


	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	

}
