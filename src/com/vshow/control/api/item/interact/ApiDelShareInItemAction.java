package com.vshow.control.api.item.interact;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItemShare;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemShare;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 取消共享互动节目
 * @param account账号
 * @param password 密码 
 * @param tid 节目id
 * @param uids 共享用户id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDelShareInItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;

	private int tid;
	private String uids;
	
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
					String [] shareArry = uids.split(",");
					for (int j = 0; j < shareArry.length; j++) {
						String [] share;
						String newshare="";
						InteractItemShare itemshare = new InteractItemShare();
						itemshare.setTkey(user.getTkey());
						itemshare.setUserid(user.getId());
						itemshare.setItemid(tid);
						itemshare.setShareid(shareArry[j]);
						InteractItemShare old_itemshare = (InteractItemShare)SqlConnect.getSqlMapInstance().queryForObject("sel_all_interact_item_shareid",itemshare);
						if(old_itemshare != null && old_itemshare.getShareid().length() > 0){
							share = old_itemshare.getShareid().split(",");
							for (int k = 0; k < share.length; k++) {
								if(!share[k].equals(shareArry[j])){
									newshare += share[k]+",";
								}
							}
							if(newshare.length()>1){//当前shareid 包含修改记录，等于shareid删除记录
								InteractItemShare up_itemshare = new InteractItemShare();
								up_itemshare.setId(old_itemshare.getId());
								up_itemshare.setShareid(newshare.substring(0,newshare.length()-1));
								SqlConnect.getSqlMapInstance().update("up_interact_item_share",up_itemshare);
							}else{
								InteractItemShare del_itemshare = new InteractItemShare();
								del_itemshare.setId(old_itemshare.getId());
								SqlConnect.getSqlMapInstance().delete("del_interact_item_share",del_itemshare);
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
