package com.vshow.control.api.item;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
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
 * 导出节目
 * @param account账号
 * @param password 密码 
 * @param tids 节目id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDaoItemBatchAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String tids;
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
					tids = tids.replaceAll("\\_", "\\,");
					
					//id获取item
					List<Item> itemlist=SqlConnect.getSqlMapInstance().queryForList("sel_itemIdStr", tids);
					for (Item item : itemlist) {
				        item.setPlayNumber(1);
					}
					
					
					// 创建节目文件夹
					String temp = Long.toString(System.currentTimeMillis());
			        String olddir = Constant.FILES + File.separator + temp;
					new File(olddir).mkdir();
					
					Item item;
					Scene se;
					String oldfile;
					String playlist = "";
					String items="";
					Fbl fbl; 
					long clen=0L;
					int fileExists=0;
					String[] vms;
					String downcmd = "";
					String playFileName="";
					for (int i = 0; i < itemlist.size(); i++) {
						item=itemlist.get(i);
					
						//获取节目
						item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_all_id", item.getId());
						//获取场景
						se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid", item.getId());
						
						//拷贝文件
						oldfile = Constant.FILES + File.separator + se.getFilename();
						FileHandle.copy2(oldfile + ".zip",olddir + File.separator + se.getFilename() + ".zip");
					
				
					
						// 写入视频或者音频
						String[] sstr = se.getVname().split("\\|");
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
					
					    //拼接节目协议
					    // 获取分辨率
						fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_all_id", item.getFblid());
						// 拼接items
						if(items.length()==0){
							items=item.getName().replaceAll("\\^", "") + "*" + item.getStime() + "*"+ fbl.getTx()+"-"+fbl.getTy() + "*" + item.getLen()+"*"+se.getFilename();
						}else{
							items+="^"+item.getName().replaceAll("\\^", "") + "*" + item.getStime() + "*"+ fbl.getTx()+"-"+fbl.getTy() + "*" + item.getLen()+"*"+se.getFilename();
						}
						 
						//获取场景zip大小
						String filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
						long len = FileHandle.getFileByte(filepathzip);
						
						//获取视频,音频大小
						if(!"".equals(se.getVname())){					
							vms = se.getVname().split("\\|");
							for (int j = 0; j < vms.length; j++) {
								
								fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
								//if(fileExists==0){
								//	return "success2"; 
								//}
								len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
								
								
							}
						}
						clen+=len;
						
						
						//获取播放次数
						for (Item itemPlayNumber : itemlist) {
							if(itemPlayNumber.getId()==item.getId()){
								if(itemPlayNumber.getPlayNumber()==0){
									itemPlayNumber.setPlayNumber(1);
								}
								item.setPlayNumber(itemPlayNumber.getPlayNumber());
							}
						}
						//拼接播放次数
						playFileName="";
						for (int j = 0; j < item.getPlayNumber(); j++) {
							if(j==0){
								playFileName=se.getFilename();
							}else{
								playFileName=playFileName + "|" + se.getFilename();
							}
						}
						
						//拼接播放列表/下载列表
					    if (i == 0) {
							   playlist = playFileName;
							   downcmd = se.getFilename() + ".zip";
						} else {
							   playlist = playlist + "|" +playFileName;
							   downcmd = downcmd + "|" + se.getFilename() + ".zip";
						}
					  
						if (se.getVname().length() > 0
								&& (se.getVname().indexOf(':') == -1)) {
							downcmd += "|" + se.getVname();
						}
						
					}
						
						
						
					//***********************************************************************************************
				
					String msg = "02" + clen + "/" + downcmd + "+"
					+ "sendkey!" + LogHandle.createSendKey() + "%playlist!" + playlist;	
					
					
				
				
					//***********************************************************************************************
					
					// 写入protocol.txt文件
					new File(olddir + File.separator + "protocol.txt");
					FileHandle.readFileInfo(olddir + File.separator + "protocol.txt", msg);
					
					
					
					// 写入config文件 ,创建一个ini文件
					String ininame = olddir + File.separator + "config.ini";
					new File(ininame);
					FileHandle.readFileInfo(ininame, playlist);
					
			        // 写入item.txt文件
					new File(olddir + File.separator + "item.txt");
					FileHandle.readFileInfo(olddir + File.separator + "item.txt", items);
					
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

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
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
