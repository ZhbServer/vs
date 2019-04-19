package com.vshow.control.item;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.DataHl;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class CreateHlShowAction extends ActionSupport {
	
	private String cskeystrs;   
	private String symbolstrs;
	
	private int nameDisplay=0; // 货币名称是否显示  0隐藏 1显示
	private int mBuyPriceDisplay=0; // 现钞买入价 是否显示  0隐藏 1显示
	private int fBuyPriceDisplay=0; // 现汇买入价 是否显示  0隐藏 1显示
	private int mSellPriceDisplay=0; // 现钞卖出价 是否显示  0隐藏 1显示
	private int fSellPriceDisplay=0; // 现汇卖出价 是否显示  0隐藏 1显示
	private int bankConversionPriceDisplay=0; // 银行折算价/中间价 是否显示  0隐藏 1显示
	private int sdateDisplay=0; // 发布日期 是否显示  0隐藏 1显示
	private int stimeDisplay=0; // 发布时间 是否显示  0隐藏 1显示
	
	
	private String nameStr; // 货币名称
	private String mBuyPriceStr; // 现钞买入价
	private String fBuyPriceStr; // 现汇买入价
	private String mSellPriceStr; // 现钞卖出价
	private String fSellPriceStr; // 现汇卖出价
	private String bankConversionPriceStr; // 银行折算价/中间价
	private String sdateStr; // 发布日期
	private String stimeStr; // 发布时间
	private int hlFontSize;//字体大小
	private String hlFontColor;//字体颜色
	
	private List<DataHl> dataHls=new ArrayList<DataHl>();  //汇率集合
	
	@Override
	public String execute() throws Exception {
		
		nameStr=Constant.LOCAL.getA00610();
		mBuyPriceStr=Constant.LOCAL.getA00612();
		fBuyPriceStr=Constant.LOCAL.getA00611();
		mSellPriceStr=Constant.LOCAL.getA00614();
		fSellPriceStr=Constant.LOCAL.getA00613();
		bankConversionPriceStr=Constant.LOCAL.getA00615();
		sdateStr=Constant.LOCAL.getA00616();
		stimeStr=Constant.LOCAL.getA00617();
		
		
		//获取选择汇率集合
		symbolstrs=java.net.URLDecoder.decode(symbolstrs, "UTF-8"); 
		String[] sytrs=symbolstrs.split("\\,");
		DataHl dl;
		for (int i = 0; i < sytrs.length; i++) {
			dl=(DataHl)SqlConnect.getSqlMapInstance().queryForObject("sel_hl_show", sytrs[i]);
			if(dl!=null){
				dataHls.add(dl);
			}
		}
		String[] cskeyss=cskeystrs.split("\\,");
		for (int i = 0; i < cskeyss.length; i++) {
			if(cskeyss[i].equals("name")){
				nameDisplay=1;
			}else if(cskeyss[i].equals("fBuyPrice")){
				fBuyPriceDisplay=1;
			}else if(cskeyss[i].equals("mBuyPrice")){
				mBuyPriceDisplay=1;
			}else if(cskeyss[i].equals("fSellPrice")){
				fSellPriceDisplay=1;
			}else if(cskeyss[i].equals("mSellPrice")){
				mSellPriceDisplay=1;
			}else if(cskeyss[i].equals("bankConversionPrice")){
				bankConversionPriceDisplay=1;
			}else if(cskeyss[i].equals("sdate")){
				sdateDisplay=1;
			}else if(cskeyss[i].equals("stime")){
				stimeDisplay=1;
			}
			
		}	
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
	public int getHlFontSize() {
		return hlFontSize;
	}

	public void setHlFontSize(int hlFontSize) {
		this.hlFontSize = hlFontSize;
	}

	public String getHlFontColor() {
		return hlFontColor;
	}

	public void setHlFontColor(String hlFontColor) {
		this.hlFontColor = hlFontColor;
	}
	
	public String getNameStr() {
		return nameStr;
	}

	public void setNameStr(String nameStr) {
		this.nameStr = nameStr;
	}

	public String getmBuyPriceStr() {
		return mBuyPriceStr;
	}

	public void setmBuyPriceStr(String mBuyPriceStr) {
		this.mBuyPriceStr = mBuyPriceStr;
	}

	public String getfBuyPriceStr() {
		return fBuyPriceStr;
	}

	public void setfBuyPriceStr(String fBuyPriceStr) {
		this.fBuyPriceStr = fBuyPriceStr;
	}

	public String getmSellPriceStr() {
		return mSellPriceStr;
	}

	public void setmSellPriceStr(String mSellPriceStr) {
		this.mSellPriceStr = mSellPriceStr;
	}

	public String getfSellPriceStr() {
		return fSellPriceStr;
	}

	public void setfSellPriceStr(String fSellPriceStr) {
		this.fSellPriceStr = fSellPriceStr;
	}

	public String getBankConversionPriceStr() {
		return bankConversionPriceStr;
	}

	public void setBankConversionPriceStr(String bankConversionPriceStr) {
		this.bankConversionPriceStr = bankConversionPriceStr;
	}

	public String getSdateStr() {
		return sdateStr;
	}

	public void setSdateStr(String sdateStr) {
		this.sdateStr = sdateStr;
	}

	public String getStimeStr() {
		return stimeStr;
	}

	public void setStimeStr(String stimeStr) {
		this.stimeStr = stimeStr;
	}

	public int getNameDisplay() {
		return nameDisplay;
	}

	public void setNameDisplay(int nameDisplay) {
		this.nameDisplay = nameDisplay;
	}

	public int getmBuyPriceDisplay() {
		return mBuyPriceDisplay;
	}

	public void setmBuyPriceDisplay(int mBuyPriceDisplay) {
		this.mBuyPriceDisplay = mBuyPriceDisplay;
	}

	public int getfBuyPriceDisplay() {
		return fBuyPriceDisplay;
	}

	public void setfBuyPriceDisplay(int fBuyPriceDisplay) {
		this.fBuyPriceDisplay = fBuyPriceDisplay;
	}

	public int getmSellPriceDisplay() {
		return mSellPriceDisplay;
	}

	public void setmSellPriceDisplay(int mSellPriceDisplay) {
		this.mSellPriceDisplay = mSellPriceDisplay;
	}

	public int getfSellPriceDisplay() {
		return fSellPriceDisplay;
	}

	public void setfSellPriceDisplay(int fSellPriceDisplay) {
		this.fSellPriceDisplay = fSellPriceDisplay;
	}

	public int getBankConversionPriceDisplay() {
		return bankConversionPriceDisplay;
	}

	public void setBankConversionPriceDisplay(int bankConversionPriceDisplay) {
		this.bankConversionPriceDisplay = bankConversionPriceDisplay;
	}

	public int getSdateDisplay() {
		return sdateDisplay;
	}

	public void setSdateDisplay(int sdateDisplay) {
		this.sdateDisplay = sdateDisplay;
	}

	public int getStimeDisplay() {
		return stimeDisplay;
	}

	public void setStimeDisplay(int stimeDisplay) {
		this.stimeDisplay = stimeDisplay;
	}

	public List<DataHl> getDataHls() {
		return dataHls;
	}

	public void setDataHls(List<DataHl> dataHls) {
		this.dataHls = dataHls;
	}

	public static void main(String[] args) {
		Field[] fields = new DataHl().getClass().getDeclaredFields();
		for (int i=0; i < fields.length; i++)  
		{    
		    System.out.println(fields[i].getName());    
		}  
	}
	public String getCskeystrs() {
		return cskeystrs;
	}
	public void setCskeystrs(String cskeystrs) {
		this.cskeystrs = cskeystrs;
	}
	public String getSymbolstrs() {
		return symbolstrs;
	}
	public void setSymbolstrs(String symbolstrs) {
		this.symbolstrs = symbolstrs;
	}
}
