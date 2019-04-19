package com.vshow.control.api.sucai;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.ScShare;
import com.vshow.control.data.Sucai;

import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 共享素材
 * @param account账号
 * @param password 密码 
 * @param ids 素材id
 * @param uids 共享用户id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiShareSucaiAction implements Action {

	private String password;
	private String account;
	private String content;
	
	private String ids;
	private String uids;

	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用5共享的素材中包含非本账号下的素材6.共享的素材中包含未知的素材

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
					String [] scArry = ids.split(",");
					String [] shareArry = uids.split(",");
					String shareStr = "";
					boolean flag = false;
					int isSc = 0;
					for (int k = 0; k < scArry.length; k++) {
						Sucai sc = (Sucai)SqlConnect.getSqlMapInstance().queryForObject("get_sc_all_id",Integer.parseInt(scArry[k]));
						if(sc != null){
							if(sc.getUrid() != user.getId()){
								flag = true;
							}
						}else{
							isSc = 1;
							break;
						}
					}
					
					if(isSc == 1){
						code = "6";
					}else{
						if(flag == true){
							code = "5";
						}else{
							for (int i = 0; i < scArry.length; i++) {
								for (int j = 0; j < shareArry.length; j++) {
									ScShare scshare = new ScShare();
									scshare.setTkey(user.getTkey());
									scshare.setUserid(user.getId());
									scshare.setScid(Integer.parseInt(scArry[i]));
									scshare.setShareid(shareArry[j]);
									int count = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_scshare_exist",scshare);
									if(count == 0){
										shareStr += shareArry[j] +",";
									}
								}
								if(shareStr.length()>1){
									ScShare scshare = new ScShare();
									scshare.setTkey(user.getTkey());
									scshare.setUserid(user.getId());
									scshare.setScid(Integer.parseInt(scArry[i]));
									scshare.setShareid(shareStr.substring(0,shareStr.length()-1));
									SqlConnect.getSqlMapInstance().insert("add_share",scshare);
									shareStr = "";
								}
							}
							code = "2";
						}
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

}
