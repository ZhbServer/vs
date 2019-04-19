package com.vshow.control.api.test.treasure;

import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.SqlConnect;
/*
 *详情
 */
public class ToSeeTreasureInfoAction extends BaseAction {
	
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
	private int treasureInsideType;//宝箱内容类型 1 二维码、2 url、 3 图片、 4 节目
	private int showTime;//宝箱显示时间
	private int itemId;//节目id	
	private int imgHeight;//图片高度
	private int imgWidth;//图片宽度
	@Override
	public String execute() throws Exception {
		
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
		  treasureInsideType=tre.getTreasureInsideType();
		  showTime=tre.getShowTime();
		  itemId=tre.getItemId();		 
		  imgHeight=tre.getImgHeight();//图片高度
		  imgWidth=tre.getImgWidth();//图片宽度
		  return SUCCESS;
		}else {
			return ERROR;
		}
				
	}
	
	public int getImgHeight() {
		return imgHeight;
	}


	public void setImgHeight(int imgHeight) {
		this.imgHeight = imgHeight;
	}


	public int getImgWidth() {
		return imgWidth;
	}


	public void setImgWidth(int imgWidth) {
		this.imgWidth = imgWidth;
	}


	public int getItemId() {
		return itemId;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public int getShowTime() {
		return showTime;
	}


	public void setShowTime(int showTime) {
		this.showTime = showTime;
	}


	public int getTreasureInsideType() {
		return treasureInsideType;
	}


	public void setTreasureInsideType(int treasureInsideType) {
		this.treasureInsideType = treasureInsideType;
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
