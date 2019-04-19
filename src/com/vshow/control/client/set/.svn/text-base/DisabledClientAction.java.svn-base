package com.vshow.control.client.set;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;


public class DisabledClientAction implements Action {
	
	
	
	// 终端ids;
	private int[] qx;
	private int disabledstate;
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer)session.get("urid");
		
		Client c;
		ClientGroupRelation cgr;
		String logname="";
		String netmarks="";
		Client client;
		
		Log log = LogHandle.insertTheLogSend(LogType.type94, urid,Constant.LOCAL.getA00765(),1);
		String sendkey = log.getSendkey();
		
		String msg = "49+sendkey!" + sendkey + "%" + disabledstate;   //0否   1禁用
		log.setMsg(msg);
		sm.update("upd_log_send_msg", log);
		Result rs = new Result();
		HashMap hm = new HashMap();
		String vlu;
		String fzmsg;
		MyMsg mymsg;
		
		
        for (int i = 0; i < qx.length; i++) {
        	client=new Client();
        	client.setId(qx[i]);
        	client.setDisabledstate(disabledstate);
        	SqlConnect.getSqlMapInstance().update("update_disabled", client);
        	
        	//获取终端信息
        	
        	client=(Client)sm.queryForObject("sel_client_byid", qx[i]);
			rs.setClid(client.getId());
			rs.setLogid(log.getId());
			rs.setState(0);
			rs.setType(ResultType.rt27);
			int rid=(Integer)sm.insert("ad_result", rs);
			//添加指令记录
			//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
			
			//if(client.getZxstate()==1){
			if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
					}
			}
				
			//}
			
        	
        }
		
		return SUCCESS;
	}

	public int getDisabledstate() {
		return disabledstate;
	}

	public void setDisabledstate(int disabledstate) {
		this.disabledstate = disabledstate;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}


}
