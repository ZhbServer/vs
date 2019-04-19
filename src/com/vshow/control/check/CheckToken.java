package com.vshow.control.check;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class CheckToken implements Interceptor {
	
private static final long serialVersionUID = 1L;
	
	public void destroy() {
	}

	public void init() {
	}
	
	protected ResponseEntity responseEntity;

	public ResponseEntity getResponseEntity() {
		return responseEntity;
	}

	public void setResponseEntity(ResponseEntity responseEntity) {
		this.responseEntity = responseEntity;
	}
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
	
		ActionContext ctx = arg0.getInvocationContext();
		
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);   
		
		String access_token=(String)request.getAttribute("access_token");
		
		//验证token
		String account=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_token_user", access_token);
		
		if(account==null||account.equals("")){
			
			responseEntity = ResponseEntity.err0007();
			
			ctx.getContext().put("content", JSONObject.fromObject(responseEntity).toString());
		
			return "tokenerr";
			
		}else{
			
			User user=(User)SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_account", account);
			
			if(user!=null){
				
				if(user.getBan()!=0){
					
					responseEntity = ResponseEntity.err0002();
					
					ctx.getContext().put("content", JSONObject.fromObject(responseEntity).toString());
					
					return "tokenerr";
					
				}
				
			}else{
				
				responseEntity = ResponseEntity.err0001();
				
				ctx.getContext().put("content", JSONObject.fromObject(responseEntity).toString());
				
				return "tokenerr";
				
			}
			
			ctx.getContext().put("user", JSONObject.fromObject(user).toString());
			
		}
		
		return arg0.invoke();
	}

}
