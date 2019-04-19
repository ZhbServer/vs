package com.vshow.control.item.touch;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.data.program.ProgramWeather;
import com.vshow.control.data.program.TouchBasis;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToAdTouchAction implements Action {
   
	
	private String currentdivid;//当前 选中元素id
	private String touchIds;     //目标元素id集  多个用 *分割
	
	private String touchJson=""; 
	private TouchInteractive editTouchInteractive;
	private String resourcesListJson="";
	private List<String> touchIdList=new ArrayList<String>(); 

	
    private List listsfgp; // 分组集合（自己）
	
	private List listsfgpimg; // 分组集合（图片）
	
	
	
	public String execute() throws Exception {
		String touchIdss[]=touchIds.split("\\*");
		for (int i = 0; i < touchIdss.length; i++) {
            
            	touchIdList.add(touchIdss[i]);
            
		}
		
		if(!touchJson.equals("")){
			
			editTouchInteractive=(TouchInteractive)JSONObject.toBean(JSONObject.fromObject(touchJson), TouchInteractive.class);
			
			JSONArray jsonArr = JSONArray.fromObject(editTouchInteractive.gettResourcesList());
			
			resourcesListJson=jsonArr.toString();
			
			
			
		}else{
			
			editTouchInteractive=new TouchInteractive();
			editTouchInteractive.settType(5);
			editTouchInteractive.settTouchKey("");
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
	
	public String getResourcesListJson() {
		return resourcesListJson;
	}

	public void setResourcesListJson(String resourcesListJson) {
		this.resourcesListJson = resourcesListJson;
	}

	public String getTouchJson() {
		return touchJson;
	}

	public void setTouchJson(String touchJson) {
		this.touchJson = touchJson;
	}

	public TouchInteractive getEditTouchInteractive() {
		return editTouchInteractive;
	}

	public void setEditTouchInteractive(TouchInteractive editTouchInteractive) {
		this.editTouchInteractive = editTouchInteractive;
	}

	public String getCurrentdivid() {
		return currentdivid;
	}
	public void setCurrentdivid(String currentdivid) {
		this.currentdivid = currentdivid;
	}
	public String getTouchIds() {
		return touchIds;
	}
	public void setTouchIds(String touchIds) {
		this.touchIds = touchIds;
	}
	public List<String> getTouchIdList() {
		return touchIdList;
	}
	public void setTouchIdList(List<String> touchIdList) {
		this.touchIdList = touchIdList;
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

	
	
}
