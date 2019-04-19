package com.vshow.control.client.set;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;

public class AddClientAction implements Action {
	private int cgid;
	private int gtype;
	private String cname;
	private String cip;
	private String cmark;
	private String info;
	public String execute() throws Exception {
		 
		 
		String result_suc="success";
		if(Constant.lType.equals("1")){
			result_suc="netsuccess";
			//认证
			String param="username="+Constant.lUsername+"&password="+Constant.lPassword+"&cmarks="+cmark;
			String result_con=HttpRequest.sendPost(Constant.NetJmAddUrl, param);
			
			Map resultMap=JsonHelper.toMap(result_con); 
			String code=(String)resultMap.get("code");
			if(code==null){
				//认证未通过[软加密]
				System.out.println(Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]");
				info=Constant.LOCAL.getA00507()+ "["+Constant.LOCAL.getA00506()+"]";
			}else{
				if (code.equals("100001")){
				    //验证失败(账号或者密码不对)
					System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
					info=Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]";
				}else{
					
					if(code.equals("100002")){
						//使用点位数超出总点位数	
						System.out.println(Constant.LOCAL.getA00513()+ "["+Constant.LOCAL.getA00506()+"]");
						info=Constant.LOCAL.getA00508()+ "["+Constant.LOCAL.getA00506()+"]";
						
					}else if(code.equals("100003")){
						
						 SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
						 User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id", urid);
						 Client client = new Client();
						 client.setName(cname);
						 client.setMark(cmark);
						 client.setIp(cip);
						 //client.setLast(sFormat.format(new Date()));
						 client.setLast("");
						 client.setServerid(0);
						 client.setDownstate("0");
						 client.setSize("");
						 client.setNvn(0);
						 client.setUid(urid);
						 client.setNetstate(1);
						 Integer cid=(Integer)SqlConnect.getSqlMapInstance().insert("add_client", client);
						 
						 ClientGroupRelation cgr = new ClientGroupRelation();
						 cgr.setCid(cid);
						 cgr.setGid(cgid);
						 cgr.setGtype(gtype);
						 cgr.setUid(urid);
						 
						 SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
						
						 LogHandle.insertTheLog(LogType.type53, urid,Constant.LOCAL.getB00012()+":" +cname, 1,1);
						 
						System.out.println(Constant.LOCAL.getA00509()+ "["+Constant.LOCAL.getA00506()+"]");
						info=Constant.LOCAL.getA00509()+ "["+Constant.LOCAL.getA00506()+"]";
						
						//获取总点位
						String netCountStr =(String)resultMap.get("netCount");
						//获取使用点位
						String surCountStr =(String)resultMap.get("surCount"); 
						
						Constant.NetCountStr=netCountStr;
						
						Constant.NetSurCountStr=surCountStr;
						
						//录入成功
						String themark = client.getMark();
						if (themark.length() == 17) {
							Mlt msgList = new Mlt();
							msgList.ip = client.getIp();
							Constant.messageMap.put(themark, msgList);
						}
						
						
					}
				}
			}
			
			
			
		} else{
			 SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
			 User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_user_all_id", urid);
			 Client client = new Client();
			 client.setName(cname);
			 client.setMark(cmark);
			 client.setIp(cip);
			 //client.setLast(sFormat.format(new Date()));
			 client.setLast("");
			 client.setServerid(0);
			 client.setDownstate("0");
			 client.setSize("");
			 client.setNvn(0);
			 client.setUid(urid);
			 client.setNetstate(0);
			 Integer cid=(Integer)SqlConnect.getSqlMapInstance().insert("add_client", client);
			 
			 ClientGroupRelation cgr = new ClientGroupRelation();
			 cgr.setCid(cid);
			 cgr.setGid(cgid);
			 cgr.setGtype(gtype);
			 cgr.setUid(urid);
			 
			 SqlConnect.getSqlMapInstance().insert("add_cgr", cgr);
			
			 LogHandle.insertTheLog(LogType.type53, urid,Constant.LOCAL.getB00012()+":" +cname, 1,1);
			 
			if (Constant.messageMap.size() >= Constant.G4) {
			    
			} else {
					String themark = client.getMark();
					if (themark.length() == 17) {
						
						Mlt msgList = new Mlt();
						msgList.ip = client.getIp();
						Constant.messageMap.put(themark, msgList);
						
						//更新终端在线状态
						if(VSNettyChannelMap.get((themark))==null){
							
						}else{
							//更新终端在线状态
							Client tc=new Client();
							tc.setMark(themark);
							tc.setZxstate(1);
							SqlConnect.getSqlMapInstance().update("update_client_zxstate_mark", tc);
						}
					}
			}
			
		}
	
			
		 return result_suc;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getCgid() {
		return cgid;
	}

	public void setCgid(int cgid) {
		this.cgid = cgid;
	}

	public int getGtype() {
		return gtype;
	}

	public void setGtype(int gtype) {
		this.gtype = gtype;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCip() {
		return cip;
	}

	public void setCip(String cip) {
		this.cip = cip;
	}

	public String getCmark() {
		return cmark;
	}

	public void setCmark(String cmark) {
		this.cmark = cmark;
	}
}
