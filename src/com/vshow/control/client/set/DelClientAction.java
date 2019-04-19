package com.vshow.control.client.set;

import io.netty.channel.ChannelHandlerContext;

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
import com.vshow.control.tool.NettyChannelUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;


public class DelClientAction implements Action {
	
	
	
	
	private int[] qx;
	
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer)session.get("urid");
		Client c;
		ClientGroupRelation cgr;
		String logname="";
		String netmarks="";
        
		for (int i = 0; i < qx.length; i++) {
				 //获取终端信息
				c=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", qx[i]);
				
			
				
				//删除客户端 (如果是管理员)
				if(urid==1){
					//删除队列
					SqlConnect.getSqlMapInstance().delete("del_client_id", qx[i]);
					Constant.messageMap.remove(c.getMark());
					logname=Constant.LOCAL.getA00397();
					
					if(netmarks.length()==0){
						if(c.getMark().trim().length()>0){
							netmarks=c.getMark().trim();
						}
					}else{
						if(c.getMark().trim().length()>0){
							netmarks=netmarks+","+c.getMark().trim();
						}
					}
					
					ChannelHandlerContext channelHandlerContext=VSNettyChannelMap.get(c.getMark());
					if(channelHandlerContext!=null){
						NettyChannelUtil.setChannelHandlerContextClientUpState(channelHandlerContext, 0);
					}
					
					//删除所有终端关系
					SqlConnect.getSqlMapInstance().delete("del_cgr_cid", c.getId());
					//删除终端编号
					SqlConnect.getSqlMapInstance().delete("delete_client_number_clientid", c.getId());
					
					
				}else{
					
					cgr=new ClientGroupRelation();
					cgr.setUid(urid);
					cgr.setCid(c.getId());
					//删除用户管理的客户端关系
					SqlConnect.getSqlMapInstance().delete("del_cgr_cid_by_uid", cgr);
					
					logname=Constant.LOCAL.getA00396();
					
				}
				
				logname=logname+","+c.getName();
			 
				
		     }
		
		     LogHandle.insertTheLog(LogType.type55, urid,logname, 1,1);
		
		     if(urid==1){
		             if(Constant.lType.equals("1")){
		                //删除软加密终端
						String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+netmarks;
						String result_con=HttpRequest.sendPost(Constant.NetJmDelUrl, param);
						
						Map resultMap=JsonHelper.toMap(result_con); 
						String code=(String)resultMap.get("code");
						
						//获取总点位
						String netCountStr =(String)resultMap.get("netCount");
						//获取使用点位
						String surCountStr =(String)resultMap.get("surCount"); 
						
						Constant.NetCountStr=netCountStr;
						
						Constant.NetSurCountStr=surCountStr;
		              }
		     }
		
		      return SUCCESS;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}


}
