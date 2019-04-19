package com.vshow.control.api.client;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.SqlConnect;


/**
 * 删除终端
 * @param account账号
 * @param password 密码 
 * @param ids 删除的终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiDelClientAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	private String ids;  //终端id

	@Override
	public String execute() throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		Client c;
		ClientGroupRelation cgr;
		String logname="";
		String netmarks="";
		
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
				String [] cids = ids.split("_");
				try {
					for (int i = 0; i < cids.length; i++) {
						//获取终端信息
						c=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", Integer.parseInt(cids[i]));
						
						cgr=new ClientGroupRelation();
						cgr.setUid(user.getId());
						cgr.setCid(c.getId());
						//删除用户管理的客户端关系
						SqlConnect.getSqlMapInstance().delete("del_cgr_cid_by_uid", cgr);
								
						//删除客户端
						if(c.getUid()==user.getId()){
							//删除队列
							SqlConnect.getSqlMapInstance().delete("del_client_id", Integer.parseInt(cids[i]));
							Constant.messageMap.remove(c.getMark());
							logname=Constant.LOCAL.getA00397();
						}else{
							logname=Constant.LOCAL.getA00396();
							
						}
							 
						LogHandle.insertTheLog(LogType.type55, user.getId(),logname+":"+c.getName(), 1,1);
						
					
						if(netmarks.length()==0){
							if(c.getMark().trim().length()>0){
								netmarks=c.getMark().trim();
							}
						}else{
							if(c.getMark().trim().length()>0){
								netmarks=netmarks+","+c.getMark().trim();
							}
						}
		                if(Constant.lType.equals("1")){
			                //删除软加密终端
							String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+netmarks;
							String result_con=HttpRequest.sendPost(Constant.NetJmDelUrl, param);
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
