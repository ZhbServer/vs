package com.vshow.control.time;

import java.util.Iterator;
import java.util.List;
import java.util.Map;


import com.vshow.control.data.Tq;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tq.ch.Tqxml;
import com.vshow.control.tq.en.EnTqxml;


public class TimeTq extends Thread {
	public void run() {
		
		Tqxml tx = new Tqxml();
		try {
			tx.doTq();
			List tqs = SqlConnect.getSqlMapInstance().queryForList("get_tqyb");
			String tqstrs = "";
			Tq w;
			for (int i = 0; i < tqs.size(); i++) {
				w = (Tq) tqs.get(i);
				if ("".equals(tqstrs)) {
					tqstrs = w.toString();
				} else {
					tqstrs = tqstrs + "%" + w.toString();
				}
			}
			/*Iterator iter = Constant.messageMap2.entrySet().iterator();
			MyMsg myt;
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Mlt mt = (Mlt) entry.getValue();
				if (mt != null) {
					myt = new MyMsg();
					myt.msg = "30" + tqstrs;
					int allmsgSize=mt.allmsg.size();
					if(allmsgSize==2){
						mt.allmsg.remove(0);
					}else if(allmsgSize>2){
						mt.allmsg.clear();
					}
					mt.allmsg.add(myt);
				}
			}
            */   
		} catch (Exception e) {

		}
		
		EnTqxml entx = new EnTqxml();
		try {
			entx.doTq();
			List tqs = SqlConnect.getSqlMapInstance().queryForList("get_entqyb");
			String tqstrs = "";
			Tq w;
			for (int i = 0; i < tqs.size(); i++) {
				w = (Tq) tqs.get(i);
				if ("".equals(tqstrs)) {
					tqstrs = w.toString();
				} else {
					tqstrs = tqstrs + "%" + w.toString();
				}
			}
			/*Iterator iter = Constant.messageMap2.entrySet().iterator();
			MyMsg myt;
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Mlt mt = (Mlt) entry.getValue();
				if (mt != null) {
					myt = new MyMsg();
					myt.msg = "31" + tqstrs;
					int allmsgSize=mt.allmsg.size();
					if(allmsgSize==2){
						mt.allmsg.remove(0);
					}else if(allmsgSize>2){
						mt.allmsg.clear();
					}
					mt.allmsg.add(myt);
				}
			}*/

		} catch (Exception e) {

		}
		
		
		
	}
}
