package com.vshow.control.api.sucai;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;
import com.vshow.control.data.UserSpace;

import com.vshow.control.data.User;
import com.vshow.control.letv.cloud.LetvCloudUtil;
import com.vshow.control.sucai.UpVideoAction;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;


/**
 * 上传视频
 * @param account账号
 * @param password 密码 
 * @param file 文件
 * @param gpid 分组id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiUpVideoAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String fileFileName;
	private File file;
	private int gpid;
	private int end;
	private int jm;
	private String endJm;
	
	Logger logger  =  Logger.getLogger(ApiUpVideoAction.class);
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
					fileFileName=fileFileName.replaceAll("\\-","").replaceAll("_", "");
					if(endJm==null||"".equals(endJm)){
						endJm="0_15";
					}
					String[] ej = endJm.split("\\_");
					jm = Integer.parseInt(ej[0]);
					end = Integer.parseInt(ej[1]);
					if (end == 0) {
						end = 15;
					}
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sf.format(new Date());
					SqlMapClient sm = SqlConnect.getSqlMapInstance();
					Sucai sucai = new Sucai();

					sucai.setUrid(user.getId());
					sucai.setType(3);
					sucai.setSdate(date);
					fileFileName=fileFileName.replaceAll("\\'", "");
					sucai.setName(fileFileName);
					DecimalFormat dcmFmt = new DecimalFormat("0.00");
					
				
					float sizem = (float) (file.length()) / 1024 / 1024;
					sucai.setSize(dcmFmt.format(sizem));
					
					int flag = 0;
					Float userspaces = (Float) SqlConnect.getSqlMapInstance()
					.queryForObject("sel_us_total_uid", user.getId());
					if(userspaces !=null && userspaces > 0){
						Integer state = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_desc_state_byuid", user.getId());
						if(state != null && state == 0){
							float userSize = getUSTotal.doMain(user.getId()); //获取总的用户存储空间大小
							if(userspaces < userSize + sizem){
								flag = 1;
							}
						}
					}
					
					if(flag == 1){
						code = "5";
					}else{
					
						String type = fileFileName
								.substring(fileFileName.lastIndexOf('.') + 1,
										fileFileName.length()).trim().toLowerCase();
						String tempname = Long.toString(System.currentTimeMillis())
								+ (int) (Math.random() * 100);
	
						// 加密
						String jm1="";
						if(jm==1){
						   jm1=(int) (file.length()+1734)+"";
						   sucai.setLen(file.length()+1734);
						   if (file.length() + "".length() >= 4) {
								jm1 = jm1.substring(jm1.length() - 4, jm1.length());
						   } else {
								jm1 = "0000";
						   }
	
						   tempname = replaceString(tempname, jm1.substring(0, 1), 0);
						   tempname = replaceString(tempname, jm1.substring(1, 2), 2);
						   tempname = replaceString(tempname, jm1.substring(2, 3), 4);
						   tempname = replaceString(tempname, jm1.substring(3), 6);
						}else{
						   //jm1 = file.length() + "";
						   sucai.setLen(file.length());
						}
						
						
						String tempf = tempname + "." + type;
						String temjm = "";
	
						File temfs = new File(Constant.FILES + File.separator + tempf);
	
						file.renameTo(temfs);
						
						com.vshow.control.tool.DoVideo.Do(Constant.FILES
								+ File.separator + tempf, Constant.FILES + File.separator
								+ tempname + "_.flv", end);
						
						//截取图片
						int stime=  com.vshow.control.tool.DoVideo.SnapVideoImage_Duration(Constant.FILES
								+ File.separator + tempf, Constant.FILES + File.separator
								+ tempname + "_.jpg");
						
						
						sucai.setStime(stime);
						sucai.setName(sucai.getName().replaceAll("[~!%*|&@?=^#`$']", ""));
	
						if (jm == 1) {
							temjm = tempf.substring(0, tempf.lastIndexOf('.')) + ".jm";
							
							File ff = new File(Constant.FILES + File.separator + temjm);
							if (!ff.exists()) {
								FileInputStream is = new FileInputStream(Constant.FILES
										+ File.separator + tempf);
								FileOutputStream fos = new FileOutputStream(ff);
	
								byte[] tvb = new byte[1734];
								tvb[0] = 't';
								tvb[1] = 'f';
								tvb[32] = '9';
								tvb[55] = 'g';
								tvb[212] = 'z';
								tvb[928] = 'o';
								tvb[1541] = 'p';
								tvb[1675] = '6';
								fos.write(tvb, 0, 1734);
	
								byte[] buffer = new byte[4096];
								int readLen = 0;
								while ((readLen = is.read(buffer, 0, 4096)) >= 0) {
									fos.write(buffer, 0, readLen);
								}
								fos.close();
								is.close();
								
							}
							tempf = temjm;
							
						}
	
						sucai.setFilename(tempf);
						Integer sid = (Integer) sm.insert("add_sucai", sucai);
						
						//素材与分组建立关系
						ScGroupRelation sgr=new ScGroupRelation();
						
					    sgr.setSucaiid(sid);
					    sgr.setSucaigroupid(gpid);
						sm.insert("add_scgroup_relation", sgr);
	
			            SucaiCloud scCloud=new SucaiCloud();
						
						scCloud.setFilename(tempf);
						
						String downUrl=tempf;
						
						scCloud.setDownurl(downUrl);
						scCloud.setVideoid(tempf);
						scCloud.setResultdata("");
						scCloud.setCloudtype(0);
						sm.delete("del_sucaiCloud_videoid", tempf);
						sm.insert("add_sucaiCloud", scCloud);
							
						code = "2";
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
	
	public String replaceString(String str, String rstr, int startIndex) {
		if (startIndex > str.length() - 1) {
			// throw new ArrayIndexOutOfBoundsException("越界了");
		}
		String preStr = str.substring(0, startIndex);
		String subStr = str.substring(startIndex + 1);
		return preStr + rstr + subStr;
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

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public int getGpid() {
		return gpid;
	}

	public void setGpid(int gpid) {
		this.gpid = gpid;
	}

}
