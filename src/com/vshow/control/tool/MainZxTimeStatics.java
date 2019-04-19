package com.vshow.control.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Observable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.tools.ant.types.CommandlineJava.SysProperties;

import com.vshow.control.data.CountClientTime;

public class MainZxTimeStatics  extends Thread  {

	private static Log logger = LogFactory.getLog(MainZxTimeStatics.class);
	
	 // 此方法一经调用，立马可以通知观察者，在本例中是监听线程

    /*public void doBusiness(){

        if(true){

            super.setChanged();

        }

        notifyObservers();

    }*/
    
	@Override
	public void run() {
		
		SimpleDateFormat myFmt = new SimpleDateFormat("mmss");
		int count=0;
		while(true){
			/*if(count==10){
				break;
			}*/
	    
			//count++;
			Date now=new Date();
			
			//System.out.println("定时刷新大小:"+Constant.itemMap.size());
			/*
			String keys="";
			for(Iterator itr = Constant.itemMap.keySet().iterator(); itr.hasNext();){
		    	   
		    	String key = (String) itr.next();
		    	
		    	String value = (String)Constant.itemMap.get(key);
		    	
	    	    keys=keys+" "+key+"-"+value;
	    	  
	         }
			
			logger.info("定时刷新内容:"+keys);
			*/
			//System.out.println(myFmt.format(now));
			if(myFmt.format(now).equals("0000")){ //判断整点操作
				//System.out.println(myFmt.format(now));
				
				Hashtable<String,Object> map = Constant.itemMap;
			
				/*
				System.out.println("整点刷新大小:"+map.size());
				
				logger.info("整点刷新大小:"+map.size());
				 
				
				    
				for(Iterator itr = map.keySet().iterator(); itr.hasNext();){
			    	   
				    	String key = (String) itr.next();
				    	
			    	    keys=keys+" "+key;
			    	  
			    }
				    
				logger.info("map: "+keys);
				    
				System.out.println("map: "+keys);
				*/
				if(map.size()>0){
					Iterator iter = map.entrySet().iterator();
					while (iter.hasNext()) {
						Map.Entry entry = (Map.Entry) iter.next();
						Object key = entry.getKey();
						Object val = entry.getValue();
						String mark = String.valueOf(key);
						//System.out.println(val);
						Date date = (Date)val;
						try {
							Integer cid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_bymark", mark);
							
							if(cid!=null){
								
								CountClientTime cct = new CountClientTime();
								
								cct.setClientid(cid);
								
								String dateNowStr ="";
								
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								
								Calendar c = Calendar.getInstance();
								
								int hour = c.get(Calendar.HOUR_OF_DAY);
								
								if(hour == 0){
									
									dateNowStr = sdf.format(getNextDay(new Date()));  
								
								}else{
									
									dateNowStr = sdf.format(new Date()); 
								
								}
								
								long cha = (new Date().getTime() - date.getTime())/1000;
								
								int second = Integer.parseInt(String.valueOf(cha));
								
								if(second>3600){
									
									second=3600;
								
								}
								//System.out.println(second);
								if(hour == 0){
									
									cct.setH23(second);
								
								}else if(hour == 1){
									
									cct.setH0(second);
								
								}else if(hour == 2){
									
									cct.setH1(second);
								
								}else if(hour == 3){
									cct.setH2(second);
								}else if(hour == 4){
									cct.setH3(second);
								}else if(hour == 5){
									cct.setH4(second);
								}else if(hour == 6){
									cct.setH5(second);
								}else if(hour == 7){
									cct.setH6(second);
								}else if(hour == 8){
									cct.setH7(second);
								}else if(hour == 9){
									cct.setH8(second);
								}else if(hour == 10){
									cct.setH9(second);
								}else if(hour == 11){
									cct.setH10(second);
								}else if(hour == 12){
									cct.setH11(second);
								}else if(hour == 13){
									cct.setH12(second);
								}else if(hour == 14){
									cct.setH13(second);
								}else if(hour == 15){
									cct.setH14(second);
								}else if(hour == 16){
									cct.setH15(second);
								}else if(hour == 17){
									cct.setH16(second);
								}else if(hour == 18){
									cct.setH17(second);
								}else if(hour == 19){
									cct.setH18(second);
								}else if(hour == 20){
									cct.setH19(second);
								}else if(hour == 21){
									cct.setH20(second);
								}else if(hour == 22){
									cct.setH21(second);
								}else if(hour == 23){
									cct.setH22(second);
								}
								
								cct.setDate(dateNowStr);
								
								Integer cctid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_cct_byclientid", cct);
								if (cctid == null) {
									cct.setBcount(second);
									SqlConnect.getSqlMapInstance().insert("insert_CountCTime", cct);
								}else{
									cct.setId(cctid);
									if(hour == 0){
										SqlConnect.getSqlMapInstance().update("update_cct_h23",cct);
									}else{
										SqlConnect.getSqlMapInstance().update("update_cct_h"+String.valueOf(hour-1),cct);
									}
								}
							}
							//Constant.itemMap.remove(mark);
							Date newd = new Date();
							newd.setSeconds(0);
							Constant.itemMap.put(mark, newd);
							//System.out.println(Constant.getCurrentDate());
						} catch (Exception e) {
							logger.error(e);
							e.printStackTrace();
							
							//doBusiness();//在抛出异常时调用，通知观察者，让其重启线程

			                break;//异常抛出之后，一定要跳出循环，保证将线程送进地狱
			                
							
						}
					}
				}
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				logger.error(e);
				e.printStackTrace();
				//doBusiness();//在抛出异常时调用，通知观察者，让其重启线程

                break;//异常抛出之后，一定要跳出循环，保证将线程送进地狱
				
			}
			
		}
	
	}
	
	public static Date getNextDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		date = calendar.getTime();
		return date;
	}
	
}
