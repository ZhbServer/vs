package com.vshow.control.projection;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.Log;
import com.vshow.control.data.Tb;

import com.vshow.control.data.Projection;
import com.vshow.control.data.Result;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbProjectionSendAction extends ActionSupport {

	private String clientids; // 终端id多个以"_"分割
	  
	private String info;

	private int proId;

	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		Local local = (Local) session.get("local");
		HashSet<Integer> tmidsset = new HashSet();

		if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\_");
			for (int i = 0; i < tids_s.length; i++) {
				tmidsset.add(Integer.parseInt(tids_s[i]));
			}
		}
		
        Projection pt=(Projection)sm.queryForObject("see_projection_id", proId);
		
		String ptJson=JSONObject.fromObject(pt).toString();
		
		Protocol protocol=new Protocol(); 
		
		protocol.setType(ProtocolType.TYPE63);
		
		String tname=local.getB00278()+local.getB00278()+":"+pt.getTitle();
		
		protocol.setProtocolPlayBaseList(pt);
		
		
		Client client;
		int rid;
		/** 判断用户有没有发送权限(0.需审核 1.已审核.2节目需审核3.发布需审核) **/
		if (uocheck == 0 || uocheck == 3) {
		

		} else if (uocheck == 1 || uocheck == 2) {

				Log log = LogHandle.insertTheLogSend(LogType.type109, uid,
						tname, 1);

				String sendkey = log.getSendkey();
				
				protocol.setSendkey(sendkey);
				
				JSONObject jsonObject = JSONObject.fromObject(protocol);
	     	
				String msg=jsonObject.toString();
				
				String msg0818=Constant.sendDownString(msg, sendkey,null);

				log.setMsg(msg);
				
				sm.update("upd_log_send_msg", log);
				
				Result rs = new Result();
				
				//HashMap hm = new HashMap();

				// String vlu;
				MyMsg mymsg;

				/** 发送给终端 **/
				for (Integer cid : tmidsset) {
					client = (Client) sm.queryForObject("sel_client_byid", cid);
					Constant.ResetDownState(client.getMark(),"0.0");
					// sm.delete("del_one_senditem", client.getId());
					rs.setClid(client.getId());
					rs.setLogid(log.getId());
					rs.setState(0);
					rs.setType(ResultType.rt42);
					rid = (Integer) sm.insert("ad_result", rs);
					
					/** 添加指令记录 **/
					
				
					if (client.getServerid() == 0) {
						Mlt mt = Constant.messageMap.get(client.getMark());
						if (mt != null) {
							mymsg = new MyMsg();
							mymsg.msg = msg0818;
							mymsg.sendkey = log.getSendkey();
							mt.allmsg.add(mymsg);
						}
					} else {
						/*
						 * client = (Client)
						 * sm.queryForObject("see_terminal_server_mark",
						 * client.getId()); fzmsg = msg + "@" + sendkey + "@";
						 * vlu = (String) hm.get(client.getSrvmark()); if (vlu
						 * == null) { hm.put(client.getSrvmark(),fzmsg +
						 * client.getMark()); } else {
						 * hm.put(client.getSrvmark(),vlu += "_" +
						 * client.getMark()); }
						 */
					}

				}
				/*
				 * Iterator iit = hm.keySet().iterator(); String tke; MyMsg myt;
				 * while (iit.hasNext()) { tke = (String) iit.next(); Mlt mt =
				 * Constant.messageMap2.get(tke); if (mt != null) { myt = new
				 * MyMsg(); myt.msg = (String) hm.get(tke);
				 * 
				 * 
				 * int allmsgSize=mt.allmsg.size(); if(allmsgSize==2){
				 * mt.allmsg.remove(0); }else if(allmsgSize>2){
				 * mt.allmsg.clear(); } mt.allmsg.add(myt); }
				 * 
				 * }
				 */

			}
		return SUCCESS;
	}

	

	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}


	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}



	


	

}
