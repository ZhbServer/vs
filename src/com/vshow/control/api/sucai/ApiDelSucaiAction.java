package com.vshow.control.api.sucai;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;

import com.vshow.control.data.User;
import com.vshow.control.letv.cloud.LetvCloudUtil;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 删除素材
 * @param account账号
 * @param password 密码 
 * @param ids 素材id
 * @param type 素材类型
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDelSucaiAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String ids;
	private int type;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		// 追加删除文件的名字
		String logcontent = "";
		
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
					String [] sid = ids.split("_");
					for (int i = 0; i < sid.length; i++) {
						// 通过素材id查询素材
						Sucai sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("get_sc_all_id", Integer.parseInt(sid[i]));
						
						if (logcontent == "") {
							logcontent = sc.getName();
						} else {
							logcontent = logcontent + "," + sc.getName();
						}
						
						// 删除素材
						SqlConnect.getSqlMapInstance().delete("del_sucai", sc);
					    // 删除素材与分组的表
						SqlConnect.getSqlMapInstance().delete("del_sucai_group", Integer.parseInt(sid[i]));
						// 删除素材共享
						SqlConnect.getSqlMapInstance().delete("del_scshare", sc.getId());
						
						// 本地删除素材文件
						// (删除素材:1背景,4图片,5Flash)
						if (sc.getType() == 1 || sc.getType() == 4 || sc.getType() == 5) {
							//删除原图片
							String filepath = Constant.FILES + File.separator + sc.getFilename();
							FileHandle.deleteFile(filepath);
							//删除缩略图
							String sfilepath = Constant.FILES + File.separator +"_"+sc.getFilename();
							FileHandle.deleteFile(sfilepath);
							
							// (删除素材:2音频,3视频)
						} else if (sc.getType() == 2 || sc.getType() == 3) {
							String filepath = Constant.FILES + File.separator + sc.getFilename();
							FileHandle.deleteFile(filepath);
							//删除flv文件
							String fileName=sc.getFilename().substring(0, sc.getFilename().lastIndexOf("."));
							String fileFlv=Constant.FILES + File.separator +fileName+"_.flv";
							FileHandle.deleteFile(fileFlv);
							
								
							SucaiCloud  sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param", sc.getFilename());
							
							if(sCloud!=null){
								SqlConnect.getSqlMapInstance().delete("del_sucaiCloud_videoid", sCloud.getVideoid());	
							}
							
							// (删除素材:6PPT,7Word,8Excel,9PDF)
						} else if (sc.getType() == 6 || sc.getType() == 7
									|| sc.getType() == 8 || sc.getType() == 9) {
								String filepath = Constant.FILES + File.separator + sc.getFilename();
								FileHandle.delFolder(filepath);  
						}
					}
					
					// 判断有没有内容
					if (!"".equals(logcontent)) {
						// 记录日志
						if (type == 1) {
							//背景
							LogHandle.insertTheLog(LogType.type2, user.getId(), Constant.LOCAL.getA00082()+":" + logcontent, 1,1);
						} else if (type == 4) {
							//图片
							LogHandle.insertTheLog(LogType.type2, user.getId(),  Constant.LOCAL.getA00085()+":" + logcontent, 1,1);
						} else if (type == 2) {
							//音频
							LogHandle.insertTheLog(LogType.type2, user.getId(), Constant.LOCAL.getA00086()+":" + logcontent, 1,1);
						} else if (type == 3) {
							//视频
							LogHandle.insertTheLog(LogType.type2, user.getId(),  Constant.LOCAL.getA00089()+":" + logcontent, 1,1);
						} else if (type == 5) {
							//Flash
							LogHandle.insertTheLog(LogType.type2, user.getId(),  Constant.LOCAL.getA00084()+":" + logcontent, 1,1);
						} else if (type == 6) {
							//PPT
							LogHandle.insertTheLog(LogType.type2, user.getId(),  Constant.LOCAL.getA00088()+":" + logcontent, 1,1);
						} else if (type == 7) {
							//Word
							LogHandle.insertTheLog(LogType.type2, user.getId(), Constant.LOCAL.getA00090()+":" + logcontent, 1,1);
						} else if (type == 8) {
							//Excel
							LogHandle.insertTheLog(LogType.type2, user.getId(),  Constant.LOCAL.getA00083()+":" + logcontent, 1,1);
						} else if (type == 9) {
							//PDF
							LogHandle.insertTheLog(LogType.type2, user.getId(), Constant.LOCAL.getA00087()+":" + logcontent, 1,1);
						} else if (type == 10) {
							//文本
							LogHandle.insertTheLog(LogType.type2, user.getId(), Constant.LOCAL.getA00091()+":" + logcontent, 1,1);
						}
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
