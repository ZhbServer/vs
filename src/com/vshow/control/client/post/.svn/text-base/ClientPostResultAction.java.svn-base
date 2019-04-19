package com.vshow.control.client.post;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.log4j.Logger;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.gson.JsonArray;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.count.CountPeople;
import com.vshow.control.count.CountPeopleDataAnalysis;
import com.vshow.control.data.Client;
import com.vshow.control.data.ResultDownFail;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ClientPostResultAction extends ActionSupport {
	

	private String reportJson;
	
	Logger logger  =  Logger.getLogger(ClientPostResultAction.class);
	@Override
	public String execute() throws Exception {
		
		logger.info("接收终端提交信息执行结果:"+reportJson);
		
		if(reportJson!=null&&!reportJson.equals("")){
			
				//转换为json
				JSONObject jsonObject = JSONObject.fromObject(reportJson);
				
				String cMark=jsonObject.getString("cMark");  
				
				int stype=jsonObject.getInt("stype");    //结果类型
				
				String sendkey=jsonObject.getString("sendkey");
				
				String downstate=jsonObject.getString("downstate");  //下载百分比
				
				//String fileName=jsonObject.getString("fileName");  //节目名
				
			    //String resultTypeStr=jsonObject.getString("resultTypeStr");  //发布这行结果类型 
				
			    Client cli = new Client();
			
			    cli.setMark(cMark);
		
				if (sendkey.length() > 2) {
					
					
					cli.setName(sendkey);
					
					//判断返回结果
					if(stype==1){
						
						cli.setState(2);	
						cli.setDownstate("100");
						
					}else{
						
						 //22 协议无法下载  1已发送   27已接收  10正在下载
						if(stype==27||stype==10){
							
							//Constant.messageMapCache.remove(cMark+"@"+sendkey);
							
						}
						
						cli.setState(stype);
						
					}
					
					try {
						
						 // 下载结束 修改 状态
						 SqlConnect.getSqlMapInstance().update("up_on_result_suc", cli);
						
						 if(stype==1){
							 //Constant.downloadQueue.remove(cli.getMark()+"@"+sendkey);
							 Constant.downloadQueue.remove(cli.getMark());
						 }
						 
						
						 //更新最后一次播放状态
						 SqlConnect.getSqlMapInstance().update("up_cp_state",cli);
						 
						 SqlConnect.getSqlMapInstance().update("up_warning_item",cli);
						 
						 
						 //如果resultType=17  插播定时下载
						 
						 /*if(resultTypeStr!=null){
							 
							 if(resultTypeStr.equals("17")){
								 
							 }
							 
						 }*/
						
					} catch (Exception e) {
						 e.printStackTrace();
					}
				}
				
				cli.setIp("");
			    //更新终端下载结果/最后连接时间
				cli.setDownstate(downstate);
                cli.setLast(Constant.getCurrentDate());
				SqlConnect.getSqlMapInstance().update("update_xiaba_last", cli);
			
			
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
