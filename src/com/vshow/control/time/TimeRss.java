package com.vshow.control.time;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.vshow.control.data.Rss;
import com.vshow.control.rss.Rssxml;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;


public class TimeRss extends Thread {
	public void run() {

		List nlist = null;
		Rss rss;
		try {
			nlist = SqlConnect.getSqlMapInstance().queryForList("gt_news_one");
		} catch (SQLException e) {
		}
		if (nlist != null) {
			if (nlist.size() > 0) {
				String rsstrs = "";
				for (int i = 0; i < nlist.size(); i++) {
					rss = (Rss) nlist.get(i);
					try {
						if ((Constant.TT % rss.getFreshtime()) == 1) {

							Rssxml nt = new Rssxml();
							nt.doNews(rss.getUrl(), rss.getId());

							//if ("".equals(rsstrs)) {
							rsstrs = rss.toString();
							//} else {
							//	rsstrs = rsstrs + "%" + rss.toString();
							//}
							/*
							Iterator iter = Constant.messageMap2.entrySet()
							.iterator();
							MyMsg myt;
							while (iter.hasNext()) {
								Map.Entry entry = (Map.Entry) iter.next();
								Mlt mt = (Mlt) entry.getValue();
								if (mt != null) {
									myt = new MyMsg();
									myt.msg = "32" + rsstrs;
									int allmsgSize=mt.allmsg.size();
									if(allmsgSize==2){
										mt.allmsg.remove(0);
									}else if(allmsgSize>2){
										mt.allmsg.clear();
									}
								    mt.allmsg.add(myt);
								}
							} */
						}
					

					} catch (Exception e) {

					}

				}

			}
		}
	}
}
