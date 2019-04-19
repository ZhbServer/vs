package com.vshow.control.api.test.treasure;

import java.util.ArrayList;
import java.util.List;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.SqlConnect;
/*
 *详情
 */
public class AjaxTreasureInfoAction extends BaseAction {
	
	private int id;
	private String treasureName;//活动名
	private String itemName;//节目名
	private String cid;//发布终端ID
	private String onStatus;//上线状态   0表示未上线、1表示待上线、2表示活动中、3表示已下线 
	private String treasureType;//活动类型  0表示分宝箱、1表示二维码活动，2表示宝箱是否带特效
	private String onTime;//活动上线时间
	private String offTime;//活动下线时间			
	private String url;//跳转URL
	private String code;//展示二维码
	private String styleImg;//宝箱样式图片
	private String skipImg;//宝箱跳转图片
	private String creator;//创建人		
	private String creatorTime;//创建时间		
	private String lastModifier;//最近一次修改人		
	private String modifierTime;//最近一次修改时间		
	private String ban;//1表示禁用，0表示启用 
	private int treasureHeight;
	private int treasureWidth;
	
	private List<Treasure> treasureitemlist;
	
	@Override
	public String execute() throws Exception {
		
		treasureitemlist=new ArrayList<Treasure>();
		
		Treasure tre=new Treasure();
		tre=(Treasure) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_info",id);
		if (tre!=null) {
		  id=tre.getId();
		  treasureName=tre.getTreasureName();
		  itemName=tre.getItemName();
		  cid=tre.getCid();
		  onStatus=tre.getOnStatus();
		  treasureType=tre.getTreasureType();
		  onTime=tre.getOnTime();
		  offTime=tre.getOffTime();			
		  url=tre.getUrl();
		  code=tre.getCode();
		  styleImg=tre.getStyleImg();
		  skipImg=tre.getSkipImg();
		  creator=tre.getCreator();	
		  creatorTime=tre.getCreatorTime();	
		  lastModifier=tre.getLastModifier();
		  modifierTime=tre.getModifierTime();
		  ban=tre.getBan();
		  treasureHeight=tre.getTreasureHeight();
		  treasureWidth=tre.getTreasureWidth(); 
		  	  		  		 		  
		  treasureitemlist.add(tre);
		  responseEntity = ResponseEntity.err0000();
		  responseEntity.putDataValue("treasureitemlist", treasureitemlist);
		  		 			  
		  return SUCCESS;
		}else {
			return ERROR;
		}
				
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTreasureName() {
		return treasureName;
	}
	public void setTreasureName(String treasureName) {
		this.treasureName = treasureName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getOnStatus() {
		return onStatus;
	}
	public void setOnStatus(String onStatus) {
		this.onStatus = onStatus;
	}
	public String getTreasureType() {
		return treasureType;
	}
	public void setTreasureType(String treasureType) {
		this.treasureType = treasureType;
	}
	public String getOnTime() {
		return onTime;
	}
	public void setOnTime(String onTime) {
		this.onTime = onTime;
	}
	public String getOffTime() {
		return offTime;
	}
	public void setOffTime(String offTime) {
		this.offTime = offTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStyleImg() {
		return styleImg;
	}
	public void setStyleImg(String styleImg) {
		this.styleImg = styleImg;
	}
	public String getSkipImg() {
		return skipImg;
	}
	public void setSkipImg(String skipImg) {
		this.skipImg = skipImg;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCreatorTime() {
		return creatorTime;
	}
	public void setCreatorTime(String creatorTime) {
		this.creatorTime = creatorTime;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	public String getLastModifier() {
		return lastModifier;
	}
	public void setLastModifier(String lastModifier) {
		this.lastModifier = lastModifier;
	}
	public String getModifierTime() {
		return modifierTime;
	}
	public void setModifierTime(String modifierTime) {
		this.modifierTime = modifierTime;
	}
	public List<Treasure> getTreasureitemlist() {
		return treasureitemlist;
	}
	public void setTreasureitemlist(List<Treasure> treasureitemlist) {
		this.treasureitemlist = treasureitemlist;
	}
	public int getTreasureHeight() {
		return treasureHeight;
	}
	public void setTreasureHeight(int treasureHeight) {
		this.treasureHeight = treasureHeight;
	}
	public int getTreasureWidth() {
		return treasureWidth;
	}
	public void setTreasureWidth(int treasureWidth) {
		this.treasureWidth = treasureWidth;
	}
	
	
}
