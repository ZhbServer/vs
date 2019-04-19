package com.vshow.control.dataif;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ItemKey;
import com.vshow.control.data.Log;
import com.vshow.control.data.User;
import com.vshow.control.data.program.ProgramDataSourceUnit;
import com.vshow.control.data.program.ResourceType;
import com.vshow.control.kh.bus.api.BusStopDataInteractAction;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDataSource;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class ConditionSendInterfaceAction  extends BaseAction {
	
	private String conditionKey;    //  发布的条件key 
	
	private String macs;     // 标识码      ["AD:XC:AW:DD:AS:AS","AD:XC:AW:DD:AS:12","AD:XC:AW:DD:AS:56"] 
	
	private String access_token;  //token
	
	Logger logger  =  Logger.getLogger(ConditionSendInterfaceAction.class);
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		
		//验证token
		String account=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_token_user", access_token);
		
		if(account==null||account.equals("")){
			
			responseEntity = ResponseEntity.err0001();
			
			return SUCCESS;
			
		}else{
			
			User user=(User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_account", account);
			
			if(user!=null){
				if(user.getBan()!=0){
					responseEntity = ResponseEntity.err0002();
					return SUCCESS;
				}
			}else{
				
				responseEntity = ResponseEntity.err0001();
				return SUCCESS;
			}
			
		}
		
		
	
		JSONArray jsonArray;
				
		if(macs!=null&&!macs.equals("")){
			
			if(conditionKey!=null&&!conditionKey.equals("")){
				
				 //需要发布的终端 
				 jsonArray = JSONArray.fromObject(macs);
				 
				 String mac="";
	             
				 //发布的数据
				 Protocol protocol=new Protocol();
	        	 
	        	 protocol.setType(ProtocolType.TYPE71);
	        	 
	        	 //获取需要发布的节目
	        	 ItemKey iKey=(ItemKey)SqlConnect.getSqlMapInstance().queryForObject("sel_key_filename", conditionKey);
	        	 
	        	 if(iKey==null){
	        		    //key值对应的节目不存在
	        			responseEntity = ResponseEntity.err0005();
	        			
	        	 }else{
	        		 
	        		 protocol.setProtocolPlayStitching(iKey.getFilename());
	        		 
	        		 JSONObject jsonObject = JSONObject.fromObject(protocol);
		        	 
		        	 String msg0818=Constant.sendDownString(jsonObject.toString(), "",null);
		        	 
		        	 MyMsg mymsg;
		        	 
		        	 String noClient="";
		        	 
		        	 ClientGroupRelation cgr;
		        	 ClientGroupRelation tempCgr;
		        	 cgr =new ClientGroupRelation();
	        		 cgr.setAccount(account);
	        		 
	        		 String sendkey=LogHandle.createSendKey();
	        		 
		        	 //发送终端
		        	 for (int i = 0; i < jsonArray.size(); i++) {
		        		
		        		mac=jsonArray.get(i).toString();
		        		 //验证终端是否属于当前用户
		        		cgr.setMark(mac);
		        		
		        		tempCgr=(ClientGroupRelation)SqlConnect.getSqlMapInstance().queryForObject("sel_client_token_check",cgr);
		        		 
		        		if(tempCgr!=null){
		            		 
		        			 Mlt mt = Constant.messageMap.get(mac);
							 if (mt != null) {
									
								    mymsg = new MyMsg();
									mymsg.msg = msg0818;
									mymsg.sendkey = sendkey;
									mt.allmsg.add(mymsg);
									
							 }else{
								 
								 //终端不存在或 未录入/未认证/不属于当前用户
								 if(noClient.length()==0){
									 noClient=mac;	 
								 }else{
									 noClient=noClient+","+mac;
								 }
								  
							 }
							 
		        		}else{
		        			 
							 //终端不存在或 未录入/未认证
							 if(noClient.length()==0){
								 noClient=mac;	 
							 }else{
								 noClient=noClient+","+mac;
							 }
		        			
		        		}
		            	
		            	 
		            	
		            	 
					 }
		        	 
		        	 //部分终端未找到
		        	 if(noClient.length()!=0){
		        		 
		        		 responseEntity = ResponseEntity.err0006();
		        		 
		        		 responseEntity.putDataValue("macs", noClient);
		        		 
		        	 }else{
		        		 //发布成功
		        		 responseEntity = ResponseEntity.err0000();
		        		 
		        	 }
	        		 
	        	 }
	        	 
	        	 
	        
					  
			 }else{
				 
				 //条件为空
				 responseEntity = ResponseEntity.err0004();
			 }
			
		}else{
			
			//终端为空
			responseEntity = ResponseEntity.err0004();
		}
		
		
		return SUCCESS;
	}

	

	public String getConditionKey() {
		return conditionKey;
	}



	public void setConditionKey(String conditionKey) {
		this.conditionKey = conditionKey;
	}



	public String getAccess_token() {
		return access_token;
	}



	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}



	public String getMacs() {
		return macs;
	}

	public void setMacs(String macs) {
		this.macs = macs;
	}

	
	
}
