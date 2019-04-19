package com.vshow.control.client.set;

import java.io.FileOutputStream;
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
import com.vshow.control.count.CountPeople;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ClientPeopleCode;
import com.vshow.control.data.Log;
import com.vshow.control.data.Notice;
import com.vshow.control.data.Result;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendNotice;
import com.vshow.control.data.VoiceBroadcast;
import com.vshow.control.data.client.interact.ResourceData;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolPeopleCountType;
import com.vshow.control.protocol.ProtocolPlay;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.protocol.ProtocolVoiceBroadcast;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbPeopleCountTypeAction extends ActionSupport {

	private String clientids; // 终端id多个以"_"分割
	private int peopleCountType;  //0关闭   1人脸识别  2红外感应
	
	private String info;

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
		
		
		
		//验证人脸识别
		if(peopleCountType==1){
			
			//获取终端列表传入到改狗服务器
			String cIds="";
			for (Integer cid : tmidsset) {
				
					if(cIds.length()==0){
						cIds=cid+"";
					}else{
						cIds+=","+cid;
					}
			}
			List<String>  marksList=SqlConnect.getSqlMapInstance().queryForList("sel_client_mark_cIds", cIds);
					
			ResourceData  rd=new ResourceData();
			
			rd.setUsername(Constant.lUsername);
			
			rd.setPassword(Constant.lPassword);
			
			rd.setMarks(marksList);
			
			//获取用户名   加密后的密码
			JSONObject jsonObject = JSONObject.fromObject(rd);
		
			//拼接参数,请求
			String param="resourceDataJson="+jsonObject.toString();
			
			String content=HttpRequest.sendPost(Constant.NetJmPeopleFaceFbUrl, param);
			
			//解析返回内容
			if(content==null){
				//解析失败
				info="解析失败2";
				return "success4";
			}else{
				try{
					jsonObject = JSONObject.fromObject(content);
				}catch (Exception e) {
					// TODO: handle exception
					info="解析失败3[请求地址错误]";
					return "success4";
				}
				
				
				ResourceData resourceData=(ResourceData)JSONObject.toBean(jsonObject, ResourceData.class);
				
				if(resourceData!=null){
					//System.out.println(resourceData.getCode());
					
					//System.out.println(resourceData.getContent());
					
					// 00000 认证成功      00001点位不够无法认证      00002已经认证
                    // 00003 账户或者密码不合法      00004 参数不合法
                    // 00005 当前用户人脸识别 未分配点位
                    // 00006 终端认证失败 
					
                    if(resourceData.getCode().equals("00000")){
						
					}else{
						if(resourceData.getCode().equals("00001")){
							info=Constant.LOCAL.getB00152();
						}else if(resourceData.getCode().equals("00003")){
							info=Constant.LOCAL.getB00154();
						}else if(resourceData.getCode().equals("00004")){
							info=Constant.LOCAL.getB00155();
						}else if(resourceData.getCode().equals("00005")){
							info=Constant.LOCAL.getB00156();
						}
						
						return "success4";
					}
				}else{
					//解析失败2
					info="解析失败2";
					return "success4";
				}
				
			}
			
			
			
			
		}

		
		
		
		
		Protocol protocol=new Protocol(); 
		protocol.setType(ProtocolType.TYPE55);
		//List<ProtocolPlayBase>  protocolPlayBaseList=new ArrayList<ProtocolPlayBase>();//人数统计类型
		ProtocolPeopleCountType protocolPeopleCountType;
		String tname=local.getB00111();
		
		if(peopleCountType==0){
			tname=tname+":"+local.getA00020();
		}else if(peopleCountType==1){
			tname=tname+":"+local.getB00112();
		}else if(peopleCountType==2){
			tname=tname+":"+local.getB00113();
		}
		
		protocolPeopleCountType=new ProtocolPeopleCountType();
		protocolPeopleCountType.setPeopleCountType(peopleCountType);
		//protocolPlayBaseList.add(protocolPeopleCountType);
		

		protocol.setProtocolPlayBaseList(protocolPeopleCountType);
		
			
		   Client client;
		   int rid;
			/** 判断用户有没有发送权限(0.需审核 1.已审核.2节目需审核3.发布需审核) **/
			if (uocheck == 0 || uocheck == 3) {
		

			} else if (uocheck == 1 || uocheck == 2) {

				Log log = LogHandle.insertTheLogSend(LogType.type100, uid,
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
					// sm.delete("del_one_senditem", client.getId());
					rs.setClid(client.getId());
					rs.setLogid(log.getId());
					rs.setState(0);
					rs.setType(ResultType.rt32);
					rid = (Integer) sm.insert("ad_result", rs);
					
					/** 添加指令记录 **/
					if(peopleCountType==1||peopleCountType==0){
						
						ClientPeopleCode cpc=(ClientPeopleCode)SqlConnect.getSqlMapInstance().queryForObject("sel_client_people_code_mark", client.getMark());
						String code="";
						if(peopleCountType==1){
							code="00009";
						}else if(peopleCountType==0){
							code="00010";
						}
						
						if(cpc==null){
							
							cpc=new ClientPeopleCode();
						    cpc.setMark(client.getMark());
							cpc.setCode(code);
							SqlConnect.getSqlMapInstance().insert("add_client_people_code", cpc);
						}else{
							cpc.setMark(client.getMark());
							cpc.setCode(code);
							SqlConnect.getSqlMapInstance().update("up_client_people_code", cpc);
						}
					}
				
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



	public int getPeopleCountType() {
		return peopleCountType;
	}

	public void setPeopleCountType(int peopleCountType) {
		this.peopleCountType = peopleCountType;
	}

	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

	
	
}
