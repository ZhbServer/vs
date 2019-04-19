package com.vshow.control.api.test.treasure;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Treasure;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.protocol.ProtocolUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class RevokedTreasureClientAction extends ActionSupport {
	
	private String tids;    //节目id
	private String clientids;  //终端id
	private String cgids;       //终端分组id多个以"_"分割
	@Override
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		HashSet<Integer> tmidsset = new HashSet();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "totreasurelist.vs");		
		int uid = (Integer) session.get("urid");
		
		/**获取所有终端**/
		if (cgids != null && !"".equals(cgids)) {
			
			String[] cgids_s = cgids.split("\\_");
			ClientGroupRelation cgr;
			/** 获取用户下的所有终端**/
			for (int i = 0; i < cgids_s.length; i++) {
				
				cgr=new ClientGroupRelation();
				cgr.setUid(uid);
				cgr.setGid(Integer.parseInt(cgids_s[i].trim().split("\\,")[0]));
				cgr.setGtype(Integer.parseInt(cgids_s[i].trim().split("\\,")[1]));
				List terms = sm.queryForList("sel_cgr_gid_uid_by_gtype",cgr);
				for (int j = 0; j < terms.size(); j++) {
				
					tmidsset.add(Integer.parseInt(terms.get(j)+""));
					
				}
			}
		}
        if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\_");
			for (int i = 0; i < tids_s.length; i++) {
				tmidsset.add(Integer.parseInt(tids_s[i]));
			}
		}
        
        
		
		Protocol protocol=new Protocol(); 
		protocol.setType(ProtocolType.TYPE79);
		String tname="宝箱撤销";
		
		/*TreasurePlay tp=new TreasurePlay();		
		Treasure tre=new Treasure();
		tre=(Treasure) sm.queryForObject("go_treasure_info",Integer.parseInt(tids));//获取宝箱信息
		tp.setOnTime(tre.getOnTime());
		tp.setOffTime(tre.getOffTime());
		tp.setTreasureHeight(tre.getTreasureHeight());
		tp.setTreasureWidth(tre.getTreasureWidth());
		tp.setCode(tre.getCode());
		tp.setSkipImg(tre.getSkipImg());
		tp.setUrl(tre.getUrl());
		tp.setItemName(tre.getItemFileName());
		tp.setStyleImg(tre.getStyleImg());
		tp.setTreasureInsideType(tre.getTreasureInsideType());//宝箱内容类型 1 二维码、2 url、 3 图片、 4 节目
		tp.setShowTime(tre.getShowTime());		
		tp.setImgHeight(tre.getImgHeight());
		tp.setImgWidth(tre.getImgWidth());
		protocol.setProtocolPlayBaseList(tp);
		protocol.setTreasureInsideType(tre.getTreasureInsideType());
		String downcmd = "";
				
		if (tre.getCode()!=null&&!tre.getCode().equals("")) {			
			downcmd = tre.getCode();
		} 
		if (tre.getSkipImg()!=null&&!tre.getSkipImg().equals("")) {
			downcmd = tre.getSkipImg();
		}
				
		if (tre.getStyleImg()!=null&&!tre.getStyleImg().equals("")){
			
			downcmd = tre.getStyleImg() + "|" + downcmd;
		}
		
		//下载资源
		List<ProtocolDownResource> protocolDownResourceList=ProtocolUtil.getProtocolDownResourceList(downcmd);		
		protocol.setProtocolDownResourceList(protocolDownResourceList);
		*/
		
						
					
			Log log = LogHandle.insertTheLogSend(LogType.type118, uid,
					tname, 2);

			String sendkey = log.getSendkey();
			
			protocol.setSendkey(sendkey);
			
			JSONObject jsonObject = JSONObject.fromObject(protocol);
     	
			String msg=jsonObject.toString();
			System.out.println(msg);
			
			String msg0818=Constant.sendDownString(msg, sendkey,null);			
			log.setMsg(msg);
			System.out.println(msg0818);
			sm.update("upd_log_send_msg", log);
			
			Client client;
			MyMsg mymsg;

			/** 发送给终端 **/
			for (Integer cid : tmidsset) {
				client = (Client) sm.queryForObject("sel_client_byid", cid);				
				/** 添加指令记录 **/				
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

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}

	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

	public String getCgids() {
		return cgids;
	}

	public void setCgids(String cgids) {
		this.cgids = cgids;
	}
	
	
}
