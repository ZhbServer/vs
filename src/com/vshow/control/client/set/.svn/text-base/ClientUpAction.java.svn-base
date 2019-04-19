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
import com.vshow.control.tool.VVersion;


public class ClientUpAction implements Action {
	
	private int cid;
	private String cname;
	
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		int uid = (Integer) session.get("urid");
		
		Client upc=new Client();
		
		upc.setName(cname);
		
		upc.setId(cid);
		
		sm.update("update_client_name", upc);
		
		//发送 给终端 远程修改
		if(VVersion.le_fbclientname==0){
			
			Log log = LogHandle.insertTheLogSend(LogType.type93, uid,Constant.LOCAL.getA00767()+":"+cname,1);
			
			String sendkey = log.getSendkey();
			
			String msg = "48+sendkey!" + sendkey + "%" + cname;
			
			log.setMsg(msg);
			
			sm.update("upd_log_send_msg", log);
			
			Result rs = new Result();
			
			MyMsg mymsg;
			
			Client client=(Client)sm.queryForObject("sel_client_byid", cid);
			
			rs.setClid(client.getId());
			rs.setLogid(log.getId());
			rs.setState(0);
			rs.setType(ResultType.rt26);
			int rid=(Integer)sm.insert("ad_result", rs);
			//添加指令记录
			//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
			
			//if(client.getZxstate()==1){
				
				if (client.getServerid() == 0) {
					
					Mlt mt = Constant.messageMap.get(client.getMark());
					
					if (mt != null) {
						
						mymsg = new MyMsg();
						mymsg.msg = msg;
						mymsg.fbType=ResultType.rt26;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
					
					}
				}
				
			//}
			
		}
		return SUCCESS;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	

}
