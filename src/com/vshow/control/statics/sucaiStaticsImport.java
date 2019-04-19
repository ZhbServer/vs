package com.vshow.control.statics;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.SucaiPlayCount;
import com.vshow.control.statics.sucaiStaticsImport.jsonClient;
import com.vshow.control.statics.sucaiStaticsImport.jsonDate;
import com.vshow.control.statics.sucaiStaticsImport.jsonItem;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSEchoServerHandler;

public class sucaiStaticsImport implements Action{


	/**
	 * 开机回传   /每次整点回传
	 */
	Logger logger  =  Logger.getLogger(sucaiStaticsImport.class);
	public String execute() throws Exception {
		
		
		
		ActionContext context=ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		//统计播放次数
		String countReportJson=request.getParameter("countReport");
		if(countReportJson!=null&&!countReportJson.equals("")){
			logger.info("开始回传统计数据:"+countReportJson);
			Constant.playCountMsgs.add(countReportJson);
			logger.info("回传数据结束");
		}
		
		
		//统计SDK广告播放次
		
		String countReportSdkJson=request.getParameter("countReportSdk");
		if(countReportSdkJson!=null&&!countReportSdkJson.equals("")){
			logger.info("开始回传统计数据Sdk:"+countReportSdkJson);
			Constant.playCountMsgsSdk.add(countReportSdkJson);
			logger.info("回传数据结束Sdk");
		}
		
		
		
		return null;
	};
	


	
	public static class jsonDate{
		private String mMac;
		private String mDatetime;
		private List<jsonClient> mProgramCountList;
		public String getmMac() {
			return mMac;
		}
		public void setmMac(String mMac) {
			this.mMac = mMac;
		}
		public String getmDatetime() {
			return mDatetime;
		}
		public void setmDatetime(String mDatetime) {
			this.mDatetime = mDatetime;
		}
		public List<jsonClient> getmProgramCountList() {
			return mProgramCountList;
		}
		public void setmProgramCountList(List<jsonClient> mProgramCountList) {
			this.mProgramCountList = mProgramCountList;
		}
	}
	
	public static class jsonClient{
		private String mName;
	    private List<jsonItem> mItemCountList;
		public String getmName() {
			return mName;
		}
		public void setmName(String mName) {
			this.mName = mName;
		}
		public List<jsonItem> getmItemCountList() {
			return mItemCountList;
		}
		public void setmItemCountList(List<jsonItem> mItemCountList) {
			this.mItemCountList = mItemCountList;
		}
	}
	
	public static class jsonItem{
		private String mType;
		private String mFile;
		private String mCount;
		private String mClickCount;
		
		
		
		public String getmClickCount() {
			return mClickCount;
		}
		public void setmClickCount(String mClickCount) {
			this.mClickCount = mClickCount;
		}
		public String getmType() {
			return mType;
		}
		public void setmType(String mType) {
			this.mType = mType;
		}
		public String getmFile() {
			return mFile;
		}
		public void setmFile(String mFile) {
			this.mFile = mFile;
		}
		public String getmCount() {
			return mCount;
		}
		public void setmCount(String mCount) {
			this.mCount = mCount;
		}
	}
}
