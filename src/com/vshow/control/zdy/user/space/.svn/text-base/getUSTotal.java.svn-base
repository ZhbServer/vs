package com.vshow.control.zdy.user.space;

import com.vshow.control.tool.SqlConnect;

public class getUSTotal {

	public static float doMain(int urid){
		float userSize = 0;
		float sucaiSize = 0;
	
		try {
			String tsize = (String) SqlConnect.getSqlMapInstance().queryForObject("sel_sucai_total_size",urid);
			
			if(tsize == null){
				tsize = "0";
				sucaiSize = Float.parseFloat(tsize);
			}else{
				sucaiSize = Float.parseFloat(tsize);
			}
			
			userSize = sucaiSize ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (float)(Math.round(userSize*100))/100;
	}
	
}
