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

public class AjaxLoginMobileAction extends ActionSupport {
	
	
	private String password;
	private String account;
	
	
	

	@Override
	public String execute() throws Exception {
		
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
	
		
		String code="0";  //1 验证码不正确  2账户或者密码错误 3验证成功 4用户被禁用
		
	
		
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
					
					
					//二次开发菜市场数据显示
					if(new VVersion().dishOnOff.equals("1")){
						code="5";
					}else{
						//节目列表 
						code="3";
					}
					
					
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
			
		
		
		
		return  GsonUtil.getGson(code);
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccount(String account) {
		this.account = account;
	}

}
