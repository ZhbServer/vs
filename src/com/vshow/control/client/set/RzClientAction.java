package com.vshow.control.client.set;

import java.util.List;
import java.util.Map;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;


public class RzClientAction implements Action {
	
	
	
	
	private String info;
	private String qxs;
	

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer)session.get("urid");
		Client c;
		ClientGroupRelation cgr;
		String logname="";
		String netmarks="";
		String qx[]=qxs.split("\\_");
        for (int i = 0; i < qx.length; i++) {
			 //获取终端信息
			c=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", Integer.parseInt(qx[i]));
			
			LogHandle.insertTheLog(LogType.type55, urid,logname+":"+c.getName(), 1,1);
			
			if (!c.getMark().isEmpty()) {
				if(i==0){
					netmarks=c.getMark();
				}else{
					netmarks=netmarks+","+c.getMark();
				}
			}
		
	     }
         if(Constant.lType.equals("1")){
        	//认证
 			String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+netmarks;
 			
 			String result_con=HttpRequest.sendPost(Constant.NetJmAddUrl, param);
 			
 			Map resultMap=JsonHelper.toMap(result_con); 
 			
 			String code=(String)resultMap.get("code");
 			
 			info=code;
 			if(code==null){
 				//认证未通过[软加密]
 				System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
 				
 			}else{
 				if (code.equals("100001")){
 				    //验证失败(账号或者密码不对)
 					System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
 					
 				}else{
 					
 					if(code.equals("100002")){
 						//使用点位数超出总点位数	
 						System.out.println(Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]");
 						
 						
 					}else if(code.equals("100003")){
 						
 						
 						//获取总点位
 						String netCountStr =(String)resultMap.get("netCount");
 						//获取使用点位
 						String surCountStr =(String)resultMap.get("surCount"); 
 						
 						Constant.NetCountStr=netCountStr;
 						
 						Constant.NetSurCountStr=surCountStr;
 						
 						for (int i = 0; i < qx.length; i++) {
 							 
 							 //获取终端信息
 							c=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", Integer.parseInt(qx[i]));
 							if (!c.getMark().isEmpty()) {
 								
 				                
 								SqlConnect.getSqlMapInstance().update("update_client_mark_by_netstate1", c.getMark());
 								//SqlConnect.getSqlMapInstance().delete("del_allmark_mark", mark);
 								//if (Constant.messageMap.size() < Constant.G4) {
 									if (Constant.messageMap.get(c.getMark()) == null) {
 										Mlt msgList = new Mlt();
 										Constant.messageMap.put(c.getMark(), msgList);
 									}
 									//更新终端在线状态
 									if(VSNettyChannelMap.get((c.getMark()))==null){
 										
 									}else{
 										//更新终端在线状态
 										Client tc=new Client();
 										tc.setMark(c.getMark());
 										tc.setZxstate(1);
 										SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
 									}
 								//}

 							}
 						}
 						//LogHandle.insertTheLog(LogType.type40, urid, Constant.LOCAL.getA00412()+":" + marks,1,1);
 					}
 				}		
 			}
 		
            	  
              
         }
		
		
		return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	
	
	public String getQxs() {
		return qxs;
	}

	public void setQxs(String qxs) {
		this.qxs = qxs;
	}


}
