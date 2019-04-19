package com.vshow.control.kh.bus.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.sf.json.*;

import org.apache.log4j.Logger;


import com.opensymphony.xwork.Action;
import com.vshow.control.data.BindBig;
import com.vshow.control.data.BindBus;
import com.vshow.control.data.Client;
import com.vshow.control.data.Result;
import com.vshow.control.data.bus.BusDevice;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class BusStopDataInteractAction implements Action {


	
	private String busInfos;         //请求信息
	
	private String content;          //返回值
	
	Logger logger  =  Logger.getLogger(BusStopDataInteractAction.class);
	
	@Override
	public String execute() throws Exception {
		
		//busInfos="[{\"deviceId\":9128,\"arrivalTime\":4,\"arrivalStation\":1,\"publishType\":1,\"lineName\":\"1路\"}"+
		 //        ",{\"deviceId\":9128,\"arrivalTime\":14,\"arrivalStation\":6,\"publishType\":1,\"lineName\":\"9路\"}"+
		//         ",{\"deviceId\":9128,\"arrivalTime\":2,\"arrivalStation\":0,\"publishType\":1,\"lineName\":\"17路\"}"+
		//         ",{'deviceId':9128,'arrivalTime':1,'arrivalStation':0,'publishType':1,'lineName':'35路'}"+
		//         ",{'deviceId':9005,'arrivalTime':9,'arrivalStation':3,'publishType':1,'lineName':'7路'}"+
		//         ",{'deviceId':9005,'arrivalTime':17,'arrivalStation':7,'publishType':1,'lineName':'18路'}"+
		 //        ",{'deviceId':9005,'arrivalTime':8,'arrivalStation':3,'publishType':1,'lineName':'21路'}"+
		//		   ",{'deviceId':9005,'arrivalTime':4,'arrivalStation':1,'publishType':1,'lineName':'24路'}"+
		//		   ",{'deviceId':9005,'arrivalTime':4,'arrivalStation':1,'publishType':1,'lineName':'26路'}"+
		//		   ",{'deviceId':9005,'arrivalTime':1,'arrivalStation':0,'publishType':1,'lineName':'83路'}"+
		//		   ",{'deviceId':9154,'arrivalTime':3,'arrivalStation':0,'publishType':1,'lineName':'24路'}"+
		//		   ",{'deviceId':9074,'arrivalTime':4,'arrivalStation':1,'publishType':1,'lineName':'2路'}"+
		//		   ",{'deviceId':9074,'arrivalTime':5,'arrivalStation':1,'publishType':1,'lineName':'3路'}"+
		//		   ",{'deviceId':9074,'arrivalTime':5,'arrivalStation':1,'publishType':1,'lineName':'9路'}"+
		//		   ",{'deviceId':9074,'arrivalTime':6,'arrivalStation':2,'publishType':1,'lineName':'26路'}"+
		//	       ",{'deviceId':9118,'arrivalTime':8,'arrivalStation':3,'publishType':1,'lineName':'1路'}"+
		//		   ",{'deviceId':9118,'arrivalTime':4,'arrivalStation':1,'publishType':1,'lineName':'4路'}"+
		//	       ",{'deviceId':9118,'arrivalTime':5,'arrivalStation':1,'publishType':1,'lineName':'9路'}"+
		//		   ",{\"deviceId\":9118,\"arrivalTime\":16,\"arrivalStation\":7,\"publishType\":1,\"lineName\":\"17路\"}]";
		
		
		logger.info("接收公交信息:"+busInfos);
		if(busInfos!=null&&!busInfos.equals("")){
			
			//归类Map
			Map<String,List> map=new HashMap<String,List>();
			
			//转换为json
			JSONArray jsonArray = JSONArray.fromObject(busInfos);
			ArrayList<BusDevice> busDevices = (ArrayList) JSONArray.toCollection(jsonArray,BusDevice.class);  //转化为list 
			
			for (BusDevice busDevice : busDevices) {
				if(busDevice.getArrivalTime()==-1&&busDevice.getArrivalStation()==-1){
					
				}else{
					List list=map.get(busDevice.getDeviceId());
					if(list==null){
						list=new ArrayList();
						list.add(busDevice);
						map.put(busDevice.getDeviceId(), list);
					}else{
						
						list.add(busDevice);
						map.put(busDevice.getDeviceId(), list);
					}
				}
			
			}
			
			
			//遍历map
			Integer bbus;
			for (String key : map.keySet()) {  
				  
			    System.out.println("Key = " + key+"   大小"+ map.get(key).size());
			    
			    JSONArray jsonArrayTo = JSONArray.fromObject(map.get(key));
				//System.out.println(jsonArrayTo.toString());
				
				    bbus=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_bindbus_deviceId_cid", key);
				    
	                if(bbus!=null){
	                     //获取发布的终端
	                   	 Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", bbus);
	                   	 if(client!=null){
	                   		 
	                   		if(client.getZxstate()==1){
	                   			String msg = "51+"+jsonArrayTo.toString() ;
		                   		
	                   			logger.info("公交信息:"+jsonArrayTo.toString());
		                	
		                		MyMsg mymsg;
		                		// 发送给终端
		                		if (client.getServerid() == 0) {                
		                			Mlt mt = Constant.messageMap.get(client.getMark());
		                			if (mt != null) {
		                				mymsg = new MyMsg();
		                				mymsg.msg = msg;
		                				mymsg.sendkey = "";
		                				mt.allmsgBuss.add(mymsg);
		                			}
		                		}
	                   		} 
	                   	
	                   	 }
	                }else{
	                	logger.info("公交巴士设备 ["+key+"]未绑定 ");
	                }           
	                
				
				
			}
			
		}
		
		
		
		
        content=SUCCESS;
		return SUCCESS;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getBusInfos() {
		return busInfos;
	}

	public void setBusInfos(String busInfos) {
		this.busInfos = busInfos;
	}


}
