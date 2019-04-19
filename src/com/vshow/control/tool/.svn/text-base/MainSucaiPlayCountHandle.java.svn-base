package com.vshow.control.tool;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;


import com.vshow.control.data.AdvertisingPlay;
import com.vshow.control.data.Client;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.data.SucaiPlayCount;
import com.vshow.control.statics.sucaiStaticsImport.jsonClient;
import com.vshow.control.statics.sucaiStaticsImport.jsonDate;
import com.vshow.control.statics.sucaiStaticsImport.jsonItem;

public class MainSucaiPlayCountHandle extends Thread {
	
	
	
	private static Log logger = LogFactory.getLog(MainSucaiPlayCountHandle.class);
	
	@Override
	public void run() {
		
		String recemsg="";
		String mMac;
		String mDatetime;
		String mName;
		String mType;
		String mFile;
		String mCount;
		String mClickCount="0";
		
		while (true) {
			
			try {
				//遍历播放次数消息队列
				 if(Constant.playCountMsgs.size()>0){
					  System.out.println("处理播放统计队列总大小:"+Constant.playCountMsgs.size());
					  recemsg=Constant.playCountMsgs.poll();
					  
					  if(recemsg!=null){
						  
						    JSONObject jsonObj = JSONObject.fromObject(recemsg);
							jsonDate jd1=(jsonDate)JSONObject.toBean(jsonObj, jsonDate.class);
							List<jsonClient> jcList;
							mMac = jd1.getmMac();
							mDatetime = jd1.getmDatetime();
							jcList = jd1.getmProgramCountList();
							for (int j = 0; j < jcList.size(); j++) {
								
								JSONObject jsonObject1=JSONObject.fromObject(jcList.get(j));
								
								jsonClient jc4 = (jsonClient)JSONObject.toBean(jsonObject1, jsonClient.class);
								
								List<jsonItem> jiList;
								
								mName = jc4.getmName();
								
								jiList = jc4.getmItemCountList();
								
								for (int k = 0; k < jiList.size(); k++) {
									
									JSONObject jsonObject2=JSONObject.fromObject(jiList.get(k));
									
								    jsonItem ji6 = (jsonItem)JSONObject.toBean(jsonObject2, jsonItem.class);
									
									mType = ji6.getmType();
									
									mFile = ji6.getmFile();
									
									mCount = ji6.getmCount();
									
									try {
										mClickCount=ji6.getmClickCount();
									} catch (Exception e) {
										// TODO: handle exception
										mClickCount="0";
									}
									
									SucaiPlayCount spc = new SucaiPlayCount();
									
									//验证mMac获取终端名
									//if(mMac!=null){
									//	String cName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_make_name_client", mMac);
									//	if(cName != null){
									//		spc.setMark(cName);
									//	}else{
									//		spc.setMark("");
									//	}
									//}
									if(mMac!=null){
										spc.setMark(mMac);
									}
									
									//验证mfile获取节目名  
									if(mName!=null){
										
										String checkMnameType=mName.substring(0, 1);
										
										if(checkMnameType.equals("a")){
											
											InteractItem iitem=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename", mName);
											
											if(iitem!=null){
												
												spc.setName(iitem.getName());
											
											}else{
												
												spc.setName("");
												
											}
											
										}else{
											
											Item item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_filename", mName);
											
											if(item!=null){
												
												spc.setName(item.getName());
											
											}else{
												
												spc.setName("");
											
											}
										}
									}
									
									if(Integer.parseInt(mType)==1){
										mType="3";
									}else if(Integer.parseInt(mType)==2){
										mType="4";
									};
									spc.setStype(Integer.parseInt(mType));
									
									//验证mFile获取素材名
									//if(mFile!=null){
									//	String newFname = (String)SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_byfname",mFile);
									//	if(newFname != null){
									//		spc.setSname(newFname);
									//	}else{
									//		spc.setSname("");
									//	}
									//}
									spc.setSname(mFile);
									spc.setScount(mCount);
									spc.setSdate(DateUtil.transferLongToDate("yyyy-MM-dd",mDatetime));
									spc.setFilename(mName);
									
									if(mClickCount==null||mClickCount.equals("")){
										mClickCount="0";
									}
									
									spc.setmClickCount(mClickCount);
									
									try {
										int count = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_sucai_playCount", spc);
										
										if(count > 0){
											SqlConnect.getSqlMapInstance().update("update_sucai_playCount_click", spc);
										}else{
											SqlConnect.getSqlMapInstance().insert("insert_sucai_playCount_click", spc);
										}
										
									} catch (SQLException e) {
										e.printStackTrace();
									}
									
									//System.out.println(mMac+">>>"+mName+">>>"+mType+">>>"+mFile+">>>"+mCount+">>>"+mDatetime);
									
									logger.info("终端统计播放次数返回数据(已过滤):"+mMac+">>>"+mName+">>>"+mType+">>>"+mFile+">>>"+mCount+">>>"+DateUtil.transferLongToDate("yyyy-MM-dd",mDatetime)+">>>"+mClickCount);
								
								}
							}
					  }
					  
				 }else{
					 sleep(1000);
				 }	  
				
				
			} catch (Exception e) {
				logger.error(e);
			}
			
			
		}
	}
	
	
	public static void main(String[] args) {
		
		System.out.println(DateUtil.transferLongToDate("yyyy-MM-dd","1550419200000"));
		
	 }
	
	
}
