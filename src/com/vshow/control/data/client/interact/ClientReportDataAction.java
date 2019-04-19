package com.vshow.control.data.client.interact;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.count.CountPeople;
import com.vshow.control.count.CountPeopleDataAnalysis;

public class ClientReportDataAction extends ActionSupport {
	
	
	private String reportJson;
	
	Logger logger  =  Logger.getLogger(ClientReportDataAction.class);
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		
		logger.info("接收终端提交信息:"+reportJson);
		System.out.println("开始接收  ClientReportDataAction");
		if(reportJson!=null&&!reportJson.equals("")){
			//转换为json
			JSONObject jsonObject = JSONObject.fromObject(reportJson);
			System.out.println(jsonObject.toString());
			String mMac=jsonObject.getString("mMac");
			int mType=jsonObject.getInt("mType");
			JSONObject mReportObject=jsonObject.getJSONObject("mReportObject");
			if(mType==1){
				CountPeopleDataAnalysis.countPeopleAnalysis(mMac, mReportObject);
			}
			
		}
		return SUCCESS;
	}
	public String getReportJson() {
		return reportJson;
	}
	public void setReportJson(String reportJson) {
		this.reportJson = reportJson;
	}
}
