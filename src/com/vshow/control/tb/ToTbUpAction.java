package com.vshow.control.tb;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Jh;
import com.vshow.control.data.Notice;
import com.vshow.control.data.NoticeJhRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.Tb;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToTbUpAction extends ActionSupport {
	
	 private List listsfgpimg; // 分组集合（图片）
	 
	 private int tbId;
	 
	 private Tb editTB;

	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		

		
		ScGroup gp = new ScGroup();
		
		gp.setTkey(tkey);
		gp.setUserid(uid);
		
		//获取分组图片
		gp.setType(4);
		listsfgpimg = SqlConnect.getSqlMapInstance().queryForList("sc_self_group_all", gp);
		
		if(tbId!=0){
			
			editTB=(Tb)SqlConnect.getSqlMapInstance().queryForObject("sel_tb_id",tbId);
			
			if(editTB!=null){
				if(editTB.getmType()==0){
					String imgName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_sucai_name_by_filename", editTB.getmUrl());
					editTB.setmUrlName(imgName);
				}else{
					editTB.setmUrlName(editTB.getmUrl());
				}
			}
			
		}
		
		
		return SUCCESS;

	}

	
	public int getTbId() {
		return tbId;
	}

	public void setTbId(int tbId) {
		this.tbId = tbId;
	}
	
	
	public Tb getEditTB() {
		return editTB;
	}


	public void setEditTB(Tb editTB) {
		this.editTB = editTB;
	}


	public List getListsfgpimg() {
		return listsfgpimg;
	}

	public void setListsfgpimg(List listsfgpimg) {
		this.listsfgpimg = listsfgpimg;
	}

	
}
