package com.vshow.control.api.client;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 取消分配终端
 * @param account账号
 * @param password 密码 
 * @param cids 分配的终端id
 * @param uids 分配的用户id
 * @author cyn
 * @version 6.1 API接口
 *
 */
/**
 * @author zckj
 *
 */
public class ApiUNFpClientAction implements Action {

	private String password;
	private String account;
	private String content;

	private String cids; // 已选终端id,多个以"_"隔开
	private String uids; // 选中的用户

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		ClientGroupRelation cgr;
		Integer cid;
		
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
				try{
					String clients[] = cids.split("\\_");
					String userids[] = uids.split("\\_");
					for (int i = 0; i < clients.length; i++) {
						for (int j = 0; j < userids.length; j++) {
							cgr = new ClientGroupRelation();
							cgr.setCid(Integer.parseInt(clients[i]));
							cgr.setUid(Integer.parseInt(userids[j]));
							cid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
									"sel_cgr_cig_by_uid", cgr);
							if (cid != null) {
								SqlConnect.getSqlMapInstance().delete("del_cgr_cid_uid",
										cgr);
							}
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

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
