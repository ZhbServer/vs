package com.vshow.control.item;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.data.ScenePlaytimer;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class EditItemAction extends ActionSupport {
	private int itemid;    //节目id
	private int twidth;
	private int theight;
	private Item item;
	private ScenePlaytimer sp;
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		// 获取节目
		item = (Item) sm.queryForObject("sel_item_all_id", itemid);
		int ocheck = (Integer) session.get("urcheck");
		if (ocheck == 0 || ocheck == 2) {
			ocheck = 0;
		} else if (ocheck == 1 || ocheck == 3) {
			ocheck = 1;
		}
		item.setOcheck(ocheck);
		//查找分辨率
		Fbl fbl=(Fbl)sm.queryForObject("sel_fbl_all_id", item.getFblid());
		// 节目对象存入session
		session.put("item", item);
		Scene se = (Scene) sm.queryForObject("sel_scene_all_id",item.getSceneid());
		
		
		
		//float ftx=fbl.getTx();
		//float fty=fbl.getTy();
	    twidth=fbl.getTx();
	    theight=fbl.getTy();
		se.setTx(fbl.getTx());
		se.setTy(fbl.getTy());
		session.put("scene", se);
	    //获取节目播放模式
		//Integer itemPlayType=(Integer)sm.queryForObject("sel_item_playtype_iid",  item.getId());
		//播放模式存入对象
		//session.put("itemPlayType", itemPlayType);
		
		if(!"".equals(se.getFilename())){
			 String dir = Constant.FILES + File.separator + se.getFilename()+ File.separator + "cjtime.txt";
			//判断 cjtime.txt文件存在不存在
			if(FileHandle.fileExists(dir)==1){
				sp=new ScenePlaytimer();
				//读取cjtime
				String cjtimeStr;
				try {
					cjtimeStr = FileHandle.readFileByLines(dir);
					if(cjtimeStr!=null&&!cjtimeStr.equals("")){
						String cjss[]=cjtimeStr.split("\\_");
						if(cjss.length==2){
							sp.setSdate(cjss[0]);
							sp.setEdate(cjss[1]);
							sp.setValidityCheck(1);
						}
					}
				} catch (UnsupportedEncodingException e) {
				
				}
			}
		}
		int isNewItem=se.getMcontent().indexOf("网页主体内容 开始");
		
		if(isNewItem==-1){
			return "successNew";
		}else {
			return SUCCESS;
		}
		
	}
    public ScenePlaytimer getSp() {
		return sp;
	}
	public void setSp(ScenePlaytimer sp) {
		this.sp = sp;
	}
	public Item getItem() {
		return item;
	}


	public int getTwidth() {
		return twidth;
	}


	public int getTheight() {
		return theight;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}


}
