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

public class ToSceneAction implements Action {

	private Item item;
	private int twidth;
	private int theight;
	private Scene scene;
	private String token;

	
	

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
			int ocheck = (Integer) session.get("urcheck");
			if (ocheck == 0 || ocheck == 2) {
				ocheck = 0;
			} else if (ocheck == 1 || ocheck == 3) {
				ocheck = 1;
			}

			item.setName(java.net.URLDecoder.decode(item.getName(), "UTF-8"));
			item.setOcheck(ocheck);
			item.setUserid((Integer) session.get("urid"));
			item.setSdate(date);
			// 节目对象存入session
			session.put("item", item);
	        
			
			// 获取分辨率
			Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject(
					"sel_fbl_all_id", item.getFblid());
			twidth = fbl.getTx();
			theight = fbl.getTy();
			// 新创建一个场景
			Scene se = new Scene();
			se.setFilename(Long.toString(System.currentTimeMillis())
					+ (int) (Math.random() * 100));
			File dirFile = new File(Constant.FILES + File.separator
					+ se.getFilename());
			dirFile.mkdir();
			
			FileHandle.copy2(Constant.EXE+File.separator+"main_vs.swf",Constant.FILES + File.separator
					+ se.getFilename()+File.separator+"main_vs.swf");
			
			se.setSf(0.5F);
			// se.setTx((int)(twidth*0.5));
			// se.setTy((int)(theight*0.5));
			se.setTx(twidth);
			se.setTy(theight);
			session.put("scene", se);

		}
		
		session.put("scenetoken", token);
		
		return SUCCESS;
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
	
	


}
