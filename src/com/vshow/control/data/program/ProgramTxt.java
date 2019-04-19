package com.vshow.control.data.program;
/**
 * 
 * @author w
 * 文本
 *
 */
public class ProgramTxt extends ProgramPublic {
	

	
	private int mDirection;//2静态文本0向上滚动1向左滚动3向下滚动
	private int type;     //2静态文本0向上滚动1向左滚动3向下滚动
	private int speed;    //滚动速度
	private String bcolor;//背景颜色
	private String txtcontent; //文本内容
	private String ziti;//字体样式
	private int fs;     //字体大小
	private int lh;     //行高
	private String  fcolor;//字体颜色
	private int fjc;  //字体是否加粗(0否 1是)
	private int fdx;  //是否有下划线
	private int fxx;  //是否斜线
	private int fzx;  //是否中线
	private int ftype; //0居左 1居中 2局右
	private int textDataSource; //数据源
	private int advancedType;  
	private String relationKey;  //二次开发key
	
	private String highFontColor; //字体颜色高级
	private int fontColorCb; 
	
	private String highBgColor; //背景颜色高级
	private int bgColorCb;
	
	
	
	public String getHighFontColor() {
		return highFontColor;
	}
	public void setHighFontColor(String highFontColor) {
		this.highFontColor = highFontColor;
	}
	public int getFontColorCb() {
		return fontColorCb;
	}
	public void setFontColorCb(int fontColorCb) {
		this.fontColorCb = fontColorCb;
	}
	public String getHighBgColor() {
		return highBgColor;
	}
	public void setHighBgColor(String highBgColor) {
		this.highBgColor = highBgColor;
	}
	public int getBgColorCb() {
		return bgColorCb;
	}
	public void setBgColorCb(int bgColorCb) {
		this.bgColorCb = bgColorCb;
	}
	
	
	
	public String getRelationKey() {
		return relationKey;
	}
	public void setRelationKey(String relationKey) {
		this.relationKey = relationKey;
	}
	public int getAdvancedType() {
		return advancedType;
	}
	public void setAdvancedType(int advancedType) {
		this.advancedType = advancedType;
	}
	public int getmDirection() {
		return mDirection;
	}
	public void setmDirection(int mDirection) {
		this.mDirection = mDirection;
	}
	
	
	public int getTextDataSource() {
		return textDataSource;
	}
	public void setTextDataSource(int textDataSource) {
		this.textDataSource = textDataSource;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	public String getBcolor() {
		return bcolor;
	}
	public void setBcolor(String bcolor) {
		this.bcolor = bcolor;
	}
	public String getTxtcontent() {
		return txtcontent;
	}
	public void setTxtcontent(String txtcontent) {
		this.txtcontent = txtcontent;
	}
	public String getZiti() {
		return ziti;
	}
	public void setZiti(String ziti) {
		this.ziti = ziti;
	}
	public int getFs() {
		return fs;
	}
	public void setFs(int fs) {
		this.fs = fs;
	}
	public int getLh() {
		return lh;
	}
	public void setLh(int lh) {
		this.lh = lh;
	}
	public String getFcolor() {
		return fcolor;
	}
	public void setFcolor(String fcolor) {
		this.fcolor = fcolor;
	}
	public int getFjc() {
		return fjc;
	}
	public void setFjc(int fjc) {
		this.fjc = fjc;
	}
	public int getFdx() {
		return fdx;
	}
	public void setFdx(int fdx) {
		this.fdx = fdx;
	}
	public int getFxx() {
		return fxx;
	}
	public void setFxx(int fxx) {
		this.fxx = fxx;
	}
	public int getFzx() {
		return fzx;
	}
	public void setFzx(int fzx) {
		this.fzx = fzx;
	}
	public int getFtype() {
		return ftype;
	}
	public void setFtype(int ftype) {
		this.ftype = ftype;
	}

}
