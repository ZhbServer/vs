package com.vshow.control.client.set;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.tools.ant.taskdefs.Sleep;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbCsClientInfoRefreshAction implements Action {

	private int cid;  //终端id
	
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		Local local= (Local) session.get("local");
		HashSet<Integer> tmidsset = new HashSet();
	
		
		
		
			Log log = LogHandle.insertTheLogSend(LogType.type69, uid,local.getA00466(),1);
			String sendkey = log.getSendkey();
			String msg = "24+sendkey!" + sendkey ;
			log.setMsg(msg);
			sm.update("upd_log_send_msg", log);
			Result rs = new Result();
			HashMap hm = new HashMap();
			String vlu;
			String fzmsg;
			MyMsg mymsg;
			Client client;
		
		
				client=(Client)sm.queryForObject("sel_client_byid", cid);
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt8);
				int rid=(Integer)sm.insert("ad_result", rs);
				//添加指令记录
				//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				
				if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
					}
					Constant.clientInfoMap.put(client.getMark(), msg);
					
					
					
					//判断发送的消息有咩有返回
					int i = 0;
					String clientInof="";
					while(true){
						
						Thread.sleep(1000);
						i++;
						if (i > 60) {
							break;
						}
						
						clientInof=Constant.clientInfoMap.get(client.getMark());
						if(clientInof==null){
							break;
						}
					}
					
					
				} else {
					/*client = (Client) sm.queryForObject("see_terminal_server_mark",
							client.getId());
					fzmsg = msg + "@" + sendkey + "@";
					vlu = (String) hm.get(client.getSrvmark());
					if (vlu == null) {
						hm.put(client.getSrvmark(), fzmsg + client.getMark());
					} else {
						hm.put(client.getSrvmark(), vlu += "_" + client.getMark());
					}*/
				}

			
			/*
			Iterator iit = hm.keySet().iterator();
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
			//session.put("url", "tocs.vs");
		
		
		return SUCCESS;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	

	



	

}
