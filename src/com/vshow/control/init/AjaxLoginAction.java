package com.vshow.control.init;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Local;
import com.vshow.control.data.EditUserPwdHistory;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.data.UserCheck;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.PropertiesHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;

public class AjaxLoginAction extends ActionSupport {
	
	
	private String password;
	private String account;
	private String yzcode;
	
	private static char[] base64EncodeChars = new char[] { 'A', 'B', 'C', 'D',  
        'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',  
        'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',  
        'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',  
        'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',  
        '4', '5', '6', '7', '8', '9', '+', '/', };  
  
    private static byte[] base64DecodeChars = new byte[] { -1, -1, -1, -1, -1,  
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
        -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59,  
        60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,  
        10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1,  
        -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,  
        38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1,  
        -1, -1 };  

	@Override
	public String execute() throws Exception {
		
		password=new String(decode(password));
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		String yzcode = (String) session.get("yzcode");
		
		Local local= (Local) session.get("local");
		
		String code="0";  //1 验证码不正确  2账户或者密码错误 3验证成功 4用户被禁用
		
		if (!this.yzcode.equals(yzcode)) {
			
			session.put("error",local.getA00052());
			
			session.put("url", "tologin.vs");
			
			code="1";
		
		}else{
		
			if (new VVersion().pwdPloy.equals("1")){
					
				    //验证用户密码输入是否超过五次
					Integer failCount=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_user_check_fail_5", account);
					
					if(failCount>=5){
						
						SqlConnect.getSqlMapInstance().update("update_user_ban", account);
						
						code="4";
						
						return  GsonUtil.getGson(code);
					}
			}
			
			HttpServletRequest request=(HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			
			String ip=Constant.getIp(request);
		 
			User usparam = new User();
			
			account=account.trim();
			
			password=password.trim();
			
			if(VVersion.flagJmPwd==1){
				
				password=MD5Util.string2password(password);	
			
			}
			
			usparam.setAccount(account);
			
			usparam.setPassword(password);
			
			Power upresult = (Power) SqlConnect.getSqlMapInstance().queryForObject("user_login_check2", usparam);
			
			if (upresult == null) {
				
				code="2";
			
			} else {
				
				 //获取拓展权限
				 //PowerExpand  ped=(PowerExpand)SqlConnect.getSqlMapInstance().queryForObject("sel_powerExpand_all", upresult.getId());
				List<PowerExpand> peds = SqlConnect.getSqlMapInstance().queryForList("sel_powerExpand_all", upresult.getId());
				
				PowerExpand ped;
				
				for (int i = 0; i < peds.size(); i++) {
				   
					ped = peds.get(i);
					
				    if(ped!=null){
					 
					 String expandContent=ped.getExpandContent();
					 
					 JSONArray array = JSONArray.fromObject(expandContent);
					 
					 for (int j = 0; j < array.size(); j++) {
						    
						    JSONObject jsonObject = array.getJSONObject(j); 
						    
						    PowerExpand ti=(PowerExpand)JSONObject.toBean(jsonObject, PowerExpand.class);
						   
						    if(ti.getPowerName().equals("dllItemSend")){
						    	
						    	upresult.setDllItemSend(ti.getPowerState());
						    
						    }
						    
						    if(ti.getPowerName().equals("itemsendAdd")){
						    	
						    	upresult.setItemsendAdd(ti.getPowerState());
						    
						    }
						    
						    if(ti.getPowerName().equals("itemsendReplace")){
						    	
						    	upresult.setItemsendReplace(ti.getPowerState());
						    	
						    }
						    
						    if(ti.getPowerName().equals("itemsendInduction")){
						    	
						    	upresult.setItemsendInduction(ti.getPowerState());
						    	
						    }
						    
						    if(ti.getPowerName().equals("itemsendPrecise")){
						    	
						    	upresult.setItemsendPrecise(ti.getPowerState());
						    	
						    }
						    
						    if(ti.getPowerName().equals("itemsendInteractive")){
						    	
						    	upresult.setItemsendInteractive(ti.getPowerState());
						    	
						    }
							
					 }
					 
				 }else{
					 
					 upresult.setDllItemSend(0); 
				 
				 }
				 
				}
				
				if(upresult.getBan()==0){
					
					Integer caveatint=(Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_caveat");
					
					if(caveatint==null){
						
						caveatint=0;
					
					}
					
					session.put("powerId", upresult.getId());
					
					session.put("caveat", caveatint);
					
					session.put("version_onoff",new VVersion());
					
					session.put("tomcat_port",VCommon.port3);
					
					session.put("urid", upresult.getUserid());
					
					session.put("urname", upresult.getUsername());
					
					session.put("urcheck", upresult.getOcheck());
					
					session.put("jhocheck", upresult.getJhocheck());
		        	
					session.put("urtkey",upresult.getUsertkey().replaceAll("\\_", "\\\\_"));
					
					session.put("ip", Constant.IP);
					
					session.put("ltype", Constant.lType);

					session.put("account", account);
					
		        	session.put("seesucai", upresult.getSeesucai());
					session.put("addsucai", upresult.getAddsucai());
					session.put("delsucai", upresult.getDelsucai());
					session.put("seeitem", upresult.getSeeitem());
					session.put("additem", upresult.getAdditem());
					session.put("delitem", upresult.getDelitem());
					session.put("publicsucai", upresult.getPublicsucai());
					session.put("publicitem", upresult.getPublicitem());
					session.put("itemsend", upresult.getItemsend());
					session.put("listsend", upresult.getListsend());
					session.put("insertsend", upresult.getInsertsend());
					session.put("dpsend", upresult.getDpsend());			
					session.put("downmanager", upresult.getDownmanager());
					session.put("clientset", upresult.getClientset());
					session.put("clearclient", upresult.getClearclient());		
					session.put("noticesend", upresult.getNoticesend());
					session.put("onoffset", upresult.getOnoffset());			
					session.put("groupmanager", upresult.getGroupmanager());
					session.put("parameterset", upresult.getParameterset());
					session.put("serverip", upresult.getServerip());			
					session.put("usermanager", upresult.getUsermanager());
					session.put("powermanager", upresult.getPowermanager());
					session.put("sysset", upresult.getSysset());		
					session.put("userlog", upresult.getUserlog());
					session.put("clientlog", upresult.getClientlog());
					session.put("statistical", upresult.getStatistical());			
					session.put("checksend", upresult.getChecksend());
					session.put("checkitem", upresult.getDelitem());
					session.put("jhset", upresult.getJhset());
					session.put("khmanager", upresult.getKhmanager());
					session.put("clientdisabled", upresult.getClientdisabled());
					session.put("dllItemSend", upresult.getDllItemSend());
					session.put("itemsendAdd", upresult.getItemsendAdd());
					session.put("itemsendReplace", upresult.getItemsendReplace());
					
					session.put("itemsendInduction", upresult.getItemsendInduction());
					session.put("itemsendPrecise", upresult.getItemsendPrecise());
					session.put("itemsendInteractive", upresult.getItemsendInteractive());
					
					session.put("itemsendWarning", upresult.getItemsendWarning());
					
					
					//获取语言包
					Local localObj=Constant.LOCAL;
					
					JSONObject jsonObject = JSONObject.fromObject(localObj);
					
					
					session.put("localJson", jsonObject.toString());
					
					
					
					
					//获取用户的修改密码记录
					//插入修改历史
					 if (new VVersion().pwdPloy.equals("1")){
						 
						 List<EditUserPwdHistory> ephs=SqlConnect.getSqlMapInstance().queryForList("sel_edit_pwd_history_zj", account);
						 
						 session.put("pwdHistory", ephs.size());
						 
						 if(ephs.size()>0){
							 
							    //获取时间
							    int editPwdDay=0;
							    
							    String path=Constant.VSCONFIG+File.separator+"vs.ini";
							    
								String editPwdDayStr = PropertiesHandle.GetValueByKey(path,"editPwdDay");
								
								if(editPwdDayStr==null||editPwdDayStr.equals("")){
									
								}else{
									
									editPwdDay=Integer.parseInt(editPwdDayStr);
								}
							 
								if(editPwdDay!=0){
									
									    EditUserPwdHistory eph=ephs.get(0);
									    
									    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
									    
									    //获取当前时间
									    Date d1 = df.parse(DateUtil.getTime());  
									    //System.out.println(DateUtil.getTime());
									    
									    //获取修改密码时间
									    Date d2 = df.parse(eph.getSdate());  
									    //System.out.println(eph.getSdate());
									    
									    long diff = d1.getTime() - d2.getTime();  
									    //System.out.println("diff "+diff);
									    //long days = diff / (1000 * 60 * 60 * 24);  
									    editPwdDay=(1000 * 60 * 60 * 24)*editPwdDay;
									    //System.out.println("editPwdDay "+editPwdDay);
									    //System.out.println();
									    if(diff>editPwdDay){
									    	
									    	session.put("pwdHistory", -1);
									    
									    }
									
								}
							 
						 }
						 
					 }
					
					code="3";
					
				}else{
					
					code="4";
				
				}
				
			}
			
			//获取用户的修改密码记录
			//插入修改历史
			 if (new VVersion().pwdPloy.equals("1")){
			
					//插入用户登陆记录
					UserCheck  uc=new UserCheck();
					uc.setIp(ip);
					uc.setAccount(account);
					uc.setSdate(DateUtil.getTime());
					uc.setType(1);
					if(code.equals("3")){
						
						uc.setState(1);
						
						uc.setFailState(0);
						
						SqlConnect.getSqlMapInstance().update("up_user_check", uc);
						
					}else if(code.equals("2")){
						
						uc.setState(2);
						
						uc.setFailState(1);
						
					}
					
				    SqlConnect.getSqlMapInstance().insert("add_user_check", uc);
			
			 }
			
		}
		
		
		return  GsonUtil.getGson(code);
	}
	
	
	/** 
	 * 解密 
	 * @param str 
	 * @return 
	 */  
	public static byte[] decode(String str) {  
	    byte[] data = str.getBytes();  
	    int len = data.length;  
	    ByteArrayOutputStream buf = new ByteArrayOutputStream(len);  
	    int i = 0;  
	    int b1, b2, b3, b4;  
	  
	    while (i < len) {  
	        do {  
	            b1 = base64DecodeChars[data[i++]];  
	        } while (i < len && b1 == -1);  
	        if (b1 == -1) {  
	            break;  
	        }  
	  
	        do {  
	            b2 = base64DecodeChars[data[i++]];  
	        } while (i < len && b2 == -1);  
	        if (b2 == -1) {  
	            break;  
	        }  
	        buf.write((int) ((b1 << 2) | ((b2 & 0x30) >>> 4)));  
	  
	        do {  
	            b3 = data[i++];  
	            if (b3 == 61) {  
	                return buf.toByteArray();  
	            }  
	            b3 = base64DecodeChars[b3];  
	        } while (i < len && b3 == -1);  
	        if (b3 == -1) {  
	            break;  
	        }  
	        buf.write((int) (((b2 & 0x0f) << 4) | ((b3 & 0x3c) >>> 2)));  
	  
	        do {  
	            b4 = data[i++];  
	            if (b4 == 61) {  
	                return buf.toByteArray();  
	            }  
	            b4 = base64DecodeChars[b4];  
	        } while (i < len && b4 == -1);  
	        if (b4 == -1) {  
	            break;  
	        }  
	        buf.write((int) (((b3 & 0x03) << 6) | b4));  
	    }  
	    return buf.toByteArray();  
	}  
	
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setYzcode(String yzcode) {
		this.yzcode = yzcode;
	}
}
