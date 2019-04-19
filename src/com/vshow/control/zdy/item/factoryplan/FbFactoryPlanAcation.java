package com.vshow.control.zdy.item.factoryplan;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.FactoryPlanItem;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolFactoryPlay;
import com.vshow.control.protocol.ProtocolPlay;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.protocol.ProtocolUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbFactoryPlanAcation implements Action {

	private int fid;


	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		Local local= (Local) session.get("local");
	
		List<FactoryPlanItem> fpilist = (List<FactoryPlanItem>)SqlConnect.getSqlMapInstance().queryForList("sel_factoryplan_items_fid",fid);
		
		for (int i = 0; i < fpilist.size(); i++) {
			
			FactoryPlanItem fpi = fpilist.get(i);
			
			String ts = "" + fpi.getFilenames();
			
			String fileNames[]=fpi.getFilenames().split("\\,");
			List<ProtocolFactoryPlay> pfpList=new ArrayList<ProtocolFactoryPlay>();
			ProtocolFactoryPlay pcp;
			for (int j = 0; j < fileNames.length; j++) {
				
				pcp=new ProtocolFactoryPlay();
				pcp.setPlayFileName(fileNames[j]);
				pfpList.add(pcp);
				
			}
			
			String tname = local.getA01043()+":" + fpi.getFilenames();
			Log log = LogHandle.insertTheLogSend(LogType.type103, uid,tname,1);
			String sendkey = log.getSendkey();
			
			
			Protocol protocol=new Protocol(); 
			protocol.setType(ProtocolType.TYPE57); 
			
			
			protocol.setSendkey(sendkey);
			protocol.setProtocolPlayBaseList(pfpList);
			
			
			//根据fid查找节目
			Integer iid=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_factoryplanitem_relation_iid", fid);
			
			if(iid!=null){
				
				Scene se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id",iid);
				String cmd = se.getFilename();
				String downcmd = se.getFilename() + ".zip";
				String playFileName="";
			
			    if (se.getVname().length() > 0
							&& (se.getVname().indexOf(':') == -1)) {
						downcmd += "|" + se.getVname();
				}
			    
			    String msgTemp = "020/"+downcmd+"+sendkey!"+ LogHandle.createSendKey()+"%playlist!"+cmd;
			    
			    Protocol protocolTemp=ProtocolUtil.protocolAnalysisMsg(msgTemp, 2); 
			    
			    protocol.setProtocolDownResourceList(protocolTemp.getProtocolDownResourceList());
			    
			    protocol.setPlayType("playlist");
			    
			    List<ProtocolPlay>  protocolPlayList=new ArrayList<ProtocolPlay>();
			    
			    ProtocolPlay pplay=new ProtocolPlay();
 				
			    List<String> pplayPlayLists = new ArrayList<String>();   //播放列表
 				
 				pplayPlayLists.add(cmd);
 				
 				pplay.setPlayList(pplayPlayLists);
 				
 				protocolPlayList.add(pplay);
 				
 				protocol.setProtocolPlayList(protocolPlayList);
 				
 				protocol.setProtocolPlayStitching(cmd);
 				
			    //mymsg = new MyMsg();
				//mymsg.msg = msgTemp;
				//mymsg.sendkey = "";
				//mt.allmsg.add(mymsg);
			  }
			
			
			JSONObject jsonObject = JSONObject.fromObject(protocol);
	     	
			String msg=jsonObject.toString();
			
			String msg0818=Constant.sendDownString(msg, sendkey,null);
			
			
			
			//String msg = "103+sendkey!" + sendkey + "%" + ts;
			log.setMsg(msg);
			sm.update("upd_log_send_msg", log);
			Result rs = new Result();
			MyMsg mymsg;
			Client client;
			// 发送给终端
			client=(Client)sm.queryForObject("sel_client_byid", fpi.getCid());
			rs.setClid(client.getId());
			rs.setLogid(log.getId());
			rs.setState(0);
			rs.setType(ResultType.rt35);
			sm.insert("ad_result", rs);
			
			if (client.getServerid() == 0) {
				Mlt mt = Constant.messageMap.get(client.getMark());
				if (mt != null) {
					
					mymsg = new MyMsg();
					mymsg.msg = msg0818;
					mymsg.sendkey = log.getSendkey();
					mt.allmsg.add(mymsg);
				}
			}
			
		}

		
		return SUCCESS;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}
	
}
