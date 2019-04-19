package com.vshow.control.kh.cut.per;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.opensymphony.xwork.Action;
import com.vshow.control.data.JsonValue;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class getCutAction implements Action {
	Logger logger  =  Logger.getLogger(getCutAction.class);
	private String mark;    // 终端标识
	private int cutw;       // 切纸长度(1的倍数)
	private String code;    // 验证码
    private String cutc;    // 切纸命令(80)(是否需要)
	private String content; //返回值
	@Override
	public String execute() throws Exception {
		int state=0;
		//1成功 2缺纸 3卡纸 4切纸机未开启 5终端机器超时未反馈信息 6终端未录入/未认证
		
		//判断终端在线不在线
		Integer zxstate=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_mark_zxstate", mark);
		if(zxstate==null||zxstate==0){
			state=5;
		}else{
			Mlt mt = Constant.messageMap.get(mark);
			if (mt != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
				String date = sf.format(new Date());
				String sendkey=date+ "-" + 1 + "-" + (int) (Math.random() * 10000);
				MyMsg mymsg;
				mymsg = new MyMsg();
				mymsg.msg = "47+sendkey!"+sendkey+"%"+cutw;
				mymsg.sendkey = sendkey;
				mt.allmsg.add(mymsg);
			    logger.info("调试测试:["+mark+"]["+sendkey+"]切纸信息放入队列"+Constant.getCurrentDate());
				String cutMsg;
				int ccount=0;
				while(true){
					if(ccount==60){
						state=5;
						break;
					}
					Thread.sleep(1000);
					cutMsg=Constant.cutMap.get(sendkey);
					if(cutMsg!=null){
					   state=Integer.parseInt(cutMsg);
					   logger.info("调试测试:["+mark+"]["+sendkey+"]切纸信息终端返回手机端"+Constant.getCurrentDate());
					   break;
					}else{
						ccount++;
					}
				}
				
				
			}else{
				state=6;
			}
		}
		
		
		
		
		JsonValue jv=new JsonValue();
		jv.setCode(code);
		jv.setMark(mark);
		jv.setState(state);
		JSONArray jsonArray = JSONArray.fromObject(jv);
		content = jsonArray.toString();
		
		
		//记录日志
		String statet="";
		if(state==1){
			statet="切纸成功";
		}else if(state==2){
			statet="缺纸";
		}else if(state==3){
			statet="卡纸";
		}else if(state==4){
			statet="切纸机未开启";
		}else if(state==5){
		    statet="终端机器超时未反馈信息";	
		}else if(state==6){
			statet="终端未录入/未认证";	
		}
		
        System.out.println(mark+"手机接收切纸状态:"+statet);
        logger.info(mark+"手机接收切纸状态:"+statet);
	
		return SUCCESS;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public int getCutw() {
		return cutw;
	}
	public void setCutw(int cutw) {
		this.cutw = cutw;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCutc() {
		return cutc;
	}
	public void setCutc(String cutc) {
		this.cutc = cutc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
