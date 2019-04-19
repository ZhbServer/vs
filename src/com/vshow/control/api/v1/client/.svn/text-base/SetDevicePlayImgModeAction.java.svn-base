package com.vshow.control.api.v1.client;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.data.Area;
import com.vshow.control.api.v1.data.Device;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.Item;
import com.vshow.control.data.Log;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolPlayImgMode;
import com.vshow.control.protocol.ProtocolPlayStop;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoVideo;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.Img2Base64Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;


/**
 * 获取当前用户区域下所有终端
 * @param access_token 
 * @param 
 * @author w
 * @version 6.1 
 *
 */
public class SetDevicePlayImgModeAction extends BaseAction {

	
	private Integer areaCode;  //区域表示/分组id 0表示默认
	private String  deviceMark;//终端标识
	private int  type;  // 1自动播放  2手动播放  
	
	
	
	
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
				 clientTemp.setGid(areaCode);
				 clientTemp.setUid(user.getId());
				 Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_gid_mark",clientTemp);
				 if(client==null){
					 
					 //终端不存在
					 responseEntity = ResponseEntity.err0009();
					 return SUCCESS;
					 
				 }else{
				
					 //client.setZxstate(1);					
					 if(client.getZxstate()==1){
						 
						 Mlt mt; 
						 String msg;
						 MyMsg mymsg;
						 
						 mt = Constant.messageMap.get(client.getMark());
						 if (mt != null) {
							 
							 //发布的数据
							 Protocol protocol=new Protocol();
				        	 
				        	 protocol.setType(ProtocolType.TYPE74);
				        	 
				        	 ProtocolPlayImgMode playImgMode=new ProtocolPlayImgMode();
				        	 
				        	 playImgMode.setPlayImgMode(type);
				        	 
				        	 List<ProtocolPlayImgMode> playImgModeList=new ArrayList<ProtocolPlayImgMode>();
				        	 
				        	 playImgModeList.add(playImgMode);
				        	 
				        	 protocol.setProtocolPlayBaseList(playImgModeList);
				        	 
				        	 String sendkey=LogHandle.createSendKey();
				        	 
				        	 protocol.setSendkey(sendkey);
			        		 
			        		 JSONObject jsonObject = JSONObject.fromObject(protocol);
				        	 
				        	 //String msg0818=Constant.sendDownString(jsonObject.toString(), "",null);
				        	 		
						     mymsg = new MyMsg();
						     
							 mymsg.msg = jsonObject.toString();
							 
							 mymsg.sendkey = sendkey;
							 
							 mt.allmsg.add(mymsg);
									
							 responseEntity = ResponseEntity.err0000();
								
						 }else{
							 
							 responseEntity = ResponseEntity.err0011();
						 
						 }
						 	
							
							
						 
					 }else{
						 
						 //终端不在线
						 responseEntity = ResponseEntity.err0010();
						 
						 
					 }
					 
					 //responseEntity.putDataValue("datas", device);
					 
					 
				 }
				  
			 }
			
		}else{
			
			responseEntity = ResponseEntity.err0008();
			
		}
		
        return Action.SUCCESS;

	}

	public Integer getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}

	public String getDeviceMark() {
		return deviceMark;
	}

	public void setDeviceMark(String deviceMark) {
		this.deviceMark = deviceMark;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}


	
}
