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
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendInteract;
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
 * 发布互动节目
 * @param account账号
 * @param password 密码 
 * @param id 节目id
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiFbInteractItemAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
	private int id;
	private String cids;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用5.节目文件不存在

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
					
					Client client;
					Scene se;
					String filepathzip="";
					int fileExists=0;
					String[] vms;
					long clen=0L;
					long len=0L;
					int rid;
							
					/**获取节目信息**/
					InteractItem item = (InteractItem) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_id_interactitem", id);
					String filenNameR =(String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename_id", id);
					
					List<Scene> scenes=new ArrayList<Scene>();
					
					Constant.recursionFileNameTson(filenNameR, scenes);
					
					/** 验证文件存在不存在，并且获取文件大小*/
					String vmsStrs="";
					for (int i = 0; i < scenes.size(); i++) {
						se=scenes.get(i);
						if(se!=null){
							
							/**获取场景zip大小*/
							filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
							
							/**验证文件存在不存在: 0不存在,1存在**/
							fileExists=FileHandle.fileExists(filepathzip);
																	
							//if(fileExists==0){
							//	return "success2"; 
							//}
							
							len = FileHandle.getFileByte(filepathzip);
							
							/**获取视频,音频大小*/
							if(!"".equals(se.getVname())){					
								vms = se.getVname().split("\\|");
								for (int k = 0; k < vms.length; k++) {
									
									 /**验证多视频音频文件是重复**/
									if(vmsStrs.indexOf(vms[k])==-1){
										fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[k]);
										if(fileExists==0){
											map.put("code", "5");
											JSONArray jsons = JSONArray.fromObject(map);
											content = jsons.toString();
											return SUCCESS;
										}
										
										len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[k]);
										
										vmsStrs=vmsStrs+"*"+vms[k];
									}
								}
							}
												
						}
						clen+=len;
						
					}

					String cmd = "";
					Scene tempScene = (Scene) SqlConnect.getSqlMapInstance().queryForObject("sel_one_interactscene", item.getId());
					cmd = tempScene.getFilename();
					String downcmd = "";
					for (int i = 0; i < scenes.size(); i++) {
						Scene sce = scenes.get(i);
						if (i == 0) {
							 cmd = sce.getFilename();
							downcmd = sce.getFilename() + ".zip";
						} else {
							 cmd = cmd + "|" + sce.getFilename();
							downcmd = downcmd + "|" + sce.getFilename() + ".zip";
						}
						if (sce.getVname().length() > 0
								&& (sce.getVname().indexOf(':') == -1)) {
							downcmd += "|" + sce.getVname();
						}

					}

					String logcontent = Constant.LOCAL.getA00445() + ":"+ item.getName();
				
					Log log = LogHandle.insertTheLogSend(LogType.type77, user.getId(), logcontent,1);
					String sendkey = log.getSendkey();
					String msg = "02" + clen + "/" + downcmd + "+"
							+ "sendkey!" + sendkey + "%playlist!" + cmd;
					log.setMsg(msg);
					SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
					Result rs = new Result();
					SendInteract sd = new SendInteract();
					MyMsg mymsg;
					/** 发送给终端**/
					String msg0818=Constant.sendDownString(msg, sendkey,null);
					for (Integer cid : tmidsset) {
						client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", cid);
						Constant.ResetDownState(client.getMark(),"0.0");
						//sm.delete("del_one_senditem", client.getId());
						rs.setClid(client.getId());
						rs.setLogid(log.getId());
						rs.setState(0);
						rs.setType(ResultType.rt2);
						rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);			
						/** 添加指令记录**/
						//Constant.addCml(cid, rid, log.getId(),log.getSendkey());					
						sd.setResultid(rid);
						sd.setInteractitemid(id);
						SqlConnect.getSqlMapInstance().insert("insert_one_sendinteractitem", sd);
						
						ClientPlayHandle.insertClientPlay(String.valueOf(id), 2, ResultType.rt1, logcontent, user.getId(), client.getMark(), log.getSendkey(), 0);
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}