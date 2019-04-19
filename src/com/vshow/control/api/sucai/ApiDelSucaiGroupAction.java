package com.vshow.control.api.sucai;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.Sucai;

import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 删除素材分组
 * @param account账号
 * @param password 密码 
 * @param sids 素材分组id
 * @param type 素材类型
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDelSucaiGroupAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String sids;
	private int type;

	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用
		
		String logcontent = "";  //记录删除的分组名
		String sclogcontent="";  //记录删除的素材名

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
				
				try {
					String [] sid = sids.split("_");
					for (int i = 0; i < sid.length; i++) {

						// 查询分组的名字
						String str = (String) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_scgroup_name_id", Integer.parseInt(sid[i]));
			            //查询这个分组下的所有素材id
						List<Integer> gsscids=SqlConnect.getSqlMapInstance().queryForList("sel_scgroup_sc_id_all",Integer.parseInt(sid[i]));
						
						//删除素材
						for (int j = 0; j < gsscids.size(); j++) {
							// 通过素材id查询素材
							Sucai sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
									"get_sc_all_id", gsscids.get(j));
							
						
							
							if (sclogcontent == "") {
								sclogcontent = sc.getName();
							} else {
								sclogcontent = sclogcontent + "," + sc.getName();
							}
							
							
							
							//删除素材
							SqlConnect.getSqlMapInstance().delete("del_sucai", sc);
							//删除素材与分组的表
							SqlConnect.getSqlMapInstance().delete("del_scgroup_relation_scid", gsscids.get(j));
							
							

							// 本地删除素材文件
							// (删除素材:1背景,4图片,5Flash)
							if (sc.getType() == 1 || sc.getType() == 4 || sc.getType() == 5) {
								String filepath = Constant.FILES + File.separator  + sc.getFilename();
								FileHandle.deleteFile(filepath);
								//删除缩略图
								String sfilepath = Constant.FILES + File.separator +"_"+sc.getFilename();
								FileHandle.deleteFile(sfilepath);
								
								// (删除素材:2音频,3视频)
							} else if (sc.getType() == 2 || sc.getType() == 3) {
								String filepath = Constant.FILES+ File.separator  + sc.getFilename();
								FileHandle.deleteFile(filepath);
								//删除flv文件
								String fileName=sc.getFilename().substring(0, sc.getFilename().lastIndexOf("."));
								String fileFlv=Constant.FILES+ File.separator  +fileName+"_.flv";
								FileHandle.deleteFile(fileFlv);
								// (删除素材:6PPT,7Word,8Excel,9PDF)
							} else if (sc.getType() == 6 || sc.getType() == 7
									|| sc.getType() == 8 || sc.getType() == 9) {
								String filepath = Constant.FILES + File.separator  + sc.getFilename();
								FileHandle.delFolder(filepath);  
							}

							sc=null;
							
						}
						
						if (logcontent == "") {
							logcontent = str;
						} else {
							logcontent = logcontent + "," + str;
						}
						SqlConnect.getSqlMapInstance().delete("del_scgroup_id", Integer.parseInt(sid[i]));
					}
					
					//添加日志
					String c1="";
					String c2="";
				    if(type==1){
						c1= Constant.LOCAL.getA00099()+"["+Constant.LOCAL.getA00058()+"]";
						c2=Constant.LOCAL.getA00082();
					}else if(type==4){
						c1= Constant.LOCAL.getA00099()+"["+Constant.LOCAL.getA00061()+"]";
						c2=Constant.LOCAL.getA00085();
					}else if(type==3){
						c1= Constant.LOCAL.getA00099()+"["+Constant.LOCAL.getA00060()+"]";
						c2=Constant.LOCAL.getA00089();
					}else if(type==2){
						c1= Constant.LOCAL.getA00099()+"["+Constant.LOCAL.getA00059()+"]";
						c2=Constant.LOCAL.getA00086();
					}else if(type==5){
						c1= Constant.LOCAL.getA00099()+"[FLASH]";
						c2=Constant.LOCAL.getA00084();
					}else if(type==6){
						c1= Constant.LOCAL.getA00099()+"[PPT]";
						c2=Constant.LOCAL.getA00088();
					}else if(type==7){
						c1= Constant.LOCAL.getA00099()+"[Word]";
						c2=Constant.LOCAL.getA00090();
					}else if(type==8){
						c1= Constant.LOCAL.getA00099()+"[Excel]";
						c2=Constant.LOCAL.getA00083();
					}else if(type==9){
						c1= Constant.LOCAL.getA00099()+"[PDF]";
						c2=Constant.LOCAL.getA00087();
					}else if(type==10){
						c1= Constant.LOCAL.getA00099()+"["+Constant.LOCAL.getA00062()+"]";
						c2=Constant.LOCAL.getA00091();
					}								
				    
					if(sclogcontent==""){
						LogHandle.insertTheLog(LogType.type5, user.getId(),c1+":" + logcontent,1,1);
					}else{
						LogHandle.insertTheLog(LogType.type5, user.getId(), c1+":" + logcontent+"("+c2+":"+sclogcontent+")",1,1);
					}
					
					code = "2";
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getSids() {
		return sids;
	}

	public void setSids(String sids) {
		this.sids = sids;
	}
	
}
