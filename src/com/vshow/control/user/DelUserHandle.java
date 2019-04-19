package com.vshow.control.user;

import io.netty.channel.ChannelHandlerContext;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemShare;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;
import com.vshow.control.data.User;
import com.vshow.control.letv.cloud.LetvCloudUtil;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.NettyChannelUtil;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;

public class DelUserHandle {

	
	//删除素材
	public static void delUserSucai(List<Sucai> sucais) throws Exception{
		
		Sucai tempSucai;
		for (int i = 0; i < sucais.size(); i++) {
			
			tempSucai=sucais.get(i);
			// 删除素材
			SqlConnect.getSqlMapInstance().delete("del_sucai", tempSucai);
		    // 删除素材与分组的表
			SqlConnect.getSqlMapInstance().delete("del_sucai_group", tempSucai.getId());
			// 删除素材共享
			SqlConnect.getSqlMapInstance().delete("del_scshare", tempSucai.getId());

			// 本地删除素材文件
			// (删除素材:1背景,4图片,5Flash)
			if (tempSucai.getType() == 1 || tempSucai.getType() == 4 || tempSucai.getType() == 5) {
				//删除原图片
				String filepath = Constant.FILES + File.separator + tempSucai.getFilename();
				FileHandle.deleteFile(filepath);
				//删除缩略图
				String sfilepath = Constant.FILES + File.separator +"_"+tempSucai.getFilename();
				FileHandle.deleteFile(sfilepath);
				
				// (删除素材:2音频,3视频)
			} else if (tempSucai.getType() == 2 || tempSucai.getType() == 3) {
				String filepath = Constant.FILES + File.separator + tempSucai.getFilename();
				FileHandle.deleteFile(filepath);
				//删除flv文件
				String fileName=tempSucai.getFilename().substring(0, tempSucai.getFilename().lastIndexOf("."));
				String fileFlv=Constant.FILES + File.separator +fileName+"_.flv";
				FileHandle.deleteFile(fileFlv);
				
					
				SucaiCloud  sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param", tempSucai.getFilename());
				
				
				if(tempSucai.getType()==3){
					if(sCloud!=null){
						if(sCloud.getCloudtype()==1){
							if(Constant.UPVIDEOCLOUDTYPE==1){
								LetvCloudUtil.delcloudUp(Integer.parseInt(sCloud.getVideoid()));
							
							}
						}
						
					}
				}
				if(sCloud!=null){
					SqlConnect.getSqlMapInstance().delete("del_sucaiCloud_videoid", sCloud.getVideoid());	
				}
				
						
						
				
					
				
				// (删除素材:6PPT,7Word,8Excel,9PDF)
			} else if (tempSucai.getType() == 6 || tempSucai.getType() == 7
						|| tempSucai.getType() == 8 || tempSucai.getType() == 9) {
					String filepath = Constant.FILES + File.separator + tempSucai.getFilename();
					FileHandle.delFolder(filepath);  
			}

		} 
	}
	
	
	//删除节目
	public static void delUserItem(List<Item> items) throws Exception{
		
		// 批量删除
		Item tempItem;
		for (int i = 0; i < items.size(); i++) {
		   
			 tempItem=items.get(i);
			  // 通过节目id查询场景
			 Scene scene = (Scene) SqlConnect.getSqlMapInstance().queryForObject("sel_fnvn_iid", tempItem.getId());
				
			  // 删除本地文件和zip
			  String zipPath = Constant.FILES + File.separator+ scene.getFilename() + ".zip";
			  FileHandle.deleteFile(zipPath);
			  String scenePath = Constant.FILES + File.separator+ scene.getFilename();
			  FileHandle.delFolder(scenePath);
			  // 删除场景表
			  SqlConnect.getSqlMapInstance().delete("del_scene", scene.getId());
				
			
			  //删除节目
			  SqlConnect.getSqlMapInstance().delete("del_item_id", tempItem.getId());	
			  //删除节目共享
			  SqlConnect.getSqlMapInstance().delete("del_item_share_itemid", tempItem.getId());
			  // 删除节目分组关系
			  SqlConnect.getSqlMapInstance().delete("del_itgrouprelation_id", tempItem.getId());
		} 
		
	}
	
	//删除互动
	public static void delUserInteractItem(List<InteractItem> interactItem) throws Exception{
	    InteractItem tempInteract;
        for (int i= 0; i  <interactItem.size();  i++) {
        	tempInteract=interactItem.get(i);
        	
			//获取全部节目下的场景
			List list = SqlConnect.getSqlMapInstance().queryForList("sel_interactitem_allscene", tempInteract.getId());
			
			for (int j = 0; j < list.size(); j++) {
				Scene scene=(Scene)list.get(j);
				// 删除节目与场景关联表
				SqlConnect.getSqlMapInstance().delete("del_interactitem_scene", scene.getId());
				// 删除本地文件和zip
				String zipPath = Constant.FILES + File.separator+ scene.getFilename() + ".zip";
				FileHandle.deleteFile(zipPath);
				String scenePath = Constant.FILES + File.separator+ scene.getFilename();
				FileHandle.delFolder(scenePath);
				// 删除场景表
				SqlConnect.getSqlMapInstance().delete("del_interactscene", scene.getId());
			}
			
			//删除节目
			SqlConnect.getSqlMapInstance().delete("del_interactitem", tempInteract.getId());
			//删除节目共享
			SqlConnect.getSqlMapInstance().delete("del_interact_item_share_itemid", tempInteract.getId());
		    //删除节目分组关系
			SqlConnect.getSqlMapInstance().delete("del_interactitemgrouprelation_id", tempInteract.getId());
			
		}
		
	}
	
	//删除互动
	public static void delUserClient(List<Client> clients,int urid) throws Exception{
		String netmarks="";
		ClientGroupRelation cgr;
		Client tempClient;
        for (int i = 0; i < clients.size(); i++) {
        	tempClient=clients.get(i);
			
			
			//删除客户端
			if(urid==1){
				//删除队列
				SqlConnect.getSqlMapInstance().delete("del_client_id", tempClient.getId());
				Constant.messageMap.remove(tempClient.getMark());
				
				//删除所有终端关系
				SqlConnect.getSqlMapInstance().delete("del_cgr_cid", tempClient.getId());
				
				if(netmarks.length()==0){
					if(tempClient.getMark().trim().length()>0){
						netmarks=tempClient.getMark().trim();
					}
				}else{
					if(tempClient.getMark().trim().length()>0){
						netmarks=netmarks+","+tempClient.getMark().trim();
					}
				}
				
				ChannelHandlerContext channelHandlerContext=VSNettyChannelMap.get(tempClient.getMark());
				if(channelHandlerContext!=null){
					NettyChannelUtil.setChannelHandlerContextClientUpState(channelHandlerContext, 0);
				}
				
				
				
			}else{
				
				cgr=new ClientGroupRelation();
				cgr.setUid(urid);
				cgr.setCid(tempClient.getId());
				//删除用户管理的客户端关系
				SqlConnect.getSqlMapInstance().delete("del_cgr_cid_by_uid", cgr);
				
			}
		
	     }
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

		
	}
}
