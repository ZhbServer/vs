package com.vshow.control.api.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;

/**
 * 录入终端
 * @param account 账号
 * @param password 密码 
 * @param ids 录入的终端 id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiEnterClientAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String ids;

	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				String marks = "";
				ClientGroupRelation cgr;
				String [] cid = ids.split("_");
				
				
				if(Constant.lType.equals("1")){
					String netmarks="";
					for (int i = 0; i < cid.length; i++) {
						 
						String mark = (String) SqlConnect.getSqlMapInstance()
								.queryForObject("s_ajkdd_ip", Integer.parseInt(cid[i]));
						if (!mark.isEmpty()) {
							
							if(netmarks.length()==0){
								if(mark.trim().length()>0){
									netmarks=mark.trim();
								}
							}else{
								if(mark.trim().length()>0){
									netmarks=netmarks+","+mark.trim();
								}
							}
						}
					}
					
					//认证
					String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+netmarks;
					String result_con=HttpRequest.sendPost(Constant.NetJmAddUrl, param);
					
					Map resultMap=JsonHelper.toMap(result_con); 
					String returnCode=(String)resultMap.get("code");
					String info=returnCode;
					if(returnCode==null){
						//认证未通过[软加密]
						System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
						
					}else{
						if (returnCode.equals("100001")){
						    //验证失败(账号或者密码不对)
							System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
							code="100001";
							
						}else{
							
							if(returnCode.equals("100002")){
								//使用点位数超出总点位数	
								System.out.println(Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]");
								code="100002";
								
							}else if(returnCode.equals("100003")){
								
								
								//获取总点位
								String netCountStr =(String)resultMap.get("netCount");
								//获取使用点位
								String surCountStr =(String)resultMap.get("surCount"); 
								
								Constant.NetCountStr=netCountStr;
								
								Constant.NetSurCountStr=surCountStr;
								
								for (int i = 0; i < cid.length; i++) {
									 
									String mark = (String) SqlConnect.getSqlMapInstance()
											.queryForObject("s_ajkdd_ip", Integer.parseInt(cid[i]));
									if (!mark.isEmpty()) {
										List list = SqlConnect.getSqlMapInstance().queryForList("sel_client_bymark",
												mark.trim());
										if (list.size() == 0) {
											marks += " " + mark;
											Client cll = new Client();
											cll.setIp("未获取IP");
											cll.setMark(mark.trim());
											cll.setName("未命名终端");
											cll.setServerid(0);
											cll.setUid(user.getId());
											cll.setNvn(1);
											cll.setNetstate(1);
											SqlConnect.getSqlMapInstance().insert("add_client2", cll);
											int clid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
													"sel_client_bymark", mark);
											cgr = new ClientGroupRelation();
											cgr.setCid(clid);
											cgr.setUid(user.getId());
											cgr.setGtype(0);
											cgr.setGid(0);
											SqlConnect.getSqlMapInstance().delete("del_cgr_cid", clid);
											SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
											
											//上级添加
											String urtkeys[]=user.getTkey().split("\\\\_");
										    for (int j = 0; j < urtkeys.length-1; j++) {
												if(Integer.parseInt(urtkeys[j])!=user.getId()){
													
													cgr = new ClientGroupRelation();
													cgr.setCid(clid);
													cgr.setUid(Integer.parseInt(urtkeys[j]));
													cgr.setGtype(0);
													cgr.setGid(0);
													SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
													
													
												}
											}
										 
										}
						                
										//SqlConnect.getSqlMapInstance().update("up_allmark", mark);
										
										SqlConnect.getSqlMapInstance().delete("del_allmark_mark", mark);
										SqlConnect.getSqlMapInstance().delete("del_allmark_mark_name", mark);
										
										//if (Constant.messageMap.size() < Constant.G4) {
											if (Constant.messageMap.get(mark) == null) {
												Mlt msgList = new Mlt();
												Constant.messageMap.put(mark, msgList);
											}
											//更新终端在线状态
											if(VSNettyChannelMap.get((mark))==null){
												
											}else{
												//更新终端在线状态
												Client tc=new Client();
												tc.setMark(mark);
												tc.setZxstate(1);
												SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
											}
										//}

									}
								}
								code="2";
								LogHandle.insertTheLog(LogType.type40, user.getId(), Constant.LOCAL.getA00412()+":" + marks,1,1);
							}
						}		
					}
				}else{
					for (int i = 0; i < cid.length; i++) {
						 
						String mark = (String) SqlConnect.getSqlMapInstance()
								.queryForObject("s_ajkdd_ip", Integer.parseInt(cid[i]));
						if (!mark.isEmpty()) {
							List list = SqlConnect.getSqlMapInstance().queryForList("sel_client_bymark",
									mark);
							if (list.size() == 0) {
								marks += " " + mark;
								Client cll = new Client();
								cll.setIp("未获取IP");
								cll.setMark(mark.trim());
								cll.setName("未命名终端");
								cll.setServerid(0);
								cll.setUid(user.getId());
								cll.setNvn(0);
								cll.setNetstate(0);
								SqlConnect.getSqlMapInstance().insert("add_client2", cll);
								int clid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
										"sel_client_bymark", mark);
								cgr = new ClientGroupRelation();
								cgr.setCid(clid);
								cgr.setUid(user.getId());
								cgr.setGtype(0);
								cgr.setGid(0);
								SqlConnect.getSqlMapInstance().delete("del_cgr_cid", clid);
								SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
								
								
								
								//上级添加
							
								String urtkeys[]=user.getTkey().split("\\\\_");
							    for (int j = 0; j < urtkeys.length-1; j++) {
									if(Integer.parseInt(urtkeys[j])!=user.getId()){
										
										cgr = new ClientGroupRelation();
										cgr.setCid(clid);
										cgr.setUid(Integer.parseInt(urtkeys[j]));
										cgr.setGtype(0);
										cgr.setGid(0);
										SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
										
									}
								}
							}
			                
							//SqlConnect.getSqlMapInstance().update("up_allmark", mark);
							SqlConnect.getSqlMapInstance().delete("del_allmark_mark", mark);
							SqlConnect.getSqlMapInstance().delete("del_allmark_mark_name", mark);
							
							if (Constant.messageMap.size() < Constant.G4) {
									
									if (Constant.messageMap.get(mark) == null) {
										Mlt msgList = new Mlt();
										Constant.messageMap.put(mark, msgList);
									}
									//更新终端在线状态
									if(VSNettyChannelMap.get((mark))==null){
										
									}else{
										
										//更新终端在线状态
										Client tc=new Client();
										tc.setMark(mark);
										tc.setZxstate(1);
										SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
									
									}
									code = "2";
							 }else{
									code = "5";  //加密狗 点位不够
							 }
								
							
							
					

						}
					}
					
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);
		content = jsons.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
