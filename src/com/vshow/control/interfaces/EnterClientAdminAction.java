package com.vshow.control.interfaces;

import java.text.SimpleDateFormat;
import java.util.Map;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;

import com.vshow.control.data.Result;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;

import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class EnterClientAdminAction extends ActionSupport {
	
	private String clientName;   //终端名
	private String clientMark;   //终端标识
	private String content;  //返回内容    
	
	
	Log logger = LogFactory.getLog(EnterClientAdminAction.class);
	
	@Override
	public String execute() throws Exception {
		
		logger.info("自动录入终端:"+clientMark);
		String info="";
		int state=0;
		//通过终端标识查询终端在列表里是否存在
		if(clientMark==null||clientMark.equals("")){
			
			info="[自动录入终端]终端标识不合法"+clientMark;
			
			state=1;
		
		}else{
			
			//验证是否自动录入
			if(VVersion.le_enter==1){
				
				Client clientEnter=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_make_all_client",clientMark);
				
				if(clientEnter==null){
					 
					 //修改未录入终端名
					 //查找未录入终端存在不存在  /存在 查找未录入终端名
					 Integer noEnterClientId=(Integer)SqlConnect.getSqlMapInstance().queryForObject("s_ajk_ip", clientMark);
					 
					 if(noEnterClientId!=null){
						 AllMark am= (AllMark)SqlConnect.getSqlMapInstance().queryForObject("sel_allmark_name", clientMark);
						 if(am==null){
							 
							 am=new AllMark();
							 am.setMark(clientMark);
							 am.setName(clientName);
							 SqlConnect.getSqlMapInstance().insert("insert_allmark_name", am);
							 
						 }else{
							 
							 am.setMark(clientMark);
							 am.setName(clientName);
							 SqlConnect.getSqlMapInstance().update("up_allmark_name", am);
							 
						 }
					 }
					
					
				}else{
					state=7;
					
					if(clientName.equals("未命名终端")){
						
					}else{
						
						clientEnter.setName(clientName);
						SqlConnect.getSqlMapInstance().update("update_client_name", clientEnter);
							
					}
					
				}
			}else{
				Client clientEnter=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_make_all_client",clientMark);
				if(clientEnter==null){
					if(Constant.lType.equals("1")){
						
						//认证
						String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+clientMark;
						
						String result_con=HttpRequest.sendPost(Constant.NetJmAddUrl, param);
						
						Map resultMap=JsonHelper.toMap(result_con); 
						
						String code=(String)resultMap.get("code");
						
						if(code==null){
							
							//认证未通过[软加密]
							
							System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
							
							info=Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]";
							
							state=2;
						
						}else{
							if (code.equals("100001")){
							    
								//验证失败(账号或者密码不对)
								System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
								
								info=Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]";
								
								state=3;
								
							}else{
								
								if(code.equals("100002")){
									
									//使用点位数超出总点位数
									
									System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
									
									info=Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]";
									
									state=4;
									
								}else if(code.equals("100003")){
									
									 SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								    
									 Client client = new Client();
									 client.setName(clientName);
									 client.setMark(clientMark);
									 client.setIp("");
									 //client.setLast(sFormat.format(new Date()));
									 client.setLast("");
									 client.setServerid(0);
									 client.setDownstate("0");
									 client.setSize("");
									 client.setNvn(0);
									 client.setUid(1);
									 client.setNetstate(1);
									 Integer cid=(Integer)SqlConnect.getSqlMapInstance().insert("add_client", client);
									 
									 ClientGroupRelation cgr = new ClientGroupRelation();
									 cgr.setCid(cid);
									 cgr.setGid(0);
									 cgr.setGtype(0);
									 cgr.setUid(1);
									 
									 SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
									
									 LogHandle.insertTheLog(LogType.type53, 1,Constant.LOCAL.getB00012()+":" +clientName+"["+clientMark+"]", 1,1);
									 
									 System.out.println(Constant.LOCAL.getA00509()+ "["+Constant.LOCAL.getA00506()+"]  clientName"+clientName+"  clientMark["+clientMark+"]");
									 
									 info=Constant.LOCAL.getA00509()+ "["+Constant.LOCAL.getA00506()+"]  clientName"+clientName+"  clientMark["+clientMark+"]";
									
									 //获取总点位
									 String netCountStr =(String)resultMap.get("netCount");
									 //获取使用点位
									 String surCountStr =(String)resultMap.get("surCount"); 
									
									 Constant.NetCountStr=netCountStr;
									
									 Constant.NetSurCountStr=surCountStr;
									
									 //录入成功
									 String themark = client.getMark();
									 if (themark.length() == 17) {
										Mlt msgList = new Mlt();
										msgList.ip = client.getIp();
										Constant.messageMap.put(themark, msgList);
									 }
									 state=5;
								
								}
							}
						}
					}else{
				
						 SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						
						 Client client = new Client();
						 client.setName(clientName);
						 client.setMark(clientMark);
						 client.setIp("");
						 //client.setLast(sFormat.format(new Date()));
						 client.setLast("");
						 client.setServerid(0);
						 client.setDownstate("0");
						 client.setSize("");
						 client.setNvn(0);
						 client.setUid(1);
						 client.setNetstate(0);
						 Integer cid=(Integer)SqlConnect.getSqlMapInstance().insert("add_client", client);
						 
						 ClientGroupRelation cgr = new ClientGroupRelation();
						 cgr.setCid(cid);
						 cgr.setGid(0);
						 cgr.setGtype(0);
						 cgr.setUid(1);
						 
						 SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
						
						 LogHandle.insertTheLog(LogType.type53, 1,Constant.LOCAL.getB00012()+":" +clientName+"["+clientMark+"]", 1,1);
						 
						if (Constant.messageMap.size() >= Constant.G4) {
							info="录入成功,但无法发送指令";
							state=6;
						} else {
								String themark = client.getMark();
								if (themark.length() == 17) {
									
									Mlt msgList = new Mlt();
									msgList.ip = client.getIp();
									Constant.messageMap.put(themark, msgList);
									
									//更新终端在线状态
									if(VSNettyChannelMap.get((themark))==null){
										
									}else{
										//更新终端在线状态
										Client tc=new Client();
										tc.setMark(themark);
										tc.setZxstate(1);
										SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
									}
								}
								info="录入成功";
								state=5;
						}
						
					}
					
				
				
			}else{
				state=7;
				
				//查看终端 发布指令
				
				Result result=(Result)SqlConnect.getSqlMapInstance().queryForObject("sel_result_clid_type26", clientEnter.getId());
				if(result!=null){
					state=8;
					info=clientEnter.getName();
					
					SqlConnect.getSqlMapInstance().update("up_on_result_state", result.getId());
					
				}else{
					clientEnter.setName(clientName);
					SqlConnect.getSqlMapInstance().update("update_client_name", clientEnter);
					
				}
				
			}
			
				
		 }
			
			
			
			
			
		}
		
		//JsonValue jv=new JsonValue();
		//jv.setCode(content);
		//JSONArray jsonArray = JSONArray.fromObject(jv);
		//content = jsonArray.toString();
		
		logger.info(clientMark+" - "+state+info);
		content="{'code':"+state+",'info':'"+info+"'}";
		
		return SUCCESS;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientMark() {
		return clientMark;
	}
	public void setClientMark(String clientMark) {
		this.clientMark = clientMark;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
