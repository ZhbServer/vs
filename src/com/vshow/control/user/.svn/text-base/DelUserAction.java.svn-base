package com.vshow.control.user;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

public class DelUserAction extends ActionSupport {
	
	
	private int qx[];
	
	
	@Override
	public String execute() throws Exception {
		
	    SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		
		for (int j = 0; j < qx.length; j++) {
			//获取需要删除用户id
	        User delUser=(User)sm.queryForObject("sel_user_all_id", qx[j]);
	        
	        if(delUser!=null){
	        	//获取需要删除用户(包括子用户列表)
	        	List<User>  userList=sm.queryForList("sel_users_tkey_self", delUser.getTkey());
	        	
	        	User tempUser;
	        	for (int i = 0; i < userList.size(); i++) {
	        		tempUser=userList.get(i);
	        		
	        		
	        		
	        		//删除终端/删除终端分组
	        		  //查询终端
	        		  List<Client> clients=sm.queryForList("sel_client_user_all", tempUser.getId());
	        		  DelUserHandle.delUserClient(clients,tempUser.getId());
	        		  
	        		  //删除终端分组
	        		  sm.delete("del_user_client_group_relation", tempUser.getId());
	        		  sm.delete("del_user_client_group",tempUser.getId());
	        		  
	        		 //删除通知
	        		 sm.delete("del_user_notice", tempUser.getId());
	        		
	        		
	        		//删除素材/共享/素材分组
	        		  // 查询素材
	        		  List<Sucai> sucais=sm.queryForList("sel_sucai_user_all", tempUser.getId());
	        		  DelUserHandle.delUserSucai(sucais);
	        		  
	        		  //删除素材分组
	        		  sm.delete("del_user_sucai_group", tempUser.getId());
	        		
	        		//删除节目/共享
	        		  //查询节目
	        		  List<Item> items=sm.queryForList("sel_item_user_all", tempUser.getId());
	        		  DelUserHandle.delUserItem(items); 
	        		  
	        		 
	        		  
	        		  List<InteractItem> interactItems=sm.queryForList("sel_interact_item_user_all", tempUser.getId());
	        		  DelUserHandle.delUserInteractItem(interactItems); 
	        		  
	        		
	        		  //删除节目分组
	        		  sm.delete("del_user_item_group", tempUser.getId());
	        		  
	        		  //删除互动节目分组
	        		  sm.delete("del_user_interactItem_group", tempUser.getId());
	        		 
	        		  //删除用户存储
	        		  sm.delete("del_user_space", tempUser.getId());
	        		  sm.delete("del_user_space_state", tempUser.getId());
	        		  
	        		  //删除用户表
	        		  sm.delete("del_user", tempUser.getId());
	        		  
	        		 
	        		
				}
	        	
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
