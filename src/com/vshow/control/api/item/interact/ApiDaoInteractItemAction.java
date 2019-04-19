package com.vshow.control.api.item.interact;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Scene;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 导出互动节目
 * @param account账号
 * @param password 密码 
 * @param iid 节目id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDaoInteractItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private int iid;
	private String fname;

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
				try {
					// 获取节目
					InteractItem item = (InteractItem) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_id_interactitem", iid);
					
					// 创建节目文件夹
					String temp = Long.toString(System.currentTimeMillis());

					String olddir = Constant.FILES + File.separator + temp;
					new File(olddir).mkdir();

					Scene scene;
					String oldfile;
					String newfile;
					Scene tempScene = (Scene) SqlConnect.getSqlMapInstance().queryForObject("sel_one_interactscene",
							iid);
					String playlist = "playlist=";
					//String playlist2 = "playlist=";
					
					
					String filenNameR =(String)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename_id", iid);
					
					List<Scene> scenes=new ArrayList<Scene>();
					
					Constant.recursionFileNameTson(filenNameR, scenes);
					
					//拼接播放协议
					long clen=0L;

					int fileExists=0;
					String[] vms;
					String filepathzip; 
					String cmd = "";
					String downcmd = "";
					for (int i = 0; i < scenes.size(); i++) {
						scene = (Scene) scenes.get(i);
						if (i == 0) {
							playlist = playlist+scene.getFilename();
							cmd = scene.getFilename();
							downcmd = scene.getFilename() + ".zip";
						} else {
							playlist = playlist + "|" + scene.getFilename();
							cmd = cmd + "|" + scene.getFilename();
							downcmd = downcmd + "|" + scene.getFilename() + ".zip";
						}
						
						if (scene.getVname().length() > 0
								&& (scene.getVname().indexOf(':') == -1)) {
							downcmd += "|" + scene.getVname();
						}
						oldfile = Constant.FILES + File.separator + scene.getFilename();
						// newfile = olddir + File.separator + scene.getFilename();
						// new File(newfile).mkdir();
						// FileHandle.copy(oldfile, newfile);
						FileHandle.copy2(oldfile + ".zip",
								olddir + File.separator + scene.getFilename() + ".zip");
						
					
						// 写入视频或者音频
						String[] sstr = scene.getVname().split("\\|");
						String flv = "";
						for (int j = 0; j < sstr.length; j++) {
							if (!"".equals(sstr[j])) {
								FileHandle.copy2(Constant.FILES + File.separator + sstr[j],
										olddir + File.separator + sstr[j]);
								flv = sstr[j].substring(0, sstr[j].lastIndexOf('.'))
										+ "_.flv";
								FileHandle.copy2(Constant.FILES + File.separator + flv,
										olddir + File.separator + flv);
							}
						}
						//获取场景zip大小
						filepathzip = Constant.FILES + File.separator+ scene.getFilename() + ".zip";
						
						long len = FileHandle.getFileByte(filepathzip);
						
						//获取视频,音频大小
						if(!"".equals(scene.getVname())){					
							vms = scene.getVname().split("\\|");
							for (int j = 0; j < vms.length; j++) {
								
								fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
								//if(fileExists==0){
								//	return "success2"; 
								//}
								len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
							}
						}
						clen+=len;
						
					}
					
					String msg = "02" + clen + "/" + downcmd + "+"
					+ "sendkey!" + LogHandle.createSendKey() + "%playlist!" + cmd;	
					
					
					// 写入protocol.txt文件
					new File(olddir + File.separator + "protocol.txt");
					FileHandle.readFileInfo(olddir + File.separator + "protocol.txt", msg);
					
					
					// 写入config文件
					// 创建一个ini文件
					String ininame = olddir + File.separator + "config.ini";
					new File(ininame);
					FileHandle.readFileInfo(ininame, playlist);

					// 写入config文件
					// 创建一个ini文件
					//ininame = olddir + File.separator + "config2.ini";
					//new File(ininame);
					//FileHandle.readFileInfo(ininame, playlist2);

					// 获取分辨率
					Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id", item.getFblid());

					if (fbl != null) {
						// 写入item.txt文件
						String itemTxt = item.getName() + "*" + +fbl.getTx()+"-"+fbl.getTy() + "*"
								+ item.getLen();
						new File(olddir + File.separator + "item.txt");
						FileHandle.readFileInfo(olddir + File.separator + "item.txt",
								itemTxt);
					}
					// 压缩zip
					fname = temp + ".zip";
					DoZip zip = new DoZip();
					zip.zip(olddir, olddir + ".zip");
					
					code = "4";
				} catch (Exception e) {
					// TODO: handle exception
					code = "2";
				}
			} else {
				code = "3";
			}
		}

		if(code.equals("4")){
			return INPUT;
		}else{
			map.put("code", code);
			JSONArray jsons = JSONArray.fromObject(map);

			content = jsons.toString();
			return SUCCESS;
		}
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

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
