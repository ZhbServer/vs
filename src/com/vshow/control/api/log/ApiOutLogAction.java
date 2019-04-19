package com.vshow.control.api.log;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Log;
import com.vshow.control.data.Power;
import com.vshow.control.data.Result;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

/**
 * 导出日志
 * @param account账号
 * @param password 密码 
 * @param uid 导出指定用户的id
 * @param type 导出类型 (0导出全部  1导出指定用户)
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiOutLogAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private int uid;
	private int type;
	
	private String fname;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2导出失败3用户被禁用

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
				List<Log> list = null;
				try {
					if(type == 0){
						list = SqlConnect.getSqlMapInstance().queryForList("sel_all_logs_out",user.getTkey());
					}else{
						User u = (User) SqlConnect.getSqlMapInstance().queryForObject(
								"sel_user_all_id", uid);
						Log logtemp = new Log();
						logtemp.setTkey(u.getTkey());
						logtemp.setUname(u.getName());
						list = SqlConnect.getSqlMapInstance().queryForList("sel_uname_logs_out",logtemp);
					}
					
					SimpleDateFormat formatfile = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
					fname = formatfile.format(new Date()) + ".xls";
					String filename = Constant.SEE + File.separator + fname;
					File f = new File(filename);
					WritableWorkbook wwb = Workbook.createWorkbook(f);
					WritableSheet ws = wwb.createSheet(Constant.LOCAL.getA00114(), 0);   //日志列表
					ws.setColumnView(0, 50); // 设置列的宽度 
					ws.setColumnView(1, 50); // 设置列的宽度
					ws.setColumnView(2, 50); // 设置列的宽度
					ws.setColumnView(3, 50); // 设置列的宽度
					WritableFont wf = new WritableFont(WritableFont.TIMES, 12,WritableFont.BOLD, false);
					WritableCellFormat wcfF = new WritableCellFormat(wf);
					ws.addCell(new Label(0, 0, Constant.LOCAL.getA00116(), wcfF));  //日志内容
					ws.addCell(new Label(1, 0, Constant.LOCAL.getA00127(), wcfF));  //生成时间
					ws.addCell(new Label(2, 0, Constant.LOCAL.getA00124(), wcfF)); //操作用户
					ws.addCell(new Label(3, 0, Constant.LOCAL.getA00118(), wcfF));  //操作结果
					
					for (int i = 1; i < list.size(); i++) {
						Log log = list.get(i);
						
						ws.addCell(new Label(0, i, log.getContent()));
						ws.addCell(new Label(1, i, log.getSdate()));
						ws.addCell(new Label(2, i, log.getUname()));
						
						List ls=SqlConnect.getSqlMapInstance().queryForList("sel_out_return", log.getId());
						if(ls.size()==0){
							ws.addCell(new Label(3, i, Constant.LOCAL.getA00128()));
						}else{
							String xiaojie="";
							String jieguo="";
							for (int j = 0; j < ls.size(); j++) {
								Result result=(Result)ls.get(j);
								if (result.getState() == 0) {
									xiaojie = Constant.LOCAL.getA00129();
								} else if (result.getState() == 1) {
									xiaojie = Constant.LOCAL.getA00130();
								} else if (result.getState() == 2) {
									xiaojie =Constant.LOCAL.getA00125();
								}
								jieguo += " "+Constant.LOCAL.getA00038()+":" + result.getName() + "," + " "+Constant.LOCAL.getA00118()+":"
								+ xiaojie;
							}
							ws.addCell(new Label(3, i, jieguo));
						}
					}
					wwb.write();
					wwb.close();
					
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}
