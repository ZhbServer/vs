package com.vshow.control.api.v1.client;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

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
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoVideo;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.Img2Base64Util;
import com.vshow.control.tool.MainReCeMsgHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSEchoServerHandler;


/**
 * 获取当前用户区域下所有终端
 * @param access_token 
 * @param 
 * @author w
 * @version 6.1 
 *
 */
public class GetDeviceInfoAction extends BaseAction {

	Logger logger  =  Logger.getLogger(GetDeviceInfoAction.class);
	private Integer areaCode;  //区域表示/分组id 0表示默认
	private String  deviceMark;//终端标识
	
	
	
	
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
							 
							    //终端实时截屏
							    String jkFilename =(int)(Math.random() * 10000)+Long.toString(System.currentTimeMillis()) + ".png";
								File f = new File(Constant.SEE + File.separator + jkFilename);
						        msg = "03+" + jkFilename+"%"+0.3;
						      
								mymsg = new MyMsg();
								mymsg.msg = msg;
								mymsg.sendkey = "";
								mt.allmsg.add(mymsg);
								
						      //终端播放列表
								String sendkey = LogHandle.createSendKey();
								msg = "24+sendkey!" + sendkey ;
								mt = Constant.messageMap.get(client.getMark());
								
								mymsg = new MyMsg();
								mymsg.msg = msg;
								mymsg.sendkey = sendkey;
								mt.allmsg.add(mymsg);
								
								
							//判断发送的消息有咩有返回
								int i = 0;
								boolean c03=false;
								boolean c24=false;
								while(true){
									
									Thread.sleep(1000);
									i++;
									if (i >120) {
										break;
									}
									
									if (f.exists()) {
										//文件存在已回传成功
										c03=true;
										System.out.println(f);
									} 
									
									Device deviceTemp=(Device)Constant.clientPlayMap.get(sendkey);
									if(deviceTemp==null){
										
									}else{
										//列表存在返回成功
										device.setItems(deviceTemp.getItems());
										device.setPlayState(deviceTemp.getPlayState());
										c24=true;
										Constant.clientPlayMap.remove(sendkey);
									}
									
									if(c03&&c24){
										responseEntity = ResponseEntity.err0000();
										break;
									}
								}
								
								//验证监控文件手否存在
								if (f.exists()) {
									
									//监控图片转成base64串儿
									String imgbese=Img2Base64Util.getImgStr(f.getPath());
									device.setScreenshot(imgbese);
									//监控到以后删除当前文件
									try {
										 f.delete();
									} catch (Exception e) {
										// TODO: handle exception
									}
									
									
									
								}
								
								
						 }else{
							 responseEntity = ResponseEntity.err0011();
						 }
						 	
						 
					 }else{
						 
						 //终端不在线
						 responseEntity = ResponseEntity.err0010();
						 
						 
					 }
					 
					 
					 //System.out.println("device 的值:"+ device);
					 logger.info("device 的值:"+ device);
					 
					 try {
						 
						 List<Device> devices=new ArrayList<Device>();
						 devices.add(device);
						 responseEntity.putDataValue("datas", devices);
						 
					} catch (Exception e) {
						// TODO: handle exception
						 responseEntity = ResponseEntity.err0014();
					}
					
					 
					 
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
	

    public static void main(String[] args) {
    	 Device device=new Device();
    	 List<Device> devices=new ArrayList<Device>();
		 devices.add(device);
	} 
	
	

	
	
	
}
