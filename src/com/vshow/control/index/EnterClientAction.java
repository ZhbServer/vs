package com.vshow.control.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ClientNumber;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class EnterClientAction extends ActionSupport {
	private String qx[];
    private String info;
    
    private String openIntro; 
	public String getOpenIntro() {
		return openIntro;
	}

	public void setOpenIntro(String openIntro) {
		this.openIntro = openIntro;
	}

	@Override
	public String execute() throws Exception {
 
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		
		String urtkey=(String)session.get("urtkey");
	    String urtkeys[]=urtkey.split("\\\\_");
		
		Local local= (Local) session.get("local");
		String marks = "";
		ClientGroupRelation cgr;
		
		if(Constant.lType.equals("1")){
			String netmarks="";
			for (int i = 0; i < qx.length; i++) {
				 
				String mark = (String) SqlConnect.getSqlMapInstance()
						.queryForObject("s_ajkdd_ip", Integer.parseInt(qx[i].split("\\_")[0]));
				if (!mark.isEmpty()) {
					
					if(netmarks.length()==0){
						if(mark.trim().length()>0){
							netmarks=mark.trim();
						}
					}else{
						if(mark.trim().length()>0){
							netmarks=netmarks+","+mark.trim();
						}
					}
				}
			}
			
			//认证
			String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+netmarks;
			String result_con=HttpRequest.sendPost(Constant.NetJmAddUrl, param);
			
			Map resultMap=JsonHelper.toMap(result_con); 
			String code=(String)resultMap.get("code");
			info=code;
			if(code==null){
				//认证未通过[软加密]
				System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
				
			}else{
				if (code.equals("100001")){
				    //验证失败(账号或者密码不对)
					System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
					
				}else{
					
					if(code.equals("100002")){
						//使用点位数超出总点位数	
						System.out.println(Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]");
						
						
					}else if(code.equals("100003")){
						
						
						//获取总点位
						String netCountStr =(String)resultMap.get("netCount");
						//获取使用点位
						String surCountStr =(String)resultMap.get("surCount"); 
						
						Constant.NetCountStr=netCountStr;
						
						Constant.NetSurCountStr=surCountStr;
						
						for (int i = 0; i < qx.length; i++) {
							int clid=0;
							String mark = (String) SqlConnect.getSqlMapInstance()
									.queryForObject("s_ajkdd_ip", Integer.parseInt(qx[i].split("\\_")[0]));
							if (!mark.isEmpty()) {
								List list = SqlConnect.getSqlMapInstance().queryForList("sel_client_bymark",
										mark.trim());
								if (list.size() == 0) {
									marks += " " + mark;
									Client cll = new Client();
									cll.setIp(local.getA00411());
									cll.setMark(mark.trim());
									cll.setName(qx[i].split("\\_")[1]);
									cll.setServerid(0);
									cll.setUid(urid);
									cll.setNvn(1);
									cll.setNetstate(1);
									SqlConnect.getSqlMapInstance().insert("add_client2", cll);
									clid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
											"sel_client_bymark", mark);
									cgr = new ClientGroupRelation();
									cgr.setCid(clid);
									cgr.setUid(urid);
									cgr.setGtype(0);
									cgr.setGid(0);
									SqlConnect.getSqlMapInstance().delete("del_cgr_cid", clid);
									//记录终端编号 为null
									ClientNumber cn=new ClientNumber();
									cn.setClientid(clid);
									cn.setNumber(qx[i].split("\\_")[2].trim());
									SqlConnect.getSqlMapInstance().insert("insert_client_number", cn);
									
									SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
									//上级添加
								    for (int j = 0; j < urtkeys.length-1; j++) {
										if(Integer.parseInt(urtkeys[j])!=urid){
											
											cgr = new ClientGroupRelation();
											cgr.setCid(clid);
											cgr.setUid(Integer.parseInt(urtkeys[j]));
											cgr.setGtype(0);
											cgr.setGid(0);
											SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
											
											
										}
									}
								 
								}
				                
								//SqlConnect.getSqlMapInstance().update("up_allmark", mark);
								
								SqlConnect.getSqlMapInstance().delete("del_allmark_mark", mark);
								SqlConnect.getSqlMapInstance().delete("del_allmark_mark_name", mark);
								
								//if (Constant.messageMap.size() < Constant.G4) {
									if (Constant.messageMap.get(mark) == null) {
										Mlt msgList = new Mlt();
										Constant.messageMap.put(mark, msgList);
									}
									//更新终端在线状态
									if(VSNettyChannelMap.get((mark))==null){
										
									}else{
										//更新终端在线状态
										Client tc=new Client();
										tc.setMark(mark);
										tc.setZxstate(1);
										SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
									}
									
									//发送修改终端名称
									//发送 给终端 远程修改
									if(VVersion.le_fbclientname==0){
										
										Log log = LogHandle.insertTheLogSend(LogType.type93, urid,Constant.LOCAL.getA00767()+":"+qx[i].split("\\_")[1],1);
										
										String sendkey = log.getSendkey();
										
										String msg = "48+sendkey!" + sendkey + "%" + qx[i].split("\\_")[1];
										
										log.setMsg(msg);
										
										SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
										
										Result rs = new Result();
										
										HashMap hm = new HashMap();
										
										String vlu;
										
										String fzmsg;
										
										MyMsg mymsg;
										
										Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", clid);
										
										rs.setClid(client.getId());
										rs.setLogid(log.getId());
										rs.setState(0);
										rs.setType(ResultType.rt26);
										int rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);
										//添加指令记录
										//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
										
										if(client.getZxstate()==1){
											
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
											
										}
										
									}
									
									
								//}

							}
						}
						LogHandle.insertTheLog(LogType.type40, urid, Constant.LOCAL.getA00412()+":" + marks,1,1);
					}
				}		
			}
		}else{
			for (int i = 0; i < qx.length; i++) {
				int clid =0;
				String mark = (String) SqlConnect.getSqlMapInstance()
						.queryForObject("s_ajkdd_ip", Integer.parseInt(qx[i].split("\\_")[0]));
				if (!mark.isEmpty()) {
					List list = SqlConnect.getSqlMapInstance().queryForList("sel_client_bymark",
							mark);
					if (list.size() == 0) {
						marks += " " + mark;
						Client cll = new Client();
						cll.setIp(local.getA00411());
						cll.setMark(mark.trim());
						cll.setName(qx[i].split("\\_")[1]);
						cll.setServerid(0);
						cll.setUid(urid);
						cll.setNvn(0);
						cll.setNetstate(0);
						SqlConnect.getSqlMapInstance().insert("add_client2", cll);
						 clid = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
								"sel_client_bymark", mark);
						cgr = new ClientGroupRelation();
						cgr.setCid(clid);
						cgr.setUid(urid);
						cgr.setGtype(0);
						cgr.setGid(0);
						SqlConnect.getSqlMapInstance().delete("del_cgr_cid", clid);
						SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
						
						
						
						//上级添加
					    for (int j = 0; j < urtkeys.length-1; j++) {
							if(Integer.parseInt(urtkeys[j])!=urid){
								
								cgr = new ClientGroupRelation();
								cgr.setCid(clid);
								cgr.setUid(Integer.parseInt(urtkeys[j]));
								cgr.setGtype(0);
								cgr.setGid(0);
								
								SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
								
								
							}
						}
					    
					 
					}
	                
					//SqlConnect.getSqlMapInstance().update("up_allmark", mark);
					SqlConnect.getSqlMapInstance().delete("del_allmark_mark", mark);
					SqlConnect.getSqlMapInstance().delete("del_allmark_mark_name", mark);
					
					
					if(Constant.lType.equals("2")){
                        
						String themark=(String)Constant.vsLicensesMap.get(mark);
						
						if(themark!=null){
							
							if (Constant.messageMap.get(mark) == null) {
								Mlt msgList = new Mlt();
								Constant.messageMap.put(mark, msgList);
							}
							//更新终端在线状态
							if(VSNettyChannelMap.get((mark))==null){
								
							}else{
								//更新终端在线状态
								Client tc=new Client();
								tc.setMark(mark);
								tc.setZxstate(1);
								SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
							}
						
						}
						
					}else{
						
						if (Constant.messageMap.size() < Constant.G4) {
							
							if (Constant.messageMap.get(mark) == null) {
								Mlt msgList = new Mlt();
								Constant.messageMap.put(mark, msgList);
							}
							//更新终端在线状态
							if(VSNettyChannelMap.get((mark))==null){
								
							}else{
								//更新终端在线状态
								Client tc=new Client();
								tc.setMark(mark);
								tc.setZxstate(1);
								SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
							}
						}
						
					}
					
			

				}
				
				
				//发送修改终端名称
				//发送 给终端 远程修改
				if(VVersion.le_fbclientname==0){
					
					Log log = LogHandle.insertTheLogSend(LogType.type93, urid,Constant.LOCAL.getA00767()+":"+qx[i].split("\\_")[1],1);
					
					String sendkey = log.getSendkey();
					
					String msg = "48+sendkey!" + sendkey + "%" + qx[i].split("\\_")[1];
					
					log.setMsg(msg);
					
					SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
					
					Result rs = new Result();
					
					HashMap hm = new HashMap();
					
					String vlu;
					
					String fzmsg;
					
					MyMsg mymsg;
					
					Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", clid);
					
					rs.setClid(client.getId());
					rs.setLogid(log.getId());
					rs.setState(0);
					rs.setType(ResultType.rt26);
					int rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", rs);
					//添加指令记录
					//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
					
					if(client.getZxstate()==1){
						
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
						
					}
					
				}
			}
			LogHandle.insertTheLog(LogType.type40, urid, Constant.LOCAL.getA00412()+":" + marks,1,1);
			
		}
		

		return SUCCESS;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String[] getQx() {
		return qx;
	}

	public void setQx(String[] qx) {
		this.qx = qx;
	}

	
}
