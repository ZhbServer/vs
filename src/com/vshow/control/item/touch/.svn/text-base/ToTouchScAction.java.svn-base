package com.vshow.control.item.touch;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToTouchScAction implements Action {

	private List<Sucai> listsc; // 素材集合

	private Sucai sucai;   

   @Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		
		sucai.setTkey(tkey);
		listsc=SqlConnect.getSqlMapInstance().queryForList("sel_sc_type_all", sucai);
		

		subStringList(listsc);
		
		
		if(sucai.getType()==3){
			return "successvideo";
		} else if(sucai.getType()==4){
			return "successimg";
		}
		return SUCCESS;

	}

	public Sucai getSucai() {
		return sucai;
	}

	public void setSucai(Sucai sucai) {
		this.sucai = sucai;
	}

	public List<Sucai> getListsc() {
		return listsc;
	}

	// 显示截取名字(素材)
	public void subStringList(List<Sucai> list) {
		for (Sucai sc : list) {
			int sName = sc.getName().length();
			if (sName >= 20) {
				sc.setNamesub(sc.getName().substring(0, 19) + "...");
			} else {
				sc.setNamesub(sc.getName());
			}
		}
	}
	

	// 显示截取名字(素材)
	/*public void subStringListGroup(List<Groups> list) {
		for (Groups gs : list) {
			int sName = gs.getName().length();
			if (sName >= 10) {
				gs.setNamesub(gs.getName().substring(0, 8) + "...");
			} else {
				gs.setNamesub(gs.getName());
			}
		}
	}*/

	
	

	

	public void setListsc(List<Sucai> listsc) {
		this.listsc = listsc;
	}
}
