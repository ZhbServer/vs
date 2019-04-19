package com.vshow.control.interfaces;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.tools.ant.taskdefs.Sleep;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDataSource;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class WarningInteraceAction extends ActionSupport {
	
	private String account;   //登录名
	
	private String password;  //密码
	
	private String macs;      //终端标识 发送到哪台显示屏的唯一凭证,格式为: ["AD:XC:AW:DD:AS:AS","AD:XC:AW:DD:AS:12"]  多个用 "," 分割

	private int opt;          //0撤销  1发布 
	
	Logger logger  =  Logger.getLogger(WarningInteraceAction.class);
	
	private String code;    //返回的code值  00000 发送成功  00001 账户或者密码错误  00002 发送的标识不存在或者未录入  00003 发布的广告屏无预警节目  00004 超时
	
	private String content;  //返回内容
	
	@Override
	public String execute() throws Exception {
	
		
		logger.info("接收电梯接口数据信息:");
		logger.info("account:"+account);
		logger.info("macs:"+macs);
		logger.info("opt:"+opt);
		
		//验证用户
		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_check_user_login", usparam);
		
		if (user == null) {
			
			code = "00001";
		
		} else {
			
		    //验证终端是否存在
			if(macs!=null&&!macs.equals("")){
				
				JSONArray jsonArray = JSONArray.fromObject(macs);
				
				String mac="";
				
				String sendkey="";
				
				String msg0818="";
				
				MyMsg mymsg;
				
				JSONObject jsonObject;
				
				Protocol protocol=new Protocol();
	        	 
	        	protocol.setType(ProtocolType.TYPE62);
	        	 
	        	ProtocolPlayBase ppb=new ProtocolPlayBase();
	         
	        	ProtocolDataSource pds=new ProtocolDataSource();
	        	 
	        	pds.setOpt(opt);
	        	 
	        	ppb.setmMsgJson(pds);
	        	 
	        	protocol.setProtocolPlayBaseList(ppb);
	        	
				for (int i = 0; i < jsonArray.size(); i++) {
				
					sendkey=LogHandle.createSendKey();
					
					protocol.setSendkey(sendkey);
					
					jsonObject = JSONObject.fromObject(protocol);
					
					msg0818=Constant.sendDownString(jsonObject.toString(),sendkey,null);
					
					mac=jsonArray.get(i).toString();
					
					//查询标识存在不存在
					Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_make_all_client", mac);
					
					if(client==null){
						
						code="00002";
						
						break;
						
					}else{
						 //发送终端
						 Mlt mt = Constant.messageMap.get(mac);
						 if (mt != null) {
							 
								mymsg = new MyMsg();
								mymsg.msg = msg0818;
								mymsg.sendkey = sendkey;
								mt.allmsg.add(mymsg);
								
								Integer getMapSendkeyVal;
								
								int count=0;
								//等待终端请求回复
								while(true){
								    
									//60秒超时退出
									if(count==60){
										code="00004";
										break;
									}
								    //查看终端有没有消息返回
								    getMapSendkeyVal=Constant.warningMapCheck.get(mymsg.sendkey);
										
									if(getMapSendkeyVal!=null&&!getMapSendkeyVal.equals("")){
												
											if(getMapSendkeyVal==1||getMapSendkeyVal==2){
												//正常播放/撤销成功
												code="00000";
												
											} else if(getMapSendkeyVal==0){
												//无预警节目
												code="00003";
											}
											break;
											
									  }
										
									  count++;
										
									  Thread.sleep(1000);
										
										
								}
								
						 }else{
							  code="00002";
						 }
						
					}
					
				}
				
				
			}else{
				code = "00002";
			}
		
		}
		
		Map map=new HashMap<String, String>();
		
		map.put("code", code);
		
        JSONArray jsons1 = JSONArray.fromObject(map);
        
		content = jsons1.toString();
		
		return SUCCESS;
	}
	
	
	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getMacs() {
		return macs;
	}


	public void setMacs(String macs) {
		this.macs = macs;
	}


	public int getOpt() {
		return opt;
	}


	public void setOpt(int opt) {
		this.opt = opt;
	}


	
}
