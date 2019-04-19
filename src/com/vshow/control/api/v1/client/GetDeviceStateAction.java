package com.vshow.control.api.v1.client;

import java.io.File;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.data.ClientState;
import com.vshow.control.api.v1.data.Device;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Client;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolPlayStop;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Img2Base64Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class GetDeviceStateAction extends BaseAction{
	private String  deviceMark;//终端标识
	private Integer areaCode;  //区域表示/分组id 0表示默认


	@Override
	public String execute() throws Exception {
		
		//通过token获取用户信息
		if(ActionContext.getContext().get("user")!=null&&!ActionContext.getContext().get("user").equals("")){
			
			 User user=(User)JSONObject.toBean(JSONObject.fromObject(ActionContext.getContext().get("user")), User.class);
			 
			 if(user==null){
				 
				  responseEntity = ResponseEntity.err0008();
				 
			 }else{
				 
				 //获取终端信息
				 Client clientTemp =new Client();
				 clientTemp.setMark(deviceMark);
				 clientTemp.setUid(user.getId());
				 clientTemp.setGid(areaCode);
				 Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_gid_mark",clientTemp);
				 if(client==null){
					 //终端不存在
					 responseEntity = ResponseEntity.err0009();
					 return SUCCESS;
				 }else{
					 Device device=new Device();
					 device.setId(client.getId());
					 device.setMark(client.getMark());
					 device.setName(client.getName());
					 if(client.getStandbystate()==1){
						 device.setState(2);
					 }else{
						 device.setState(client.getZxstate()); 
					 }
					 
					
					 if(client.getZxstate()==1){
						 
						 Mlt mt; 
						 String msg;
						 MyMsg mymsg;
						 
						 mt = Constant.messageMap.get(client.getMark());
						 if (mt != null) {
							 //获取终端当前状态

							 Protocol protocol=new Protocol();
				        	 
				        	 protocol.setType(ProtocolType.TYPE77);
				        	 
				        	 String sendkey=LogHandle.createSendKey();

				        	 protocol.setSendkey(sendkey);
				        
			        		 JSONObject jsonObject = JSONObject.fromObject(protocol);
				        	 
				        	 String msg0818=Constant.sendDownString(jsonObject.toString(), "",null);				    
									
						     mymsg = new MyMsg();
						     
							 mymsg.msg = msg0818;
							 
							 mymsg.sendkey = sendkey;
							 
							 mt.allmsg.add(mymsg);
						
							 responseEntity = ResponseEntity.err0000();
								
								
							//判断发送的消息有咩有返回
								int i = 0;
								boolean c03=false;
								while(true){
									
									Thread.sleep(1000);
									i++;
									if (i >120) {
										break;
									}
									ClientState clientState=(ClientState)Constant.clientPlayMap.get(sendkey);
									if(clientState==null){
										
									}else{
										//列表存在返回成功
										device.setClientState(clientState);
										Constant.clientPlayMap.remove(sendkey);
										c03=true;
									}
									
									if(c03){
										responseEntity = ResponseEntity.err0000();
										break;
									}
								}
								
								
								
						 }else{
							 responseEntity = ResponseEntity.err0011();
						 }
						 	
						 
					 }else{
						 
						 //终端不在线
						 responseEntity = ResponseEntity.err0010();
						 
						 
					 }
					 List<Device> devices=new ArrayList<Device>();
					 devices.add(device);
					 responseEntity.putDataValue("datas", devices);
					 
					 
				 }
				  
			 }
			
		}else{
			
			responseEntity = ResponseEntity.err0008();
			
		}
		
        return Action.SUCCESS;

	}


	public String getDeviceMark() {
		return deviceMark;
	}

	public void setDeviceMark(String deviceMark) {
		this.deviceMark = deviceMark;
	}
	
	public Integer getAreaCode() {
		return areaCode;
	}


	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}

	
	

	
}
