package com.vshow.control.api.item;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;


/**
 * 新增节目
 * @param account账号
 * @param password 密码 
 * @param fid 分辨率id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiToAddItemAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	private int fid;
	
	private int twidth;
	private int theight;
	private Item item;

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
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
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(new Date());
					item.setName(java.net.URLDecoder.decode(item.getName(), "UTF-8"));
					item.setOcheck(1);
					item.setUserid(user.getId());
					item.setSdate(date);
					item.setFblid(fid);
					
					// 获取分辨率
					Fbl fbl = (Fbl) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_fbl_all_id", item.getFblid());
					twidth = fbl.getTx();
					theight = fbl.getTy();
					// 新创建一个场景
					Scene se = new Scene();
					se.setFilename(Long.toString(System.currentTimeMillis())
							+ (int) (Math.random() * 100));
					File dirFile = new File(Constant.FILES + File.separator
							+ se.getFilename());
					dirFile.mkdir();
					
					FileHandle.copy2(Constant.EXE+File.separator+"main_vs.swf",Constant.FILES + File.separator
							+ se.getFilename()+File.separator+"main_vs.swf");
					
					se.setSf(0.5F);
					se.setTx(twidth);
					se.setTy(theight);
					session.put("scene", se);
					
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

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getTwidth() {
		return twidth;
	}

	public void setTwidth(int twidth) {
		this.twidth = twidth;
	}

	public int getTheight() {
		return theight;
	}

	public void setTheight(int theight) {
		this.theight = theight;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
}
