package com.vshow.control.item.interact;


import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.SqlConnect;

public class EditInteractItemAction extends ActionSupport {
	private int itemid;
	// 场景集合
	private List scenes;
	private List scs;
	private int onestime;
	private String oneurl;
	private int twidth;
	private int theight;
	private int itemViceType; //普通节目类型    0 普通节目 1双屏节目	
	private int screenType; //副屏分辨率  0横屏  如    1920*1080 1竖屏 1080*1920
	
    private int upFblId=0;
	
	public int getUpFblId() {
		return upFblId;
	}


	public void setUpFblId(int upFblId) {
		this.upFblId = upFblId;
	}


	public List<Fbl> getFbls() {
		return fbls;
	}


	public void setFbls(List<Fbl> fbls) {
		this.fbls = fbls;
	}


	private List<Fbl> fbls;
	
	
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		// 获取节目
		InteractItem item = (InteractItem) sm.queryForObject(
				"sel_id_interactitem", itemid);
		int ocheck = (Integer) session.get("urcheck");
		if (ocheck == 0 || ocheck == 2) {
			ocheck = 0;
		} else if (ocheck == 1 || ocheck == 3) {
			ocheck = 1;
		}

		item.setOcheck(ocheck);

		

		//获取这个互动节目下的全部场景
		scenes = null;
		scenes = sm.queryForList("sel_item_interact_allscene", item.getId());
		
		
		
		//获取第一个互动场景
		oneurl=(String)sm.queryForObject("sel_one_scene", item.getId());
		
		//获取分辨率集合
		fbls=SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all");
		
	
		session.put("interactitem", item);
		// 获取这个节目下的第一个场景
		Scene se = (Scene) sm.queryForObject("sel_one_interactscene",item.getId());
		
		if (se != null) {
			
			Fbl fbl;
			if(upFblId!=0){
			 	 fbl=(Fbl)sm.queryForObject("sel_fbl_all_id", upFblId);
			 	 se.setFblId(upFblId);
			}else{
				
				 //查找分辨率
				 fbl=(Fbl)sm.queryForObject("sel_fbl_all_id", item.getFblid());
				 
				 se.setFblId(item.getFblid());
			}
			
			se.setTx(fbl.getTx());
			se.setTy(fbl.getTy());
			twidth=fbl.getTx();
			theight=fbl.getTy();
			session.put("scene", se);
			
			
			int isNewItem=se.getMcontent().indexOf("网页主体内容 开始");
			
			if(isNewItem==-1){
				
				Scene sceneSub= (Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scfilename_scene_sub", se.getFilename());
				
				if(sceneSub!=null){
					
					itemViceType=1; //普通节目类型    0 普通节目 1双屏节目	
					screenType=sceneSub.getFbltype(); //副屏分辨率  0横屏  如    1920*1080 1竖屏 1080*1920
					
				}
				return "successNew";
			}else {
				return SUCCESS;
			}
			
			
			
		}else{
			return "noscene";
		}
		
	}


	public List getScenes() {
		return scenes;
	}


	public void setScenes(List scenes) {
		this.scenes = scenes;
	}


	public int getTwidth() {
		return twidth;
	}


	public void setTwidth(int twidth) {
		this.twidth = twidth;
	}


	public int getTheight() {
		return theight;
	}


	public void setTheight(int theight) {
		this.theight = theight;
	}


	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public List getScs() {
		return scs;
	}

	public void setScs(List scs) {
		this.scs = scs;
	}

	public int getOnestime() {
		return onestime;
	}

	public void setOnestime(int onestime) {
		this.onestime = onestime;
	}

	public String getOneurl() {
		return oneurl;
	}

	public void setOneurl(String oneurl) {
		this.oneurl = oneurl;
	}


	public int getItemViceType() {
		return itemViceType;
	}


	public void setItemViceType(int itemViceType) {
		this.itemViceType = itemViceType;
	}


	public int getScreenType() {
		return screenType;
	}


	public void setScreenType(int screenType) {
		this.screenType = screenType;
	}


}
