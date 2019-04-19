package com.vshow.control.data;

public class DataHl {
	private int id;
	private String name; // 货币名称
	private String mBuyPrice; // 现钞买入价
	private String fBuyPrice; // 现汇买入价
	private String mSellPrice; // 现钞卖出价
	private String fSellPrice; // 现汇卖出价
	private String bankConversionPrice; // 银行折算价/中间价
	private String sdate; // 发布日期
	private String stime; // 发布时间
	private String symbol; // 货币简称

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getmBuyPrice() {
		return mBuyPrice;
	}

	public void setmBuyPrice(String mBuyPrice) {
		this.mBuyPrice = mBuyPrice;
	}

	public String getfBuyPrice() {
		return fBuyPrice;
	}

	public void setfBuyPrice(String fBuyPrice) {
		this.fBuyPrice = fBuyPrice;
	}

	public String getmSellPrice() {
		return mSellPrice;
	}

	public void setmSellPrice(String mSellPrice) {
		this.mSellPrice = mSellPrice;
	}

	public String getfSellPrice() {
		return fSellPrice;
	}

	public void setfSellPrice(String fSellPrice) {
		this.fSellPrice = fSellPrice;
	}

	public String getBankConversionPrice() {
		return bankConversionPrice;
	}

	public void setBankConversionPrice(String bankConversionPrice) {
		this.bankConversionPrice = bankConversionPrice;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
}
