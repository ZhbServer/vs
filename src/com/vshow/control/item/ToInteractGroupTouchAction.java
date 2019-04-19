package com.vshow.control.item;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.program.ProgramRecyder;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;

public class ToInteractGroupTouchAction implements Action {

	

	private String currentdiv;//当前 选中元素
	private String touchIds;     //目标元素id集  多个用 *分割
	
	private List<String> touchIdList=new ArrayList<String>(); 
	
	
	 private List listsfgp; // 分组集合（自己）
		
	 

	 private List listsfgpimg; // 分组集合（图片）
	 
	 private String treeData;
		
	
	public String execute() throws Exception {
	    //System.out.println(treeData);
		String touchIdss[]=touchIds.split("\\*");
		for (int i = 0; i < touchIdss.length; i++) {
			touchIdList.add(touchIdss[i]);
		}
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		ScGroup gp = new ScGroup();
		gp.setType(3);
		gp.setTkey(tkey);
		gp.setUserid(uid);
		
		//获取分组视频
		listsfgp = SqlConnect.getSqlMapInstance().queryForList("sc_self_group_all", gp);
		
		//获取分组图片
		gp.setType(4);
		listsfgpimg = SqlConnect.getSqlMapInstance().queryForList("sc_self_group_all", gp);
		
		
		return SUCCESS;
	}


	public List getListsfgp() {
		return listsfgp;
	}




	public void setListsfgp(List listsfgp) {
		this.listsfgp = listsfgp;
	}




	public List getListsfgpimg() {
		return listsfgpimg;
	}




	public void setListsfgpimg(List listsfgpimg) {
		this.listsfgpimg = listsfgpimg;
	}
	

	public String getTreeData() {
		return treeData;
	}




	public void setTreeData(String treeData) {
		this.treeData = treeData;
	}




	public List<String> getTouchIdList() {
		return touchIdList;
	}




	public void setTouchIdList(List<String> touchIdList) {
		this.touchIdList = touchIdList;
	}




	public String getCurrentdiv() {
		return currentdiv;
	}




	public void setCurrentdiv(String currentdiv) {
		this.currentdiv = currentdiv;
	}




	public String getTouchIds() {
		return touchIds;
	}

	public void setTouchIds(String touchIds) {
		this.touchIds = touchIds;
	}

	

	


	
}
