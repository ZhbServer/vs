package com.vshow.control.index;

import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.ClientPeopleCode;
import com.vshow.control.data.UserToken;
import com.vshow.control.data.client.interact.ResourceData;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.DesUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;
import com.vshow.control.zdy.user.space.getUSTotal;

public class IndexSystemInfoAction extends ActionSupport {
	
	//加密类型
	private String lType="0";    //初始化类型 0 加密狗 1软加密
	
	//软加密登陆账号
	private String lUsername="";
	
	//软加密验证通过  0验证未通过 1验证通过
	private String lCheck="0";   
	
	//软加密总点位
	private String NetCountStr="0";
	
	//软加密使用点位
	private String NetSurCountStr="0"; 
	
	//加密狗总点位
	private String DogCountStr="0";
	
	//人脸识别总点位
	private String PeopleFaceAllCountStr="0";
	
	//人脸识别剩余点位
	private String PeopleFaceRelCountStr="0";
	
	
	//用户存储使用
	private float scTotal;
	private Float total; 
	private Integer state;
	
	private int vsLicensesFlag;
	
	
	//token
	private String token;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		// TODO Auto-generated method stub
		lType=Constant.lType;
		lUsername=Constant.lUsername;
		lCheck=Constant.lCheck;
		NetCountStr=Constant.NetCountStr;
		NetSurCountStr=Constant.NetSurCountStr;
		DogCountStr=Constant.DogCountStr;
		scTotal = getUSTotal.doMain(urid);
		total = (Float) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_us_total_uid", urid);
		state = (Integer)SqlConnect.getSqlMapInstance().queryForObject(
				"sel_desc_state_byuid", urid);
		if(state == null){
			state = 1;
		}
		
		
		if(new VVersion().peopleCountShow.equals("1")){
			//随机生成8位数key
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			String key=tempname.substring(tempname.length()-8, tempname.length());
			
			
			ResourceData  rd=new ResourceData();
			
			
			rd.setUsername(Constant.lUsername);
			
			rd.setPassword(Constant.lPassword);
			
			//获取用户名   加密后的密码
			JSONObject jsonObject = JSONObject.fromObject(rd);
		
			//拼接参数,请求
			String param="resourceDataJson="+jsonObject.toString()+"&key="+key;
			
			String content=HttpRequest.sendPost(Constant.NetJmPeopleFaceGetPointUrl, param);
			
	        String deData=DesUtil.decrypt(content,key);
			if(deData==null||deData.equals("")){
				
			}else{
				//System.out.println(deData);
				
				
				try{
					jsonObject = JSONObject.fromObject(deData);
					
					ResourceData resourceData=(ResourceData)JSONObject.toBean(jsonObject, ResourceData.class);
					
					if(resourceData!=null){
						//System.out.println(resourceData.getCode());
						
						if(resourceData.getCode().equals("00000")){
							PeopleFaceAllCountStr=resourceData.getAllPoint()+"";
							
							int relCount=resourceData.getAllPoint()-resourceData.getRelPoint();
							PeopleFaceRelCountStr=relCount+"";
						}
					
					
						
					}
				}catch (Exception e) {
					// TODO: handle exception
					//e.printStackTrace();
					System.out.println("人脸获取失败");
				
					
				}
				
			}
		}
		
		if(lType.equals("2")){
			vsLicensesFlag=Constant.vsLicensesFlag;
		}
		
		//查询当前用户token
		String account = (String) session.get("account");
		
		token=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_user_token", account);
		
		if(token==null){
			
			token=MD5Util.string2password(account);
			//插入token
			UserToken ut=new UserToken();
			ut.setAccount(account);
			ut.setToken(token);
			ut.setCreate_time(DateUtil.getTime());
			ut.setLast_edit_time(DateUtil.getTime());
			SqlConnect.getSqlMapInstance().insert("ad_user_token", ut);
		}
		
		
		
		return SUCCESS;
	}
	
	
	public int getVsLicensesFlag() {
		return vsLicensesFlag;
	}


	public void setVsLicensesFlag(int vsLicensesFlag) {
		this.vsLicensesFlag = vsLicensesFlag;
	}


	public String getPeopleFaceAllCountStr() {
		return PeopleFaceAllCountStr;
	}


	public void setPeopleFaceAllCountStr(String peopleFaceAllCountStr) {
		PeopleFaceAllCountStr = peopleFaceAllCountStr;
	}


	public String getPeopleFaceRelCountStr() {
		return PeopleFaceRelCountStr;
	}


	public void setPeopleFaceRelCountStr(String peopleFaceRelCountStr) {
		PeopleFaceRelCountStr = peopleFaceRelCountStr;
	}


	public String getlType() {
		return lType;
	}

	public Float getTotal() {
		return total;
	}


	public void setTotal(Float total) {
		this.total = total;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public void setlType(String lType) {
		this.lType = lType;
	}

	public String getlUsername() {
		return lUsername;
	}

	public void setlUsername(String lUsername) {
		this.lUsername = lUsername;
	}

	public String getlCheck() {
		return lCheck;
	}

	public void setlCheck(String lCheck) {
		this.lCheck = lCheck;
	}

	public String getNetCountStr() {
		return NetCountStr;
	}

	public void setNetCountStr(String netCountStr) {
		NetCountStr = netCountStr;
	}

	public String getNetSurCountStr() {
		return NetSurCountStr;
	}

	public void setNetSurCountStr(String netSurCountStr) {
		NetSurCountStr = netSurCountStr;
	}

	public String getDogCountStr() {
		return DogCountStr;
	}

	public void setDogCountStr(String dogCountStr) {
		DogCountStr = dogCountStr;
	}

	public float getScTotal() {
		return scTotal;
	}

	public void setScTotal(float scTotal) {
		this.scTotal = scTotal;
	}
	
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
}
