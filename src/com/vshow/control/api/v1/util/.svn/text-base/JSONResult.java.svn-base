package com.vshow.control.api.v1.util;

import com.opensymphony.xwork.Result;

import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.Result;
import java.io.OutputStream;
 
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
 
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;



public class JSONResult implements Result{

	
	private static final Log LOG = LogFactory.getLog(JSONResult.class);
	// action中的json对象的名词
	private String jsonObjectProperty = "jsonObject";
	private String contentType = "application/json";
	private String encoding = "utf-8";
 
	@Override
	public void execute(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		if (LOG.isDebugEnabled()) {
			LOG.debug("executing JSONResult");
		}
		// 通过xwork的invocation从webwork的action中获得JSONObject对象
		JSONObject jsonObject = getJSONObject(invocation);
		if (jsonObject != null) {
			String json = jsonObject.toString();
			HttpServletResponse response = getServletResponse(invocation);
			response.setContentType(getContentType());
			// encoding
			byte[] bs = json.getBytes(this.encoding);
			response.setContentLength(bs.length);
			OutputStream os = response.getOutputStream();
			os.write(bs);
			os.flush();
 
			if (LOG.isDebugEnabled()) {
				LOG.debug("written [" + json
						+ "] to HttpServletResponse outputstream");
			}
		}
 
	}
 
	protected JSONObject getJSONObject(ActionInvocation invocation)
			throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		// 从xwork配置中获得JSON对象名词
		Object obj = actionContext.getValueStack()
				.findValue(jsonObjectProperty);
 
		if (obj == null) {
			LOG.error("property [" + jsonObjectProperty
					+ "] returns null, please check xwork.xml file");
			return null;
		}
		// 如果Action中的对象是JSONObject，那么就不需要反射动态转换为JSONObject
		// 如果Action中的对象就是POJO，那么这里自动组装JSONObject
		/**
		if (!JSONObject.class.isInstance(obj)) {
			LOG.debug("build json object by reflection.");
			JSONObject jsonObj = new JSONObject();
			for (Field field : obj.getClass().getDeclaredFields()) {
				String getter = "get"
						+ Character.toUpperCase(field.getName().charAt(0))
						+ field.getName().substring(1);
				jsonObj.append(field.getName(), obj.getClass()
						.getDeclaredMethod(getter).invoke(obj));
			}
			return jsonObj;
		}**/
		
		return  JSONObject.fromObject(obj);
 
		
	}
 
	protected HttpServletResponse getServletResponse(ActionInvocation invocation) {
		return (HttpServletResponse) invocation.getInvocationContext()
				.getContextMap().get(ServletActionContext.HTTP_RESPONSE);
	}
 
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}
 
	public String getEncoding() {
		return encoding;
	}
 
	public void setJsonObjectProperty(String jsonObjectProperty) {
		this.jsonObjectProperty = jsonObjectProperty;
	}
 
	public String getJsonObjectProperty() {
		return jsonObjectProperty;
	}
 
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
 
	public String getContentType() {
		return contentType;
	}

	
	

}
