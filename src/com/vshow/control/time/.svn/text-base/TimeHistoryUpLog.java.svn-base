package com.vshow.control.time;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;


import java.util.List;


import javax.imageio.ImageIO;

import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;


public class TimeHistoryUpLog extends Thread {
	
	public void run() {
         
		Constant.HISTORYUPLOG=false;
         
        //日志查出 ocheck=1的 log
		try {
			
			List<Log> logsends=SqlConnect.getSqlMapInstance().queryForList("sel_log_send_ocheck_by_id",1);
			List<Integer> results;
			List<Integer> results3;
			for (Log log : logsends) {
				//查出 result state 为 2 or 1 结果集(已接收或者操作成功) 
				
				results=SqlConnect.getSqlMapInstance().queryForList("sel_result_state_by_logid", log.getId());
				for (Integer rid : results) {
					//删除send
					SqlConnect.getSqlMapInstance().delete("del_log_send_id",rid);
					//删除result
					SqlConnect.getSqlMapInstance().delete("del_result_id",rid);     
				}
				
				//查出 result state 为 3 的结果集 (下载等待)
				results3=SqlConnect.getSqlMapInstance().queryForList("sel_result_state3_by_logid", log.getId());
				if(results3.size()==0){
					//新增历史log_send_history
					SqlConnect.getSqlMapInstance().insert("add_log_send_history", log);
					//删除log_send
					SqlConnect.getSqlMapInstance().delete("del_log_send_id",log.getId());	
				}
				
			}
			
		} catch (SQLException e) {
			Constant.HISTORYUPLOG=true;    
			e.printStackTrace();
		}
         
         
         
         Constant.HISTORYUPLOG=true;    
	}
}
