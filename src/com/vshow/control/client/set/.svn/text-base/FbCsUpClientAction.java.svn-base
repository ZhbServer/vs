package com.vshow.control.client.set;

import io.netty.channel.ChannelHandlerContext;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.NettyChannel;
import com.vshow.control.tool.NettyChannelUtil;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class FbCsUpClientAction implements Action {
	private File gx;
	private String gxFileName;
	private String clientids;  //终端id多个以"_"分割
	private String cgids;       //终端分组id多个以"_"分割
	private String apkfilename;  //更新filenameapk

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		Local local= (Local) session.get("local");
		HashSet<Integer> tmidsset = new HashSet();
	
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
		if(tmidsset.size()>0){
			
			if(VVersion.le_clientdisabled==0){
				int  disabled=Constant.checkDisabledClient(tmidsset);
				
				if(disabled==1){
					
					return "success3"; 
				}	
				
			 }
			
			gxFileName=apkfilename;
			
			gxFileName = gxFileName.trim();
			
			File updateFile=new File(Constant.FILES+File.separator+gxFileName);
			
			long apklength=updateFile.length();
			
			//File updateFile=new File(Constant.FILES + File.separator + gxFileName);
			
            //if(FileHandle.fileExists(Constant.FILES + File.separator + gxFileName)==0){
				
			//	gx.renameTo(new File(Constant.FILES + File.separator + gxFileName));
				
			//}else{
				
			//}
			
			
		    // new File(Constant.FILES + File.separator + gxFileName).delete();
			//File updateFile=new File(Constant.FILES + File.separator + gxFileName);
			//gx.renameTo(updateFile);

			HashMap hm = new HashMap();
			String mark;
			
			String fileMd5=MD5Util.getMd5ByFile(updateFile);
		
			Log log = LogHandle.insertTheLogSend(LogType.type34, uid,local.getA00471(),1);
			
			String sendkey = log.getSendkey();
			
			String msg = "10"+apklength+"/"+gxFileName+"+"+sendkey;
			
			log.setMsg(msg);
			sm.update("upd_log_send_msg", log);
			String fzmsg;
			String vlu;
			Result rs = new Result();
			MyMsg mymsg;
			Client client;
			// 发送给终端
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("fileMd5", fileMd5);
			map.put("apklength", apklength);
			map.put("gxFileName", gxFileName);
			String msg0818=Constant.sendDownString(msg, sendkey,map);
            
			for (Integer cid : tmidsset) {
				client=(Client)sm.queryForObject("sel_client_byid", cid);
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt7);
				int rid=(Integer)sm.insert("ad_result", rs);
				//添加指令记录
				//Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				
				if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						ChannelHandlerContext ccontext=VSNettyChannelMap.get(client.getMark());
						int code=0;
						if(ccontext!=null){
							NettyChannel nettyChannel=NettyChannelUtil.getChannelHandlerContextNettyChannel(ccontext); 
							if(nettyChannel!=null){
								if(nettyChannel.getCode()==3){
									code=3;
								}
							}else{
								
							}
						}
						
						if(code==3){
							mymsg.msg = msg0818;
						}else{
							mymsg.msg = msg;
						}
						
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



	public File getGx() {
		return gx;
	}



	public void setGx(File gx) {
		this.gx = gx;
	}



	public String getGxFileName() {
		return gxFileName;
	}



	public void setGxFileName(String gxFileName) {
		this.gxFileName = gxFileName;
	}



	public String getApkfilename() {
		return apkfilename;
	}



	public void setApkfilename(String apkfilename) {
		this.apkfilename = apkfilename;
	}



	
	

}
