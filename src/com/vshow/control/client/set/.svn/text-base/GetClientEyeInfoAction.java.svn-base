package com.vshow.control.client.set;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientBind;
import com.vshow.control.data.ClientPeopleCode;
import com.vshow.control.data.ClientPlay;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;

public class GetClientEyeInfoAction extends ActionSupport {
	
	private int cid;
	
	private Client client;

	private String userBelongs; // 所属用户

	private String clientPwd;

	private String bindName;
	
	private String peopleFaceCode;
	
    private String vsLicensesClientState;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");

		client = (Client) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_client_byid", cid);

		userBelongs = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_cgr_uid_accounts", cid);

		clientPwd = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_client_paw_cpassword", cid);
		
		
		ClientBind cb = new ClientBind();
		cb.setCid(cid);
		cb.setUid(uid);
		bindName = (String) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_bname_bycid", cb);

		if (clientPwd == null) {
			clientPwd = "";
		}
		
		//查看当前终端是否在线
		 Mlt msgList = Constant.messageMap.get(client.getMark());
		 
		 if(msgList==null){
			 
			 client.setMltState(0);
			 
		 }else{
			 
			 client.setMltState(1);
			 
		 }

		 ClientPeopleCode  cpc=(ClientPeopleCode)SqlConnect.getSqlMapInstance().queryForObject("sel_client_people_code_mark", client.getMark());
		 
		 if(cpc!=null){
			 peopleFaceCode=cpc.getCode();
		 }
		 
		 if(Constant.vsLicenses==1){
			 
			
			 
			 String themark=(String)Constant.vsLicensesMap.get(client.getMark());
			 
			 if(themark!=null){
				 
				 vsLicensesClientState="1";
			 
			 }
			 
			 
		 }
		 
		 
		// 获取终端密码
		return SUCCESS;
	}

	public String getPeopleFaceCode() {
		return peopleFaceCode;
	}

	public void setPeopleFaceCode(String peopleFaceCode) {
		this.peopleFaceCode = peopleFaceCode;
	}

	public String getClientPwd() {
		return clientPwd;
	}

	public void setClientPwd(String clientPwd) {
		this.clientPwd = clientPwd;
	}

	public String getUserBelongs() {
		return userBelongs;
	}

	public void setUserBelongs(String userBelongs) {
		this.userBelongs = userBelongs;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public String getBindName() {
		return bindName;
	}

	public String getVsLicensesClientState() {
		return vsLicensesClientState;
	}

	public void setVsLicensesClientState(String vsLicensesClientState) {
		this.vsLicensesClientState = vsLicensesClientState;
	}

	public void setBindName(String bindName) {
		this.bindName = bindName;
	}

}
