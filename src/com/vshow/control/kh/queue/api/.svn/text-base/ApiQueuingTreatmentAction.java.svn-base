package com.vshow.control.kh.queue.api;

import java.util.HashMap;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.BindBig;
import com.vshow.control.data.Client;
import com.vshow.control.data.Result;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class ApiQueuingTreatmentAction implements Action {

	private String[] queues;         //叫号数组    [区号_窗口号, 区号2_窗口号2, 区号3_窗口号3]
	
	private String number;           //叫号号码
	
	private String nname;            //叫号姓名
	
	private String content;          //返回值
	
	Logger logger  =  Logger.getLogger(ApiQueuingTreatmentAction.class);
	
	@Override
	public String execute() throws Exception {
		String queueps[];
		Integer bigCid;
		BindBig bw;
		for (int i = 0; i < queues.length; i++) {
			queueps=queues[i].split("\\_");
			if(queueps.length==2){
				//查找窗口号    返回窗口信息
				bw=new BindBig();
				bw.setPoint(queueps[0]);
				bw.setWin(queueps[1]);
                bw=(BindBig)SqlConnect.getSqlMapInstance().queryForObject("sel_bindwin_all", bw);
                if(bw!=null){
                     //获取发布的终端
                   	 Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", bw.getCid());
                   	 if(client!=null){
                   		String msg = "46+"+number+"号   "+nname+"正在就诊" ;
                   		logger.info("叫号窗口:"+msg);
                		Result rs = new Result();
                		HashMap hm = new HashMap();
                		String vlu;
                		String fzmsg;
                		MyMsg mymsg;
                		// 发送给终端
                		if (client.getServerid() == 0) {                
                			Mlt mt = Constant.messageMap.get(client.getMark());
                			if (mt != null) {
                				mymsg = new MyMsg();
                				mymsg.msg = msg;
                				mymsg.sendkey = "";
                				mt.allmsg.add(mymsg);
                			}
                		}
                   	 }
                }else{
                	logger.info("叫号窗口 ["+queueps[0]+","+queueps[1]+"]未绑定 ");
                }                
			}
			
		}
		
        content=SUCCESS;
		return SUCCESS;
	}

	public String[] getQueues() {
		return queues;
	}

	public void setQueues(String[] queues) {
		this.queues = queues;
	}

	

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
