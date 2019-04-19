package com.vshow.control.data.client.interact;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientPeopleCode;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DesUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.SqlConnect;


public class ClientApprovePeopleFaceAction extends ActionSupport {
	
	
	private String key;   //加密key
	private String mark;  //终端标识
	private String content;  //返回内容
	private String code;   //注册成功
	
	Logger logger  =  Logger.getLogger(ClientPostDataAction.class);
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		if(code.equals("00000")){
			
			//随机生成8位数key
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			key=tempname.substring(tempname.length()-8, tempname.length());
			
			
			ResourceData  rd=new ResourceData();
			
			rd.setMark(mark);
			
			rd.setUsername(Constant.lUsername);
			
			rd.setPassword(Constant.lPassword);
			
			//获取用户名   加密后的密码
			JSONObject jsonObject = JSONObject.fromObject(rd);
		
			//拼接参数,请求
			String param="resourceDataJson="+jsonObject.toString()+"&key="+key;
			
			content=HttpRequest.sendPost(Constant.NetJmPeopleFaceUrl, param);
			
	        String deData=DesUtil.decrypt(content,key);
			if(deData==null||deData.equals("")){
				//System.out.println("人脸识别地址无法请求");
				logger.info("人脸识别地址无法请求");
			}else{
				//System.out.println(deData);
				logger.info(deData);
				
				try{
					jsonObject = JSONObject.fromObject(deData);
					
					ResourceData resourceData=(ResourceData)JSONObject.toBean(jsonObject, ResourceData.class);
					
					if(resourceData!=null){
						
						//System.out.println(resourceData.getCode());
						//System.out.println(resourceData.getContent());
						
						ClientPeopleCode cpc=(ClientPeopleCode)SqlConnect.getSqlMapInstance().queryForObject("sel_client_people_code_mark", mark);
						
						if(cpc==null){
							
							cpc=new ClientPeopleCode();
						    cpc.setMark(mark);
						    cpc.setCode(resourceData.getCode());
							SqlConnect.getSqlMapInstance().insert("add_client_people_code", cpc);
						}else{
							cpc.setMark(mark);
							cpc.setCode(resourceData.getCode());
							SqlConnect.getSqlMapInstance().update("up_client_people_code", cpc);
						}
						
					}
				}catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.info("解析失败3[deData]");
					
				}
				
			}
			
			
		}else {
			
			ClientPeopleCode cpc=(ClientPeopleCode)SqlConnect.getSqlMapInstance().queryForObject("sel_client_people_code_mark", mark);
			
			if(cpc==null){
				
				cpc=new ClientPeopleCode();
			    cpc.setMark(mark);
				cpc.setCode(code);
				SqlConnect.getSqlMapInstance().insert("add_client_people_code", cpc);
			}else{
				cpc.setMark(mark);
				cpc.setCode(code);
				SqlConnect.getSqlMapInstance().update("up_client_people_code", cpc);
			}
			logger.info(code);
	    }
		
		
		return SUCCESS;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
