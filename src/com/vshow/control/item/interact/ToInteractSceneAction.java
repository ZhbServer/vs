package com.vshow.control.item.interact;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Scene;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class ToInteractSceneAction implements Action {

	private InteractItem interactitem;
	private int twidth;
	private int theight;
	private String token;
	private int openIntro;
	private List<Scene> scenes;
	
	private List<Fbl> fbls;
	
	
   

	private int itemViceType; //普通节目类型    0 普通节目 1双屏节目
	
	private int screenType; //副屏分辨率  0横屏  如    1920*1080 1竖屏 1080*1920
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        // 转码
		//String iname = new String(interactitem.getName().getBytes("ISO8859-1"), "UTF-8");
		//interactitem.setName(iname);

        String scenetoken=(String)session.get("scenetoken");
		
		if(scenetoken==null||!scenetoken.equals(token)){
			
			int ocheck = (Integer) session.get("urcheck");
			
			if (ocheck == 0 || ocheck == 2) {
				ocheck = 0;
			} else if (ocheck == 1 || ocheck == 3) {
				ocheck = 1;
			}
			interactitem.setName(java.net.URLDecoder.decode(interactitem.getName(), "UTF-8"));
			interactitem.setLable(java.net.URLDecoder.decode(interactitem.getLable(), "UTF-8"));
			interactitem.setOcheck(ocheck);
			interactitem.setUserid((Integer) session.get("urid"));
			interactitem.setSdate(Constant.getCurrentDate());
			
			//节目对象存入session
			session.put("interactitem", interactitem);
			
			//获取分辨率集合
			fbls=SqlConnect.getSqlMapInstance().queryForList("sel_fbl_all");
			
			// 获取分辨率
			Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id", interactitem.getFblid());
			twidth = fbl.getTx();
			theight= fbl.getTy();
			
			// 新创建一个场景
			Scene ise = new Scene();
			
			ise.setFilename("a"+Long.toString(System.currentTimeMillis())
					+ (int) (Math.random() * 100));
			
			File dirFile = new File(Constant.FILES + File.separator
					+ ise.getFilename());
			
			dirFile.mkdir();
			
			FileHandle.copy2(Constant.EXE+File.separator+"main_vs.swf",Constant.FILES + File.separator
					+ ise.getFilename()+File.separator+"main_vs.swf");
			
			FileHandle.copy2(Constant.EXE+File.separator+"transpant.png",Constant.FILES + File.separator
					+ ise.getFilename()+File.separator+"transpant.png");
			
			
			
			ise.setSf(0.5F);
			
			ise.setTx(twidth);
			
			ise.setTy(theight);
			
			ise.setFblId(fbl.getId());
			
			session.put("scene", ise);
			//获取这个节目下所有链接总数
			scenes=SqlConnect.getSqlMapInstance().queryForList("sel_item_interact_allscene",interactitem.getId());
			
			ise.setName(Constant.LOCAL.getA00437()+1);
		}
		
		session.put("scenetoken", token);
		
		return SUCCESS;
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

	
	public InteractItem getInteractitem() {
		return interactitem;
	}

	public void setInteractitem(InteractItem interactitem) {
		this.interactitem = interactitem;
	}
	
	public String getToken() {
			return token;
	}

	public void setToken(String token) {
			this.token = token;
	}
	
	public int getOpenIntro() {
		return openIntro;
	}

	public void setOpenIntro(int openIntro) {
		this.openIntro = openIntro;
	}
	
	 public List<Fbl> getFbls() {
		return fbls;
	}

	public void setFbls(List<Fbl> fbls) {
		this.fbls = fbls;
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
