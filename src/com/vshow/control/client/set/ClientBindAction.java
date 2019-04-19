package com.vshow.control.client.set;

import java.util.Map;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ClientBind;
import com.vshow.control.tool.SqlConnect;


public class ClientBindAction implements Action {
	
	private int cid;
	private String cname;
	
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		ClientBind cb=new ClientBind();
		cb.setName(cname);
		cb.setCid(cid);
		cb.setUid(uid);
		Integer count = (Integer)sm.queryForObject("sel_client_bycid",cb);
		if(count > 0){
			sm.update("up_client_bname", cb);
		}else{
			sm.insert("bind_client_name", cb);
		}
		
		return SUCCESS;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}
