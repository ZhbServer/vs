package com.vshow.control.api.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientBind;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupRelation;

import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 终端移动
 * @param account账号
 * @param password 密码 
 * @param cids 终端id
 * @param gpid 分组id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiClientMoveAction implements Action {

	private String password;
	private String account;
	private String content;

	private String cids;
	private int gpid;
	
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用5.只能移动到当前用户下分组

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
					int num = 0;
					ClientGroup cg = (ClientGroup)SqlConnect.getSqlMapInstance().queryForObject("sel_cg_id",gpid);
            		if(cg != null){
            			ClientGroupRelation cgr=new ClientGroupRelation();
            			cgr.setUid(user.getId());
                		cgr.setGid(cg.getId());
            			cgr.setGtype(cg.getLevel());
                		//分割终端
                		String cid[]=cids.split("\\_");
                		for (int i = 0; i < cid.length; i++) {
                		    cgr.setCid(Integer.parseInt(cid[i]));
                		    ClientGroup cg1 = new ClientGroup();
                		    cg1.setId(gpid);
                		    cg1.setUid(user.getId());
                		    num = (Integer)SqlConnect.getSqlMapInstance().queryForObject("api_sel_cg_byiduid",cg1);
                		    if(num == 1){
                		    	//修改当前终端所在分组
                    			SqlConnect.getSqlMapInstance().update("update_cgr",cgr);
                		    }else{
                		    	code = "5";
                		    	break;
                		    }
        				}
    					if(!code.equals("5")){
    						code = "2";
    					}
            		}else{
            			code = "3";
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

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}

	public int getGpid() {
		return gpid;
	}

	public void setGpid(int gpid) {
		this.gpid = gpid;
	}
	
}
