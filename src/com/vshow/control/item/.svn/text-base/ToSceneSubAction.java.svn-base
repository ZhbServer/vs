package com.vshow.control.item;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class ToSceneSubAction implements Action {

	private Item item;
	private int twidth;
	private int theight;
	private Scene scene;
	private String token;
	private int openIntro;

	private int itemViceType; //普通节目类型    0 普通节目 1双屏节目	
	private int screenType; //副屏分辨率 
	
	private String filename;//文件名
	
	private int itemType;//主节目类型(1 普通节目  2互动节目) 
	

	public int getItemType() {
		return itemType;
	}

	public void setItemType(int itemType) {
		this.itemType = itemType;
	}

	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		String scenetoken=(String)session.get("scenetoken");
		
		if(scenetoken==null||!scenetoken.equals(token)){
			
			// 转码
			// String iname = new String(item.getName().getBytes("ISO8859-1"),
			// "UTF-8");
			// item.setName(iname);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(new Date());
		
			item.setName("");
			item.setOcheck(1);
			item.setUserid((Integer) session.get("urid"));
			item.setSdate(date);
			// 节目对象存入session
			session.put("subitem", item);
	        
			//查询副屏场景存在不存在
			//sel_scfilename_scene_sub
			Scene se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scfilename_scene_sub",filename);
			
			if(se==null){
				
				// 新创建一个场景
				se=new Scene();
				se.setFilename(filename);
				se.setSf(0.5F);
				// se.setTx((int)(twidth*0.5));
				// se.setTy((int)(theight*0.5));
				
				
			}else{
				
				screenType=se.getFbltype();
				
			}
			
			// 获取分辨率
			Fbl fbl=(Fbl)SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id", screenType);
			if(fbl!=null){
				twidth = fbl.getTx();
				theight = fbl.getTy();
				
			}else{
				
				twidth = 1080;
				theight = 1920;
			}
			
			
			se.setTx(twidth);
			se.setTy(theight);
			
			session.put("subscene", se);
			
		}
		
		return SUCCESS;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
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

	public Scene getScene() {
		return scene;
	}

	public void setScene(Scene scene) {
		this.scene = scene;
	}
	
	
	public int getOpenIntro() {
		return openIntro;
	}

	public void setOpenIntro(int openIntro) {
		this.openIntro = openIntro;
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
