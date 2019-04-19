package com.vshow.control.sucai.group;

import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ScGroup;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AddGroupSucaiAction extends ActionSupport {

	private String scgname; // 分组名
	private int type; // 分组类型（素材类型 1 背景 2音频 3视频 4图片 5FLASH 6PPT 7Word 8Excel
						// 9PDF 10文本）
	private int tid; //父级id 
	private String info;
	private int pagetype; // 显示页数类型

	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		ScGroup scg = new ScGroup();
		scg.setName(scgname);
		scg.setType(type);
		int urid = (Integer) session.get("urid");
		scg.setUserid(urid);

		Integer gid=(Integer)SqlConnect.getSqlMapInstance().insert("add_group", scg);
		String tkey="";
		if(gid!=null){
			if(tid!=0){
				//获取父级id的tkey
				String fTkey=(String)SqlConnect.getSqlMapInstance().queryForObject("sc_group_uid_tkey", tid);
				if(fTkey==null){
					tkey=tid+"_";
				}else{
					tkey=fTkey;
				}
				tkey+=gid+"_";
			}else{
				tkey=gid+"_";
			}
			
			//更新tkey
			ScGroup upScg = new ScGroup();
			upScg.setId(gid);
			upScg.setTkey(tkey);
			SqlConnect.getSqlMapInstance().update("upd_scgroup_tkey", upScg);
			
		}

		// 添加日志
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

		LogHandle.insertTheLog(LogType.type3, urid, Constant.LOCAL.getA00097()
				+ sstype + ":" + scg.getName(), 1, 1);
		info = "1";
		return SUCCESS;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getScgname() {
		return scgname;
	}

	public void setScgname(String scgname) {
		this.scgname = scgname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
