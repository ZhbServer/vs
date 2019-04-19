package com.vshow.control.item.fb;

import io.netty.channel.ChannelHandlerContext;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.DpSend;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendDate;
import com.vshow.control.data.SendInteract;
import com.vshow.control.data.SendTime;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.NettyChannel;
import com.vshow.control.tool.NettyChannelUtil;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;

public class ResendAction implements Action {

	
	private int qx[];
	private int rlid;
	
    @Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		//获取发布的日志信息
		Log olog=(Log)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_all_id", rlid);;
		
		if(olog!=null){
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
			String date = sf.format(new Date());
			olog.setSdate(date);
			olog.setSendkey(Constant.createSendkey(uid,date));
			olog.setUrid(uid);
			int logid = (Integer)SqlConnect.getSqlMapInstance().insert("add_log_send",olog);
			olog.setId(logid);
			//System.out.println(olog.getMsg());
			//String osendkey=Constant.resolveSendkey(olog.getMsg());
			
			int skl_b=olog.getMsg().indexOf("sendkey!");
	        if(skl_b==-1){
	       	    skl_b=olog.getMsg().indexOf("+")+1;
	        }else{
	       	    skl_b=skl_b+8;
	        }
	        int skl_e=olog.getMsg().length();
	        
	        String nsk=olog.getMsg().substring(skl_b, skl_e);
	        
	        if(olog.getStype()==20){
	        	skl_e=nsk.indexOf("#");
		       	  
	 	        if(skl_e!=-1){
	 	      	  nsk=nsk.substring(0, skl_e);
	 	        }
	        }else{
	        	skl_e=nsk.indexOf("%");
		       	  
	 	        if(skl_e!=-1){
	 	      	  nsk=nsk.substring(0, skl_e);
	 	        }
	        	
	        }	
	        	
	        JSONObject  jsonObject;
	        Protocol protocol;
	        String msg;
			switch (olog.getStype()) {
            case 100:
			case 101:
		    case 104:
		    case 114:
		    	
				jsonObject= JSONObject.fromObject(olog.getMsg()); 
				protocol=(Protocol)JSONObject.toBean(jsonObject,Protocol.class);
				protocol.setSendkey(olog.getSendkey());
				
				jsonObject = JSONObject.fromObject(protocol);
		     	
				msg=jsonObject.toString();
				
				olog.setMsg(msg);
				break;

			default:
				olog.setMsg(olog.getMsg().replaceAll(nsk, olog.getSendkey()));
				break;
			}
			
			
			
			SqlConnect.getSqlMapInstance().update("upd_log_send_msg", olog);
			
			int rid;
			Result oresult;
			
			MyMsg mymsg;
			for (int i = 0; i < qx.length; i++) {
				//获取rid对象
				oresult=(Result)SqlConnect.getSqlMapInstance().queryForObject("sel_result_all_id", qx[i]);
				if(oresult!=null){
					int orid=oresult.getId();
					//插入新的result结果
					oresult.setState(0);
					oresult.setLogid(olog.getId());
					rid=(Integer)SqlConnect.getSqlMapInstance().insert("ad_result", oresult);
					//获取终端信息
					Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", oresult.getClid());
					//判断result类型
					String msg0818;
					if(oresult.getType()==1||oresult.getType()==2||oresult.getType()==16||oresult.getType()==17||oresult.getType()==18||oresult.getType()==23){
						//发送给终端
			            msg0818=Constant.sendDownString(olog.getMsg(), olog.getSendkey(),null);
			            String itemids="";
			            int type=1;
			            //普通发布
			            if(oresult.getType()==1){
			            	Send sd=(Send)SqlConnect.getSqlMapInstance().queryForObject("sel_send_all_id",orid);
			            	sd.setResultid(rid);
			            	itemids=sd.getItemids();
			            	SqlConnect.getSqlMapInstance().insert("ad_send",sd);
			            	type=1;
			            }else if(oresult.getType()==2){
			            	SendInteract sd=(SendInteract)SqlConnect.getSqlMapInstance().queryForObject("sel_send_interact_all_id",orid);
			            	sd.setResultid(rid);
			            	itemids=sd.getInteractitemid()+"";
			            	SqlConnect.getSqlMapInstance().insert("insert_one_sendinteractitem",sd);
			            	type=2;
			            }else if(oresult.getType()==16){
			            	SendTime sd =(SendTime)SqlConnect.getSqlMapInstance().queryForObject("sel_send_time_all_id",orid);
			            	itemids=sd.getItemid();
			            	SqlConnect.getSqlMapInstance().insert("insert_one_timeitem",sd);
			            	type=1;
			            }else if(oresult.getType()==17){
			            	InsertSend sd =(InsertSend)SqlConnect.getSqlMapInstance().queryForObject("sel_send_insert_all_id",orid);
			            	itemids=sd.getItemid();
			            	SqlConnect.getSqlMapInstance().insert("insert_one_insertitem",sd);
			            	type=1;
			            }else if(oresult.getType()==18){
			            	DpSend sd =(DpSend)SqlConnect.getSqlMapInstance().queryForObject("sel_send_dp_all_id",orid);
			            	itemids=sd.getItemid();
			            	SqlConnect.getSqlMapInstance().insert("insert_one_dpitem",sd);
			            	type=1;
			            }else if(oresult.getType()==23){
			            	//SendDate sd =(SendDate)SqlConnect.getSqlMapInstance().queryForObject("sel_send_dp_all_idz",orid);
			            	//itemids=sd.getItemids();
			            	//SqlConnect.getSqlMapInstance().insert("ad_send_date",sd);
			            	//type=1;
			            }
			            ClientPlayHandle.insertClientPlay(itemids, type, oresult.getType(), olog.getContent(), olog.getUrid(), client.getMark(), olog.getSendkey(), 0);
			            
					} else if(oresult.getType()==7){
						    //System.out.println(olog.getMsg());
						     //1073015/port.apk+2017-05-12-16:26:18-1-1829
						    String msginfo=olog.getMsg();
						    
						    String apklength=msginfo.split("\\/")[0].substring(2, msginfo.split("\\/")[0].length());
						    String gxFileName=msginfo.split("\\/")[1].split("\\+")[0];
						    String sendkey=msginfo.split("\\/")[1].split("\\+")[1];
						    File file=new File(Constant.FILES+File.separator+gxFileName);
						    String fileMd5=MD5Util.getMd5ByFile(file);
						    // 发送给终端
							Map<String, Object> map=new HashMap<String, Object>();
							map.put("fileMd5", fileMd5);
							map.put("apklength", apklength);
							map.put("gxFileName", gxFileName);
							msg0818=Constant.sendDownString(msginfo, sendkey,map);
							//System.out.println(msg0818);
							
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
								msg0818= msg0818;
							}else{
								msg0818= olog.getMsg();
							}
							
						  //msg0818=olog.getMsg();
					}else{
						
							
							msg0818=olog.getMsg();
						
						
						
					}
					
					
					if (client.getServerid() == 0) {
						   Mlt mt = Constant.messageMap.get(client.getMark());
						   if (mt != null) {
								mymsg = new MyMsg();
								mymsg.msg = msg0818;
								mymsg.sendkey = olog.getSendkey();
								mt.allmsg.add(mymsg);
							}
						 } 
				     }				
			}
			
		}
		
		
		return SUCCESS;
	}
	
	
	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	public int getRlid() {
		return rlid;
	}


	public void setRlid(int rlid) {
		this.rlid = rlid;
	}
	



}
