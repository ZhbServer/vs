package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.CsSet;
import com.vshow.control.data.DataHl;
import com.vshow.control.datainfo.HlRead;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToDataHlAction implements Action  {
	private int height;
	private int width;
	private int xy_x=0;
	private int xy_y=0;
	
	private int edittype=0;     //进入类型 0新增 1修改 
	
	private String hlFontColor="000000"; //字体颜色
	private String hlFontSize="16";      //字体大小
	private String hlRtime="6";          //刷新时间(小时)
	private String cskeystrs="";            //行 
	private String symbolstrs="";           //列
	
	private String nameDisplayStr="name"; // 货币名称是否显示  0隐藏 1显示
	private String mBuyPriceDisplayStr="mBuyPrice"; // 现钞买入价 是否显示  0隐藏 1显示
	private String fBuyPriceDisplayStr="fBuyPrice"; // 现汇买入价 是否显示  0隐藏 1显示
	private String mSellPriceDisplayStr="mSellPrice"; // 现钞卖出价 是否显示  0隐藏 1显示
	private String fSellPriceDisplayStr="fSellPrice"; // 现汇卖出价 是否显示  0隐藏 1显示
	private String bankConversionPriceDisplayStr="bankConversionPrice"; // 银行折算价/中间价 是否显示  0隐藏 1显示
	private String sdateDisplayStr="sdate"; // 发布日期 是否显示  0隐藏 1显示
	private String stimeDisplayStr="stime"; // 发布时间 是否显示  0隐藏 1显示
	
	private String[] symbols_show;   //选择的货币
	
	
	private List<CsSet>  csss=new ArrayList<CsSet>();
	
	private List<DataHl> dataHls=new ArrayList<DataHl>();

	@Override
	public String execute() throws Exception {
		//获取全部汇率
		dataHls=SqlConnect.getSqlMapInstance().queryForList("sel_hl_all");
	
		
		
		if(edittype==0){
			nameDisplayStr="name"; // 货币名称是否显示  
			mBuyPriceDisplayStr="mBuyPrice"; // 现钞买入价 
			fBuyPriceDisplayStr="fBuyPrice"; // 现汇买入价
			mSellPriceDisplayStr="mSellPrice"; // 现钞卖出价 
			fSellPriceDisplayStr="fSellPrice"; // 现汇卖出价 
			bankConversionPriceDisplayStr="bankConversionPrice"; // 银行折算价/中间价 是否显示  
			sdateDisplayStr="sdate"; // 发布日期 
			stimeDisplayStr="stime"; // 发布时间 
			symbols_show=new String[dataHls.size()];
			for (int i = 0; i < dataHls.size(); i++) {
				symbols_show[i]=dataHls.get(i).getSymbol();
			}
		}else{
			symbols_show=null;
			symbols_show=symbolstrs.split("\\,");
			nameDisplayStr=""; // 货币名称是否显示  
			mBuyPriceDisplayStr=""; // 现钞买入价 
			fBuyPriceDisplayStr=""; // 现汇买入价
			mSellPriceDisplayStr=""; // 现钞卖出价 
			fSellPriceDisplayStr=""; // 现汇卖出价 
			bankConversionPriceDisplayStr=""; // 银行折算价/中间价 是否显示  
			sdateDisplayStr=""; // 发布日期 
			stimeDisplayStr=""; // 发布时间 
			String[] cskeyss=cskeystrs.split("\\,");
			for (int i = 0; i < cskeyss.length; i++) {
				if(cskeyss[i].equals("name")){
					nameDisplayStr="name"; // 货币名称是否显示  
				}else if(cskeyss[i].equals("fBuyPrice")){
					fBuyPriceDisplayStr="fBuyPrice"; // 现汇买入价
				}else if(cskeyss[i].equals("mBuyPrice")){
					mBuyPriceDisplayStr="mBuyPrice"; // 现钞买入价 
				}else if(cskeyss[i].equals("fSellPrice")){
					fSellPriceDisplayStr="fSellPrice"; // 现汇卖出价 
				}else if(cskeyss[i].equals("mSellPrice")){
					mSellPriceDisplayStr="mSellPrice"; // 现钞卖出价 
				}else if(cskeyss[i].equals("bankConversionPrice")){
					bankConversionPriceDisplayStr="bankConversionPrice"; // 银行折算价/中间价 是否显示  
				}else if(cskeyss[i].equals("sdate")){
					sdateDisplayStr="sdate"; // 发布日期 
				}else if(cskeyss[i].equals("stime")){
					stimeDisplayStr="stime"; // 发布时间 
				}
				
			}	
		}
		
		
		CsSet cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00610());  //货币名称
		cs.setCskey("name");
		csss.add(cs);
		
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00611());  //现汇买入价
		cs.setCskey("fBuyPrice");
		csss.add(cs);
		
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00612());  //现钞买入价
		cs.setCskey("mBuyPrice");
		csss.add(cs);
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00613());  //现汇卖出价
		cs.setCskey("fSellPrice");
		csss.add(cs);
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00614());  //现钞卖出价
		cs.setCskey("mSellPrice");
		csss.add(cs);
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00615());  //银行折算价/中间价
		cs.setCskey("bankConversionPrice");
		csss.add(cs);
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00616());  //发布日期
		cs.setCskey("sdate");
		csss.add(cs);
		
		cs=new CsSet();
		cs.setCsvalue(Constant.LOCAL.getA00617());  //发布日期
		cs.setCskey("stime");
		csss.add(cs);
		
		
		
		return SUCCESS;
	}
	
	

	public String[] getSymbols_show() {
		return symbols_show;
	}



	public void setSymbols_show(String[] symbols_show) {
		this.symbols_show = symbols_show;
	}



	public int getEdittype() {
		return edittype;
	}



	public void setEdittype(int edittype) {
		this.edittype = edittype;
	}



	public String getNameDisplayStr() {
		return nameDisplayStr;
	}



	public void setNameDisplayStr(String nameDisplayStr) {
		this.nameDisplayStr = nameDisplayStr;
	}



	public String getmBuyPriceDisplayStr() {
		return mBuyPriceDisplayStr;
	}



	public void setmBuyPriceDisplayStr(String mBuyPriceDisplayStr) {
		this.mBuyPriceDisplayStr = mBuyPriceDisplayStr;
	}



	public String getfBuyPriceDisplayStr() {
		return fBuyPriceDisplayStr;
	}



	public void setfBuyPriceDisplayStr(String fBuyPriceDisplayStr) {
		this.fBuyPriceDisplayStr = fBuyPriceDisplayStr;
	}



	public String getmSellPriceDisplayStr() {
		return mSellPriceDisplayStr;
	}



	public void setmSellPriceDisplayStr(String mSellPriceDisplayStr) {
		this.mSellPriceDisplayStr = mSellPriceDisplayStr;
	}



	public String getfSellPriceDisplayStr() {
		return fSellPriceDisplayStr;
	}



	public void setfSellPriceDisplayStr(String fSellPriceDisplayStr) {
		this.fSellPriceDisplayStr = fSellPriceDisplayStr;
	}



	public String getBankConversionPriceDisplayStr() {
		return bankConversionPriceDisplayStr;
	}



	public void setBankConversionPriceDisplayStr(
			String bankConversionPriceDisplayStr) {
		this.bankConversionPriceDisplayStr = bankConversionPriceDisplayStr;
	}



	public String getSdateDisplayStr() {
		return sdateDisplayStr;
	}



	public void setSdateDisplayStr(String sdateDisplayStr) {
		this.sdateDisplayStr = sdateDisplayStr;
	}



	public String getStimeDisplayStr() {
		return stimeDisplayStr;
	}



	public void setStimeDisplayStr(String stimeDisplayStr) {
		this.stimeDisplayStr = stimeDisplayStr;
	}



	public List<DataHl> getDataHls() {
		return dataHls;
	}

	public void setDataHls(List<DataHl> dataHls) {
		this.dataHls = dataHls;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}

	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}

	public List<CsSet> getCsss() {
		return csss;
	}

	public void setCsss(List<CsSet> csss) {
		this.csss = csss;
	}
	
	public String getHlFontColor() {
		return hlFontColor;
	}

	public void setHlFontColor(String hlFontColor) {
		this.hlFontColor = hlFontColor;
	}

	public String getHlFontSize() {
		return hlFontSize;
	}

	public void setHlFontSize(String hlFontSize) {
		this.hlFontSize = hlFontSize;
	}

	public String getHlRtime() {
		return hlRtime;
	}

	public void setHlRtime(String hlRtime) {
		this.hlRtime = hlRtime;
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
