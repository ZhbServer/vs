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
 * 复制节目
 * @param account账号
 * @param password 密码 
 * @param id 节目id
 * @param name 新节目名称
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiCopyItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private int id;
	private String name;

	private int igid;//分组id
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
					//id获取item
					Item item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_all_id", id);
					
					// 转码
					//String iname = new String(itemname.getBytes("UTF-8"));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(new Date());
					item.setName(name);
					item.setSdate(date);
					item.setUserid(user.getId());
					Integer justIid=(Integer)SqlConnect.getSqlMapInstance().insert("insert_one_item",item);
					item.setId(justIid);
					LogHandle.insertTheLog(LogType.type6, user.getId(), Constant.LOCAL.getA00657()+":" + item.getName(),1,1);
					Scene se = (Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_all",id);
					String tempFileName="";
					
					//创建场景名字
					String scenefilename=Long.toString(System.currentTimeMillis())
					+ (int) (Math.random() * 100);
					//获取要复制的场景
					
					String copypath=Constant.FILES+File.separator+se.getFilename();
					
					File dirFile = new File(Constant.FILES + File.separator
							+ scenefilename);
					dirFile.mkdir();
					
					String path=Constant.FILES+File.separator+scenefilename;
					
					FileHandle.copy(copypath, path);
					
					//修改vsjm文件
					BufferedReader br = new BufferedReader(new InputStreamReader(
							new FileInputStream(path + File.separator + "program.txt"), "utf-8"));

					String temp = "";
					String newVsjm= "";
					while ((temp = br.readLine()) != null) {
						newVsjm += temp;
					}
					newVsjm=newVsjm.replaceAll(se.getFilename(), scenefilename);
				
					br.close();
					File f = new File(path+ File.separator + "program.txt");
					FileOutputStream oldFileWriter = new FileOutputStream(f);
					oldFileWriter.write(newVsjm.getBytes("UTF-8"));
					oldFileWriter.close();
					
					
					//修改key文件
					BufferedReader br1 = new BufferedReader(new InputStreamReader(
							new FileInputStream(path + File.separator + "key.txt"), "utf-8"));

					String temp1 = "";
					String newKey= "";
					while ((temp1 = br1.readLine()) != null) {
						newKey += temp1;
					}
					newKey=newKey.replaceAll(se.getFilename(), scenefilename);
				
					br1.close();
					File f1 = new File(path+ File.separator + "key.txt");
					FileOutputStream oldFileWriter1 = new FileOutputStream(f1);
					oldFileWriter1.write(newKey.getBytes("UTF-8"));
					oldFileWriter1.close();
					
					
					//压缩成zip
					DoZip zip = new DoZip();
					zip.zip(path, path + ".zip");
					tempFileName=se.getFilename();
					
					se = (Scene) SqlConnect.getSqlMapInstance().queryForObject("sel_scene_all_id", se.getId());
					se.setFilename(scenefilename);
					se.setMcontent(se.getMcontent().replaceAll(tempFileName, scenefilename));
					
					//插入场景
					Integer justSceneId= (Integer)SqlConnect.getSqlMapInstance().insert("insert_one_scene", se);
					
					//更新节目
					item.setSceneid(justSceneId);
					SqlConnect.getSqlMapInstance().update("update_item_sceneid", item);
					
					//获取当前节目的分组id
					igid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_group_item_igid_all", id);
					
					//节目与分组建立关系
					ItemGroupRelation sgr=new ItemGroupRelation();
					sgr.setItemid(item.getId());
				    sgr.setItemgroupid(igid);
				    SqlConnect.getSqlMapInstance().insert("ad_item_group_relation", sgr);
					
					
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
