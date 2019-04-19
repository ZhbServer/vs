package com.vshow.control.api.sucai;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.UserSpace;

import com.vshow.control.data.User;
import com.vshow.control.sucai.OfficeUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;


/**
 * 上传Word
 * @param account账号
 * @param password 密码 
 * @param file 文件
 * @param gpid 分组id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiUpWordAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String fileFileName;
	private File file;
	private int gpid;
	
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
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sf.format(new Date());
					SqlMapClient sm = SqlConnect.getSqlMapInstance();
					Sucai sucai = new Sucai();
				    Integer sid=0;
					sucai.setUrid(user.getId());
					sucai.setType(7);
					sucai.setSdate(date);
					fileFileName=fileFileName.replaceAll("\\'", "");
					sucai.setName(fileFileName);
					DecimalFormat dcmFmt = new DecimalFormat("0.00");
					sucai.setLen(file.length());
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
					
						String tempname = Long.toString(System.currentTimeMillis())
								+ (int) (Math.random() * 100);
						sucai.setFilename(tempname);
						String tpdir = Constant.FILES + File.separator + tempname;
						if (new File(tpdir).mkdir()) {
							
							String cmdd="";
							if(Constant.OFFICETYPE==0){
								cmdd = "cmd /c " + Constant.EXE + File.separator
								+ "pdim.exe  word " + file.getAbsolutePath() + " " + tpdir;
								
							}else if(Constant.OFFICETYPE==1){
								cmdd = "cmd /c " + Constant.EXE + File.separator
								+ "pdim2.exe  word " + file.getAbsolutePath() + " " + tpdir+" "+Constant.OFFICEZOOM;;
							}else if(Constant.OFFICETYPE==2){
								String pdfFile=tpdir+".pdf";
								OfficeUtil.word2Img(file.getAbsolutePath(), pdfFile, tpdir);
							}
							
							
							
							
							sucai.setStime(0);
							sucai.setName(sucai.getName().replaceAll("[~!%*|&@?=^#`]", ""));
							sid=(Integer)sm.insert("add_sucai", sucai);
	
						}
						//素材与分组建立关系
						ScGroupRelation sgr=new ScGroupRelation();
						
						
					    sgr.setSucaiid(sid);
					    sgr.setSucaigroupid(gpid);
						sm.insert("add_scgroup_relation", sgr);
						
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
