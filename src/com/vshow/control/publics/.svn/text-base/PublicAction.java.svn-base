package com.vshow.control.publics;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class PublicAction extends ActionSupport {
	
	
	public ActionContext ctx ;
	public Map  session;
	public SqlMapClient sm ;
	
	@Override
	public String execute() throws Exception {
		ctx = ActionContext.getContext();
		/**获取session信息**/
		session = ctx.getSession();
		
		/**获取数据库连接信息**/
		sm = SqlConnect.getSqlMapInstance();
		return super.execute();
	}
}
