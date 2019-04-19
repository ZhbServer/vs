package com.vshow.control.check;

import java.util.Map;



import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;
import com.vshow.control.tool.Constant;



public class CheckDownManager implements Interceptor  {

	private static final long serialVersionUID = 1L;
	
	public void destroy() {
	}

	public void init() {
	}
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
	
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Integer result = (Integer) session.get("downmanager");
		if (result == null) {
			session.put("error", Constant.LOCAL.getA00055());
			session.put("url", "login_to.jsp");
			session.put("creturn", "login");
			return "error";
		}
		if (result == 0) {
			session.put("error", Constant.LOCAL.getA00054());
			session.put("url", "main.vs");
			return "error";
		} else {
			return arg0.invoke();
		}
	}

}
