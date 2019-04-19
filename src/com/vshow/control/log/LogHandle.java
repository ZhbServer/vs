package com.vshow.control.log;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.vshow.control.data.Log;
import com.vshow.control.tool.SqlConnect;

public class LogHandle {
	
	/**
	 * 添加操作日志
	 * @param stype        创建日志类型
	 * @param urid         操作用户id
	 * @param content      操作日志内容
	 * @param ocheck       需不需要审核(1不需要审核2需要审核)
	 * @param state        日志级别(1 普通日志 2发布日志)
	 * @throws Exception
	 */
	public static Log insertTheLog(int stype, int urid, String content,int ocheck,int state) throws Exception {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String date = sf.format(new Date());
		Log log = new Log();
		log.setContent(content);
		log.setSdate(date);
		log.setStype(stype);
		log.setSendkey(date + "-" + urid + "-" + (int) (Math.random()*10000));
		log.setUrid(urid);
		log.setState(state);
		log.setOcheck(ocheck);
		SqlConnect.getSqlMapInstance().insert("add_log", log);
		int logid = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_log_id_sendkey", log.getSendkey());
		log.setId(logid);
		return log;
	}

	/**
	 * 添加发布日志
	 * @param stype        创建日志类型
	 * @param urid         操作用户id
	 * @param content      操作日志内容
	 * @param ocheck       需不需要审核(1不需要审核2需要审核)
	 * @param state        日志级别(1 普通日志 2发布日志)
	 */
	
	public static Log insertTheLogSend(int stype, int urid, String content,int ocheck) throws Exception {
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		
		String date = sf.format(new Date());
		
		Log log = new Log();
		
		log.setContent(content);
		
		log.setSdate(date);
		
		log.setStype(stype);
		
		log.setSendkey(date + "-" + urid + "-" + (int) (Math.random() * 10000));
		
		log.setUrid(urid);
		
	    log.setOcheck(ocheck);
		
	    SqlConnect.getSqlMapInstance().insert("add_log_send", log);
		
	    int logid = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_by_id_sendkey", log.getSendkey());
		
	    log.setId(logid);
		
	    return log;
		
	}
	
	/**
	 * 创建sendkey
	 */
	
	public static String createSendKey(){
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String date = sf.format(new Date());
		return date + "-" + 1 + "-" + (int)(Math.random() * 10000);
	
	}
	
	
}
