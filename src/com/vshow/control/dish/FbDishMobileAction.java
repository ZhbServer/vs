package com.vshow.control.dish;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import java.util.List;
import java.util.Map;


import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;

import com.vshow.control.data.Item;
import com.vshow.control.data.Log;

import com.vshow.control.data.Dish;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendPlayBasis;
import com.vshow.control.data.program.ResourceType;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDataSource;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class FbDishMobileAction implements Action {

	
	private String itemsids;   //菜价信息id
	private String clientids;  //终端id多个以","分割
	private String cgids;      //终端分组id多个以"_"分割
    private int returnType=0;  //1成功 
    
    private int sendType=0;  //发布类型 1菜价发布

	public int getReturnType() {
		return returnType;
	}


	public void setReturnType(int returnType) {
		this.returnType = returnType;
	}


	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		
		HashSet<Integer> tmidsset = new HashSet();
	
		/**获取所有终端**/
		if (cgids != null && !"".equals(cgids)) {
			
			String[] cgids_s = cgids.split("\\,");
			ClientGroupRelation cgr;
			/** 获取用户下的所有终端**/
			for (int i = 0; i < cgids_s.length; i++) {
				
				cgr=new ClientGroupRelation();
				cgr.setUid(uid);
				cgr.setGid(Integer.parseInt(cgids_s[i].trim().split("\\,")[0]));
				cgr.setGtype(Integer.parseInt(cgids_s[i].trim().split("\\,")[1]));
				List terms = sm.queryForList("sel_cgr_gid_uid_by_gtype",cgr);
				for (int j = 0; j < terms.size(); j++) {
				
					tmidsset.add(Integer.parseInt(terms.get(j)+""));
					
				}
			}
		}
		if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\,");
			for (int i = 0; i < tids_s.length; i++) {
				tmidsset.add(Integer.parseInt(tids_s[i]));	
			}
		}
		
		
		
		if(tmidsset.size()>0){
		
			if(VVersion.le_clientdisabled==0){
				
				int  disabled=Constant.checkDisabledClient(tmidsset);
				
				if(disabled==1){
					
					return "success3"; 
				
				}	
				
			}
			
			 //获取数据集合
			 Dish dish=(Dish)SqlConnect.getSqlMapInstance().queryForObject("sel_dish_info_id", Integer.parseInt(itemsids));
			
			 if(dish!=null){
				 Protocol protocol=new Protocol();
	        	 
	        	 protocol.setType(ProtocolType.TYPE51);
	        	 
	        	 ProtocolPlayBase ppb=new ProtocolPlayBase();
	        	 
	        	 ppb.setmType(ResourceType.TYPE_DATA_SOURCE);
	        	 
	        	 ProtocolDataSource pds=new ProtocolDataSource();
	        	 
	        	 pds.setDataSource(dish.getContent());
	        	 
	        	 pds.setOpt(0);
	        	 
	        	 pds.setShowPos(0);
	        	 
	        	 ppb.setmMsgJson(pds);
	        	 
	        	protocol.setProtocolPlayBaseList(ppb);
	        	 
	        	JSONObject jsonObject = JSONObject.fromObject(protocol);
	        	 
	        	System.out.println(jsonObject.toString());
	        	 
	        	String msg0818=Constant.sendDownString(jsonObject.toString(), "",null);
	        	
				Client client;
				MyMsg mymsg;
				for (Integer cid : tmidsset) {
					client=(Client)sm.queryForObject("sel_client_byid", cid);
					
					  Mlt mt = Constant.messageMap.get(client.getMark());
					 if (mt != null) {
							mymsg = new MyMsg();
							mymsg.msg = msg0818;
							mymsg.sendkey = "";
							mt.allmsg.add(mymsg);
					 }
					 
					  
				}
				 
			 }
			
		}
		sendType=1;
		returnType=1;
		return SUCCESS;
	}


	public int getSendType() {
		return sendType;
	}


	public void setSendType(int sendType) {
		this.sendType = sendType;
	}


	public String getItemsids() {
		return itemsids;
	}

	public void setItemsids(String itemsids) {
		this.itemsids = itemsids;
	}

	

	


	public String getClientids() {
		return clientids;
	}


	public void setClientids(String clientids) {
		this.clientids = clientids;
	}


	public String getCgids() {
		return cgids;
	}

	public void setCgids(String cgids) {
		this.cgids = cgids;
	}
	
	

}
