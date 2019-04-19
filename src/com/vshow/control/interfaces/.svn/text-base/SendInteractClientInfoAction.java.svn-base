package com.vshow.control.interfaces;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.util.DataUtil;
import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;

import com.vshow.control.data.Result;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class SendInteractClientInfoAction extends ActionSupport {

    private String account;   //登录名
	
	private String password;  //密码
	
	private String clientMark; //终端标识

	private String content; // 返回内容



	Log logger = LogFactory.getLog(SendInteractClientInfoAction.class);



	@Override
	public String execute() throws Exception {

		
		String info = "";
		String code = "00000"; // 00000发送成功 00001 标识码不能为空 00002终端不存在 00003参数不合法 00004 终端未认证 00005终端未接受00006账户或者密码错误 00007文件不合法
		boolean flag = false;
		Map map=new HashMap<String, String>();
		
		//验证用户
		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_check_user_login", usparam);
		
		if (user == null) {
			code = "00006";
			info = "账户或者密码错误";
		}else{
			
			Client selClient=new Client();
			selClient.setUid(user.getId());
			selClient.setMark(clientMark);
			Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_info_uid_mark",selClient);
			
			//终端不存在
			if(client==null){
				code = "00008";
				info = "终端不存在";
			}else{
				// 发送终端
				Mlt mt = Constant.messageMap.get(client.getMark());
				if (mt != null) {
					
					String sendkey = "";

					String msg0818 = "";

					MyMsg mymsg;
					
					JSONObject jsonObject;
					
					Protocol protocol=new Protocol();
					
					protocol.setType(ProtocolType.TYPE68);
					
					sendkey=Constant.createSendkey(1,DateUtil.getTime());
					
					protocol.setSendkey(sendkey);
					
					jsonObject = JSONObject.fromObject(protocol);
					
					msg0818=Constant.sendDownString(jsonObject.toString(),sendkey,null);
					
					mymsg = new MyMsg();
					
					mymsg.msg = msg0818;
					
					mymsg.sendkey = sendkey;
					
					mt.allmsg.add(mymsg);

					Map dllMapInfoMap=new HashMap<String, Object>();

					int count = 0;
					// 等待终端请求回复
					while (true) {

						// 60秒超时退出
						if (count == 60) {
							info="终端未接收[发送不成功,超时]";
							code = "00005";
							break;
						}
						// 查看终端有没有消息返回
						dllMapInfoMap =(Map)Constant.dllMapInfo.get(mymsg.sendkey);

						if (dllMapInfoMap!=null){
							
							map.put("playName", dllMapInfoMap.get("playName"));
							
							map.put("vol", dllMapInfoMap.get("vol"));
							
							map.put("emergencyArea", dllMapInfoMap.get("emergencyArea"));
							
							break;

						}

						count++;
						
                        Thread.sleep(1000);

					}

				} else {
					code = "00004";
					info = "终端未认证";
				}
				
				map.put("onlineStatus", client.getZxstate());
				
			}
			
		}
		
		map.put("code", code);
		
		map.put("info", info);
		
        JSONArray jsons1 = JSONArray.fromObject(map);
        
		content = jsons1.toString();
		
		return SUCCESS;
		
	}

	public String getClientMark() {
		return clientMark;
	}

	public void setClientMark(String clientMark) {
		this.clientMark = clientMark;
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

	public void setContent(String content) {
		this.content = content;
	}
	
	public Log getLogger() {
		return logger;
	}

	public void setLogger(Log logger) {
		this.logger = logger;
	}

	public String getContent() {
		return content;
	}

}
