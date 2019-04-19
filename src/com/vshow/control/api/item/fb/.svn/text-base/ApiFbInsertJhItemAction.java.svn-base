package com.vshow.control.api.item.fb;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.JhItem;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendTime;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;


/**
 * 发布插播计划
 * @param account账号
 * @param password 密码 
 * @param jid 计划id
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiFbInsertJhItemAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
	private int jid;
	private String cids;
	
	@Override
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
				HashSet<Integer> tmidsset = new HashSet();
				try{	
					if (cids != null && !"".equals(cids)) {
						/** 获取选中的所有终端 **/
						String[] tids_s = cids.split("\\_");
						for (int i = 0; i < tids_s.length; i++) {
							tmidsset.add(Integer.parseInt(tids_s[i]));
						}
					}
					
					Scene se;
					/** 获取当前计划所有节目**/
					/** 获取计划名**/
					String jhName=(String)SqlConnect.getSqlMapInstance().queryForObject("see_jh_name", jid);
					List<JhItem> jhitems=SqlConnect.getSqlMapInstance().queryForList("sel_jh_item_all",jid);
					
					/**HashSet去重复**/
					HashSet<Integer> itemset=new HashSet();
					String cmds="";
					String downcmd = "";
					String playcons="";
					String playcon="";
					String itemidss="";
					for (JhItem jhitem : jhitems) {
						
						playcon = Constant.LOCAL.getA00152()+":" + jhitem.getItemnames();
						  
						playcon += Constant.LOCAL.getA00582()+" :" + jhitem.getSdate();

						playcon += Constant.LOCAL.getA00583()+" :" + jhitem.getEdate();
		                
		                if(itemidss.length()==0){
		                	itemidss=jhitem.getItemids();
		                	playcons=playcon;
		                }else{
		                	itemidss=itemidss+","+jhitem.getItemids();
		                	playcons=playcons+"^"+playcon;
		                }
		                String jhitemsString[]=jhitem.getItemids().split("\\,");
						/**拼接协议**/
						String cmd =jhitem.getSdate()+"_"+jhitem.getEdate()+"_";
						for (int i = 0; i < jhitemsString.length; i++) {
							itemset.add(Integer.parseInt(jhitemsString[i]));
							/**获取节目信息**/
							se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", Integer.parseInt(jhitemsString[i]));
							
							if (i == 0) {
								cmd = se.getFilename();
							} else {
								cmd += "|" + se.getFilename();
							}
							if(downcmd.length()==0){
								downcmd = se.getFilename() + ".zip";
							}else{
								downcmd += "|" + se.getFilename() + ".zip";
							}
							if (se.getVname().length() > 0
									&& (se.getVname().indexOf(':') == -1)) {
								downcmd += "|" + se.getVname();
							}
						}
						if(cmds.length()==0){
							cmds=jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
						}else{
							cmds=cmds+"^"+jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
						}
						
					}
					
					Client client;
					String filepathzip="";
					int fileExists=0;
					String[] vms;
					long clen=0L;
					long len=0L;
					int rid;
				
					if (itemset.size() > 0) {
						
						for (Integer itemid : itemset) {
							/**获取节目信息**/
							se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", itemid);
							if(se!=null){
								
								/**获取场景zip大小*/
								filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
								
								/**验证文件存在不存在: 0不存在,1存在**/
								fileExists=FileHandle.fileExists(filepathzip);
																		
								if(fileExists==0){
									return "success2"; 
								}
								
								len = FileHandle.getFileByte(filepathzip);
								
								/**获取视频,音频大小*/
								if(!"".equals(se.getVname())){					
									vms = se.getVname().split("\\|");
									for (int j = 0; j < vms.length; j++) {
										
										fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
										if(fileExists==0){
											return "success2"; 
										}
										len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
									}
								}
													
							}
							clen+=len;
						}
							
					    String logcontent =Constant.LOCAL.getA00653()+"["+Constant.LOCAL.getA00648()+"]:"+jhName;
						Log log = LogHandle.insertTheLogSend(LogType.type90, user.getId(), logcontent,1);
						String sendkey = log.getSendkey();
						String msg = "02" + clen + "/" + downcmd + "+"
								+ "sendkey!" + sendkey + "%cblist!" + cmds;		
						log.setMsg(msg);
						SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
						Result rs = new Result();
						MyMsg mymsg;
			            InsertSend is;
							/** 发送给终端**/
				            String msg0818=Constant.sendDownString(msg, sendkey,null);
							for (Integer cid : tmidsset) {
								client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", cid);
								Constant.ResetDownState(client.getMark(),"0.0");
								//sm.delete("del_one_senditem", client.getId());
								rs.setClid(client.getId());
								rs.setLogid(log.getId());
								rs.setState(0);
								rs.setType(ResultType.rt17);
								rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);			
								/** 添加指令记录**/
								//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
								
								for (JhItem jhitem : jhitems) {
									
									is = new InsertSend();
									is.setResultid(rid);
									is.setItemid(jhitem.getItemids()+",");
									is.setXiadate(jhitem.getXiadate());
									is.setSdate(jhitem.getSdate());
									is.setEdate(jhitem.getEdate());
									SqlConnect.getSqlMapInstance().insert("insert_one_insertitem", is);
									
									//更新状态
									SqlConnect.getSqlMapInstance().update("update_insertsend_state", rid);
									
								}
								
								/**添加执行结果最后一次播放记录**/
								//itemsids=itemsids.replaceAll("_", ",");
								ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt17, playcons, user.getId(), client.getMark(), log.getSendkey(), 0);
								code = "2";
							    
								if (client.getServerid() == 0) {
								   Mlt mt = Constant.messageMap.get(client.getMark());
								   if (mt != null) {
										mymsg = new MyMsg();
										mymsg.msg = msg0818;
										mymsg.sendkey = log.getSendkey();
										mt.allmsg.add(mymsg);
									}
								}
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
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

	public int getJid() {
		return jid;
	}

	public void setJid(int jid) {
		this.jid = jid;
	}

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}