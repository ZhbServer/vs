package com.vshow.control.tool;


import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.vshow.control.data.AdvertisingPlay;
import com.vshow.control.statics.sucaiStaticsImport.jsonClient;
import com.vshow.control.statics.sucaiStaticsImport.jsonDate;


public class MainSucaiPlayCountSdkHandle extends Thread {
	
	
	private static Log logger = LogFactory.getLog(MainSucaiPlayCountSdkHandle.class);
	
	@Override
	public void run() {
		
		String recemsg="";
		String mMac;
		String mDatetime;
		
		while (true) {
			
			try {
				//遍历播放次数消息队列
				 if(Constant.playCountMsgsSdk.size()>0){
					
					  recemsg=Constant.playCountMsgsSdk.poll();
					  
					  if(recemsg!=null){
						  
						    JSONObject jsonObj = JSONObject.fromObject(recemsg);
						    
							jsonDate jd1=(jsonDate)JSONObject.toBean(jsonObj, jsonDate.class);
							
							List<jsonClient> jcList;
							
							mMac = jd1.getmMac();
							
							mDatetime = jd1.getmDatetime();
							
							jcList = jd1.getmProgramCountList();
							
							for (int j = 0; j < jcList.size(); j++) {
								
								JSONObject jsonObject1=JSONObject.fromObject(jcList.get(j));
								
								AdvertisingPlay ji6 = (AdvertisingPlay)JSONObject.toBean(jsonObject1, AdvertisingPlay.class);
								
								if(ji6.getAid()!=null&&!ji6.getAid().equals("")){
									
									AdvertisingPlay  ap=new AdvertisingPlay();
									ap.setAurl(ji6.getAurl());
									ap.setMark(mMac);
									ap.setAdate(DateUtil.transferLongToDate("yyyy-MM-dd",mDatetime));
									//ap.setAcount(ji6.getAcount());
									
									//判断数据存在不存在
									Integer count = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_adPlay_acount", ap);
									ap.setAid(ji6.getAid());
									ap.setAtime(ji6.getAtime());
									
									if(count == null||count==0){
										
										ap.setAcount(ji6.getAcount());
										SqlConnect.getSqlMapInstance().insert("ad_adPlay", ap);
										
									}else{
										
										ap.setAcount(ji6.getAcount());
										SqlConnect.getSqlMapInstance().update("up_adPlay_acount", ap);
									
									}
									
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
	
	
	
	
}
