package com.vshow.control.time;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.vshow.control.data.Client;

import com.vshow.control.data.InsertSend;
import com.vshow.control.data.Item;
import com.vshow.control.data.Log;

import com.vshow.control.data.Result;

import com.vshow.control.data.Scene;

import com.vshow.control.data.Send;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.MainZxTimeStatics;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class TimeDo extends Thread {

	private int getWeekOfDate() {
		Calendar cal = Calendar.getInstance();
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w <= 0) {
			w = 7;
		}
		return w;
	}

	public void run() {
		
		Constant.TT++;
		
		
		//固定时间段更新日志到历史表
		/*if(Constant.getCurrentDate2().equals("00:59:58")||Constant.getCurrentDate2().equals("00:59:59")){
			if(Constant.HISTORYUPLOG){
				new TimeHistoryUpLog().start();
			}
		}*/
	
		//更新天气(每一小时更新一次)/汇率  //每小时更新
		if (Constant.TT % 3600 == 1) {
			new TimeTq().start();
			//new TimeHl().start();
		}
        //更新 截屏
		//new TimeJp().start();
		//更新Rss
		new TimeRss().start();
		
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		//定时下载
		try {
			String fzmsg;
			Result rs = new Result();
			HashMap hm = new HashMap();
			String vlu;
			MyMsg mymsg;
			List xiaitems = SqlConnect.getSqlMapInstance().queryForList(
					"see_noxiazaiitme");
			for (int i = 0; i < xiaitems.size(); i++) {
				
				InsertSend isd = (InsertSend) xiaitems.get(i);
				// 查询需不需要审核
				Log logocheck = (Log)SqlConnect.getSqlMapInstance().queryForObject("get_log_send_ocheck", isd.getResultid());
				if (logocheck != null) {
					if (logocheck.getOcheck() == 1) {

						if (Constant.compare_date(fmt.format(time),isd.getXiadate()) == 0
								|| Constant.compare_date(fmt.format(time),isd.getXiadate()) == 1)
						{
							
							System.out.println("进入定时发送");
							// 获取发布的终端
							Client client = (Client) SqlConnect.getSqlMapInstance().queryForObject("sel_resultid_client",isd.getResultid());
							// 更新状态
							// SqlConnect.getSqlMapInstance().update(
							// "update_insertsend_state",
							// isd.getResultid());
							SqlConnect.getSqlMapInstance().update("update_insertsend_state_id", isd.getId());
							String msg0818=Constant.sendDownString(logocheck.getMsg(), logocheck.getSendkey(),null);
							Constant.ResetDownState(client.getMark(),"0.0");
							if (client.getServerid() == 0) {
								Mlt mt = Constant.messageMap.get(client.getMark());
								if (mt != null) {
									
									mymsg = new MyMsg();
									mymsg.msg = msg0818;
									mymsg.fbType = ResultType.rt17;
									mymsg.sendkey = logocheck.getSendkey();
									
									Iterator<MyMsg> iter = mt.allmsg.iterator();
									while(iter.hasNext()){
									   MyMsg s =iter.next();
									   if(s.fbType==17){
									     //System.out.println(s);
									     iter.remove();
									   }
									}
									//mt.allmsg
									mt.allmsg.add(mymsg);
								}
							} else {
								/*client = (Client) SqlConnect
										.getSqlMapInstance().queryForObject(
												"see_terminal_server_mark",
												client.getId());
								fzmsg = msg + "@" + sendkey + "@";
								vlu = (String) hm.get(client.getSrvmark());
								if (vlu == null) {
									hm.put(client.getSrvmark(),
											fzmsg + client.getMark());
								} else {
									hm.put(client.getSrvmark(), vlu += "_"
											+ client.getMark());
								}*/
							}					
						}
					}
				}

			}
			/*Iterator iit = hm.keySet().iterator();
			String tke;
			MyMsg myt;
			while (iit.hasNext()) {
				tke = (String) iit.next();
				Mlt mt = Constant.messageMap2.get(tke);
				if (mt != null) {
					myt = new MyMsg();
					myt.msg = (String) hm.get(tke);
					int allmsgSize=mt.allmsg.size();
					if(allmsgSize==2){
						mt.allmsg.remove(0);
					}else if(allmsgSize>2){
						mt.allmsg.clear();
					}
					mt.allmsg.add(myt);
				}
			}*/
		} catch (SQLException e1) {

		}
		
		
		
		
		
	}
}