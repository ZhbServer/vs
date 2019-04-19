package com.vshow.control.api.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemShare;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 共享节目
 * @param account账号
 * @param password 密码 
 * @param tid 节目id
 * @param uids 共享用户id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiShareItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;

	private int tid;
	private String uids;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用5.当前操作包含不可共享的节目

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
					int count = 0;
					Integer userid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("get_item_userid_id",tid);
					if(userid != user.getId()){  //共享的节目不是当前用户创建的
						count = 1;
					}
					if(count > 0){
						code = "5";
					}else{
						String [] shareArry = uids.split(",");
						String shareStr = "";
						for (int j = 0; j < shareArry.length; j++) {
							ItemShare itemshare = new ItemShare();
							itemshare.setTkey(user.getTkey());
							itemshare.setUserid(user.getId());
							itemshare.setItemid(tid);
							itemshare.setShareid(shareArry[j]);
							int num = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_itemshare_exist",itemshare);
							if(num == 0){
								shareStr += shareArry[j] +",";
							}
							if(shareStr.length()>1){
								ItemShare itemshare1 = new ItemShare();
								itemshare1.setTkey(user.getTkey());
								itemshare1.setUserid(user.getId());
								itemshare1.setItemid(tid);
								itemshare1.setShareid(shareStr.substring(0,shareStr.length()-1));
								SqlConnect.getSqlMapInstance().insert("add_item_share",itemshare1);
								shareStr = "";
							}
						}
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

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

}
