package com.vshow.control.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;

import com.vshow.control.data.CountClientTime;

public class MainLxTimeStatics{

	public void run(String mac) {
		Hashtable<String,Object> map = Constant.itemMap;
		if(map.size()>0){
			Object val = map.get(mac);
			Date date = (Date)val;
			try {
				Integer cid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_bymark", mac);
				if(cid!=null){
					CountClientTime cct = new CountClientTime();
					cct.setClientid(cid);
					
					String dateNowStr ="";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Calendar c = Calendar.getInstance();
					int hour = c.get(Calendar.HOUR_OF_DAY);
					dateNowStr = sdf.format(new Date()); 
					
					long cha = (new Date().getTime() - date.getTime())/1000;
					int second = Integer.parseInt(String.valueOf(cha));
					
					if(second>3600){
						second=3600;
					}
					if(hour == 0){
						cct.setH0(second);
					}else if(hour == 1){
						cct.setH1(second);
					}else if(hour == 2){
						cct.setH2(second);
					}else if(hour == 3){
						cct.setH3(second);
					}else if(hour == 4){
						cct.setH4(second);
					}else if(hour == 5){
						cct.setH5(second);
					}else if(hour == 6){
						cct.setH6(second);
					}else if(hour == 7){
						cct.setH7(second);
					}else if(hour == 8){
						cct.setH8(second);
					}else if(hour == 9){
						cct.setH9(second);
					}else if(hour == 10){
						cct.setH10(second);
					}else if(hour == 11){
						cct.setH11(second);
					}else if(hour == 12){
						cct.setH12(second);
					}else if(hour == 13){
						cct.setH13(second);
					}else if(hour == 14){
						cct.setH14(second);
					}else if(hour == 15){
						cct.setH15(second);
					}else if(hour == 16){
						cct.setH16(second);
					}else if(hour == 17){
						cct.setH17(second);
					}else if(hour == 18){
						cct.setH18(second);
					}else if(hour == 19){
						cct.setH19(second);
					}else if(hour == 20){
						cct.setH20(second);
					}else if(hour == 21){
						cct.setH21(second);
					}else if(hour == 22){
						cct.setH22(second);
					}else if(hour == 23){
						cct.setH23(second);
					}
					cct.setDate(dateNowStr);
					
					Integer cctid = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_cct_byclientid", cct);
					cct.setId(cctid);
					SqlConnect.getSqlMapInstance().update("update_cct_h"+String.valueOf(hour),cct);
				}
				//Date newd = new Date();
				//Constant.itemMap.put(mac, newd);
				Constant.itemMap.remove(mac);
			} catch (Exception e) {
				//e.printStackTrace();
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
