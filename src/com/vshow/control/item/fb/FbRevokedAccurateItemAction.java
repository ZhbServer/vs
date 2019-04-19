package com.vshow.control.item.fb;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolPlayAccurate;
import com.vshow.control.protocol.ProtocolType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;


/**
 * 撤销节目
 *
 */
public class FbRevokedAccurateItemAction implements Action {
	
    private int slid;  //发布日志id	

	public String execute() throws Exception {
		
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		session.put("url", "reusltlast.vs");
		
		int uid = (Integer) session.get("urid");
		
		int uocheck = (Integer) session.get("urcheck");
		
		Local local= (Local) session.get("local");
		
		
		//根据发布日志id 获取所发布终端
		List<Integer> tmidsset=SqlConnect.getSqlMapInstance().queryForList("sel_result_clid_logid",slid);
		
		if(tmidsset.size()>0){
			
			//获取撤销协议
			Log logSend=(Log)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_all_pro", slid);
			
			JSONObject json = JSONObject.fromObject(logSend.getMsg());
			
			Protocol protocol= (Protocol)JSONObject.toBean(json, Protocol.class);
	        
			protocol.setType(ProtocolType.TYPE52);
			
			protocol.setProtocolPlayBaseList("");
			
			protocol.setProtocolDownResourceList(new  ArrayList<ProtocolDownResource>());
			
            
	
			String tname = local.getA00777()+":" + logSend.getContent();
			
			Log log = LogHandle.insertTheLogSend(LogType.type105, uid,tname,1);
			
			String sendkey = log.getSendkey();
			protocol.setSendkey(sendkey);
			
			json = JSONObject.fromObject(protocol);
			
			log.setMsg(json.toString());
			
			sm.update("upd_log_send_msg", log);
			
			Result rs = new Result();
			
			
			
			MyMsg mymsg;
			Client client;
			 /** 发送给终端**/
            String msg0818=Constant.createDownString(json.toString(), sendkey);
            
			// 发送给终端
			for (Integer cid : tmidsset) {
				client=(Client)sm.queryForObject("sel_client_byid", cid);
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt37);
				int rid=(Integer)sm.insert("ad_result", rs);
				//添加指令记录
				//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				
				if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg0818;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
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
		}
		
		
		return SUCCESS;
	}

	public int getSlid() {
		return slid;
	}

	public void setSlid(int slid) {
		this.slid = slid;
	}

	

	


	

}
