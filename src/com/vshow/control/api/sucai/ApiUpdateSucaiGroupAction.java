package com.vshow.control.api.sucai;

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
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 修改素材分组
 * @param account账号
 * @param password 密码 
 * @param scgid 素材分组id
 * @param scgname 素材分组名称
 * @param type 素材类型
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiUpdateSucaiGroupAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private int scgid;
	private String scgname; // 分组名
	private int type;

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
					ScGroup scg = new ScGroup();
					scg.setId(scgid);
					scg.setName(scgname);
					scg.setType(type);
					scg.setUserid(user.getId());
					
					int exist = (Integer)SqlConnect.getSqlMapInstance().queryForObject(
							"sel_scg_gname", scg);
					if(exist > 0){
						code = "5";
					}else{
						SqlConnect.getSqlMapInstance().update("upd_scgroup_name_id", scg);
						
						// 添加日志
						String sstype = "";
						if (type == 1) {
							sstype = "[" + Constant.LOCAL.getA00058() + "]";
						} else if (type == 4) {
							sstype = "[" + Constant.LOCAL.getA00061() + "]";
						} else if (type == 3) {
							sstype = "[" + Constant.LOCAL.getA00060() + "]";
						} else if (type == 2) {
							sstype = "[" + Constant.LOCAL.getA00059() + "]";
						} else if (type == 5) {
							sstype = "[FLASH]";
						} else if (type == 6) {
							sstype = "[PPT]";
						} else if (type == 7) {
							sstype = "[Word]";
						} else if (type == 8) {
							sstype = "[Excel]";
						} else if (type == 9) {
							sstype = "[PDF]";
						} else if (type == 10) {
							sstype = "[" + Constant.LOCAL.getA00062() + "]";
						}

						LogHandle.insertTheLog(LogType.type4, user.getId(), Constant.LOCAL.getA00102()
								+ sstype + ":" + scgname, 1, 1);
						
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getScgname() {
		return scgname;
	}

	public void setScgname(String scgname) {
		this.scgname = scgname;
	}

	public int getScgid() {
		return scgid;
	}

	public void setScgid(int scgid) {
		this.scgid = scgid;
	}
	
}
