package com.vshow.control.api.item.interact;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 删除互动节目
 * @param account账号
 * @param password 密码 
 * @param ids 删除互动节目id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDelInteractItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String ids;

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		String logcontent = "";

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
				String [] iid = ids.split("_");
				try {
					for (int i = 0; i < iid.length; i++) {
						//获取全部节目下的场景
						List list = SqlConnect.getSqlMapInstance().queryForList("sel_interactitem_allscene", Integer.parseInt(iid[i]));
						for (int j = 0; j < list.size(); j++) {
							Scene scene=(Scene)list.get(j);
							// 删除节目与场景关联表
							SqlConnect.getSqlMapInstance().delete("del_interactitem_scene", scene.getId());
							// 删除本地文件和zip
							String zipPath = Constant.FILES + File.separator
									+ scene.getFilename() + ".zip";
							FileHandle.deleteFile(zipPath);
							String scenePath = Constant.FILES + File.separator
									+ scene.getFilename();
							FileHandle.delFolder(scenePath);
							// 删除场景表
							SqlConnect.getSqlMapInstance().delete("del_interactscene", scene.getId());
						}
						//删除节目
						//通过节目id获取节目
						InteractItem item=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_id_interactitem",Integer.parseInt(iid[i]));
						logcontent = item.getName();
						SqlConnect.getSqlMapInstance().delete("del_interactitem", Integer.parseInt(iid[i]));

						LogHandle.insertTheLog(LogType.type7, user.getId(),Constant.LOCAL.getA00444()+":" + logcontent, 1,1);
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
