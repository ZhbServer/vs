package com.vshow.control.item;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.tomcat.util.http.Cookies;

import net.sf.json.JSONArray;

import com.google.gson.JsonArray;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.data.program.ProgramDataSource;
import com.vshow.control.data.program.ProgramDllItemUser;
import com.vshow.control.tool.SqlConnect;

public class ToDllItemUserAction extends ActionSupport {
	
	private String initUserListJson="";  //用户初始化数据
	private String yxUserListJson="";    //已选用户数据
	private String jsonStr="";           //全部绑定用户
	


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		User user = new User();
		
		user.setTkey(tkey);
		user.setId(uid);
		
		
		List<User>  users= SqlConnect.getSqlMapInstance().queryForList("sel_users_tkey", user);
		
		
		 Cookie[] cookies =ServletActionContext.getRequest().getCookies();
		 
		 if (cookies == null) {
	            
	     } else {
	            int index = -1;
	            for (int j = 0; j < cookies.length; j++) {
	                if (cookies[j].getName().equals("jsonStr")) {
	                    index = j;
	                    //System.out.println("index=" + index);
	                    //System.out.println("cookieValue:"+cookies[j].getValue());
	                 
	                    //System.out.println("escapeJava:"+unescape(cookies[j].getValue()));
	                    jsonStr=unescape(cookies[j].getValue());
	                    
	                }
	                
	                if (cookies[j].getName().equals("jsonData")) {
	                    index = j;
	                    //System.out.println("index=" + index);
	                    //System.out.println("cookieValue:"+cookies[j].getValue());
	                 
	                    //System.out.println("escapeJava:"+unescape(cookies[j].getValue()));
	                    yxUserListJson=unescape(cookies[j].getValue());
	                    
	                }
	                
	            }
	     }
		 
		 jsonStr=(String)session.get("jsonStr");
		 yxUserListJson=(String)session.get("jsonData");
		 
		
		if(jsonStr==null||jsonStr.equals("")||jsonStr.equals("[]")){}else{
			JSONArray json = JSONArray.fromObject(jsonStr);
			
			List<ProgramDllItemUser> mDllItemUserList = (List<ProgramDllItemUser>) JSONArray.toCollection(json,
					ProgramDllItemUser.class);
			
			for (int j = 0; j < mDllItemUserList.size(); j++) {
				
				for (int i = 0; i < users.size(); i++) {
					if(mDllItemUserList.get(j).getId()==users.get(i).getId()){
						users.remove(i);
					}
				}
				
			}
			
		}
		
		
		
		//初始化数据源转换json
		JSONArray jsonArr = JSONArray.fromObject(users);
		
		initUserListJson=jsonArr.toString();
		
		return SUCCESS;
	}



	public String getJsonStr() {
		return jsonStr;
	}


	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}


	public String getInitUserListJson() {
		return initUserListJson;
	}


	public void setInitUserListJson(String initUserListJson) {
		this.initUserListJson = initUserListJson;
	}


	public String getYxUserListJson() {
		return yxUserListJson;
	}


	public void setYxUserListJson(String yxUserListJson) {
		this.yxUserListJson = yxUserListJson;
	}
	
	


	public static String unescape(String src) {  
        StringBuffer tmp = new StringBuffer();  
        tmp.ensureCapacity(src.length());  
        int lastPos = 0, pos = 0;  
        char ch;  
        while (lastPos < src.length()) {  
            pos = src.indexOf("%", lastPos);  
            if (pos == lastPos) {  
                if (src.charAt(pos + 1) == 'u') {  
                    ch = (char) Integer.parseInt(src  
                            .substring(pos + 2, pos + 6), 16);  
                    tmp.append(ch);  
                    lastPos = pos + 6;  
                } else {  
                    ch = (char) Integer.parseInt(src  
                            .substring(pos + 1, pos + 3), 16);  
                    tmp.append(ch);  
                    lastPos = pos + 3;  
                }  
            } else {  
                if (pos == -1) {  
                    tmp.append(src.substring(lastPos));  
                    lastPos = src.length();  
                } else {  
                    tmp.append(src.substring(lastPos, pos));  
                    lastPos = pos;  
                }  
            }  
        }  
        return tmp.toString();  
    
     }
}
