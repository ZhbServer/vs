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
import com.vshow.control.tool.AntZip;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 导入节目
 * @param account账号
 * @param password 密码 
 * @param file 节目文件
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDaoItemInAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private File file;
	private String fileFileName;	
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

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
					String fs;
					String st;
					File ff;
					AntZip az = new AntZip();
					String tname = "";
					Item item = null;
					int iid = 0;
					int sid = 0;
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sf.format(new Date());

					ff = file;
					fs = ff.getAbsolutePath();
					st = fs.substring(0, fs.lastIndexOf('.'));
					fileFileName = fileFileName.substring(0, fileFileName.lastIndexOf('.'));
					az.unzip(fs, st);
					BufferedReader br = new BufferedReader(new InputStreamReader(
							new FileInputStream(st + File.separator + "item.txt"), "utf-8"));

					String temp = "";
					String s = "";
					while ((temp = br.readLine()) != null) {
						s += temp;
					}

				
					
					String items[]=s.split("\\^");
					for (int i = 0; i < items.length; i++) {
						String ss[] = items[i].split("\\*");
						if (ss.length == 5) {

							// 解析节目
							String itemFileName = fileFileName;
							File ttem = new File(Constant.FILES + File.separator + fileFileName
									+ ".zip");

							ff.renameTo(ttem);
							az.unzip(Constant.FILES + File.separator + fileFileName + ".zip",
									Constant.FILES + File.separator);
							
							//查找分辨率存在不存在
							Integer fblid=0;
							String[] fbls=ss[2].split("\\-");
							if(fbls.length==2){
								Fbl tempfbl=new Fbl();
								tempfbl.setTx(Integer.parseInt(fbls[0]));
								tempfbl.setTy(Integer.parseInt(fbls[1]));
								Fbl tempfbl2=(Fbl)SqlConnect.getSqlMapInstance().queryForObject("sel_fbl_xy",tempfbl);
								if(tempfbl2==null){
									//新增分辨率
									tempfbl.setName(fbls[0]+"*"+fbls[1]);
									
									fblid=(Integer)SqlConnect.getSqlMapInstance().insert("add_fbl", tempfbl);
								}else{
									fblid=tempfbl2.getId();
								}
							}
							

							item = new Item();
							item.setName(ss[0]);
							item.setStime(Integer.parseInt(ss[1]));
							item.setFblid(fblid);
							item.setLen(Long.parseLong(ss[3]));
							item.setOcheck(1);
							item.setSdate(date);
							item.setUserid(user.getId());
							
							//判断节目存在不存在
							Integer thid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_th_item_id", item);
							
							if(thid!=null){
								
								//获取节目下的场景
								//获取场景
								Scene se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid", thid);
								if(se!=null){
									// 删除场景表
									SqlConnect.getSqlMapInstance().delete("del_scene", se.getId());
									SqlConnect.getSqlMapInstance().delete("del_item_id",thid);
									//sm.delete("del_countsucai_itemid", thid);	
								}
													
							}
							

							// 插入节目 
							iid = (Integer) SqlConnect.getSqlMapInstance().insert("insert_one_item", item);
				            String mfile;
							Scene scene;
							
							// 获取场景
							long clen=0L;
							long len=0L;
							String filepathzip="";
							int fileExists=0;
							String[] vms;
							// 解析节目
							mfile = ss[4];
							Scene tfileName =(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scfilename_scene",mfile);
							if (tfileName != null) {
								    item.setId(iid);
								    item.setSceneid(tfileName.getId());
								    SqlConnect.getSqlMapInstance().update("update_item_sceneid", item);
									
							}else{
								az.unzip(Constant.FILES + File.separator + mfile + ".zip", Constant.FILES+ File.separator + mfile);
				                br = new BufferedReader(new InputStreamReader(new FileInputStream(Constant.FILES + File.separator
													+ mfile + File.separator + "key.txt"), "utf-8"));
				                temp = "";
								String key = "";
								while ((temp = br.readLine()) != null) {
										key += temp;
								}
								br.close();
								String keys[] = key.split("\\@");
								if (keys.length == 7) {
										scene = new Scene();
										scene.setName("1");
										scene.setFilename(keys[1]);
										scene.setMcontent(keys[2]);
										scene.setStime(Integer.parseInt(keys[3]));
										scene.setVname(keys[4]);
										scene.setFcontent(keys[5]);
										scene.setSf(Float.parseFloat(keys[6]));

										

										sid = (Integer) SqlConnect.getSqlMapInstance().insert("insert_one_scene", scene);

										if (iid != 0 && sid != 0) {
											                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
											 item.setId(iid);
											 item.setSceneid(sid);
											 SqlConnect.getSqlMapInstance().update("update_item_sceneid", item);
											
										}
										/**获取场景zip大小*/
										filepathzip = Constant.FILES + File.separator+ keys[1]+ ".zip";
											
										/**验证文件存在不存在: 0不存在,1存在**/
										fileExists=FileHandle.fileExists(filepathzip);
																					
										if(fileExists==0){
												return SUCCESS; 
										}
										len = FileHandle.getFileByte(filepathzip);
											
										/**获取视频,音频大小*/
										if(!"".equals(keys[4])){					
												vms = keys[4].split("\\|");
												for (int j = 0; j < vms.length; j++) {
													
													fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
													if(fileExists==0){
														//return "success"; 
													}
													len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
												}
											}
																
										
										clen+=len;

									}
								    item.setLen(clen);
								    SqlConnect.getSqlMapInstance().update("upd_item", item);

								   
								
							}
							 //节目与分组建立关系
						    //节目与分组建立关系
							ItemGroupRelation sgr=new ItemGroupRelation();
							sgr.setItemid(item.getId());
						    sgr.setItemgroupid(0);
						    SqlConnect.getSqlMapInstance().insert("ad_item_group_relation", sgr);
								
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

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
}
