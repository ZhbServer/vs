package com.vshow.control.api.v1.client;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.api.v1.base.BaseAction;

import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Client;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.data.CountClientTimeApi;
import com.vshow.control.data.User;

import com.vshow.control.tool.SqlConnect;

public class GetClientOnlineTime extends BaseAction{
	private String  deviceMark;//终端标识
	private Integer areaCode;  //区域表示/分组id 0表示默认
	private String Btime;//开始时间
	private String Etime;//结束时间

	@Override
	public String execute() throws Exception {
		
		//通过token获取用户信息
		if(ActionContext.getContext().get("user")!=null&&!ActionContext.getContext().get("user").equals("")){
			
			 User user=(User)JSONObject.toBean(JSONObject.fromObject(ActionContext.getContext().get("user")), User.class);
			 
			 if(user==null){
				 
				  responseEntity = ResponseEntity.err0008();
				 
			 }else{
				 
				 //获取终端信息
				 Client clientTemp =new Client();
				 clientTemp.setMark(deviceMark);
				 clientTemp.setUid(user.getId());
				 clientTemp.setGid(areaCode);
				 Client client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_gid_mark",clientTemp);
				 if(client==null){
					 //终端不存在
					 responseEntity = ResponseEntity.err0009();
					 return SUCCESS;
				 }else{
				

					 CountClientTime cc=new CountClientTime();
					 cc.setClientid(clientTemp.getClientId());
					 cc.setMark(deviceMark);
					 cc.setUid(user.getId());
					 cc.setStartid(0);
					 cc.setPagetype(999);
					 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					 try {
						Date bd = sdf.parse(Btime.substring(0, 10));
						Date ed = sdf.parse(Etime.substring(0, 10));
						Btime = sdf.format(bd);
						Etime = sdf.format(ed);
					} catch (Exception e) {
						responseEntity = ResponseEntity.err0012();
					}
					cc.setBtime(Btime);
					 cc.setEtime(Etime);
					 //根据mark地址 开始时间 结束时间查询统计数据
					 List<CountClientTimeApi> ccList=(List<CountClientTimeApi>) SqlConnect.getSqlMapInstance().queryForList(
								"sel_cct_list_mark_api", cc);


					 //返回在线数据
					
					 if(ccList.size()==0||ccList==null)
					 {
						 responseEntity = ResponseEntity.err0015();
						 
					 }else{	
						 //System.out.println(JSONArray.fromObject(ccList).toString());
						 responseEntity = ResponseEntity.err0000();
						 responseEntity.putDataValue("CountClientTimeList", ccList);
					 }
				 }
				  
			 }
			
		}else{
			
			responseEntity = ResponseEntity.err0008();
			
		}
		
        return Action.SUCCESS;

	}

	public static String formatTime(Integer time) {  
	    Integer ss = 1;  
	    Integer mi = ss * 60;  
	    Integer hh = mi * 60;  
	  
	    Long ms = Long.parseLong(String.valueOf(time));
	    
	    Long hour = ms / hh;  
	    Long minute = (ms - hour * hh) / mi;  
	    Long second = (ms - hour * hh - minute * mi) / ss;  
	      
	    StringBuffer sb = new StringBuffer();  
//	    if(day > 0) {  
//	        sb.append(day+"天");  
//	    }  
	    if(hour > 0 && hour <= 9) {  
	        sb.append("0"+hour+":"); 
	    }else if(hour > 9){
	    	sb.append(hour+":");  
	    }else{
	    	sb.append("00:");  
	    }
	    if(minute > 0 && minute <= 9) {  
	        sb.append("0"+minute+":");  
	    }else if(minute > 9){
	    	sb.append(minute+":");  
	    }else{
	    	sb.append("00:");  
	    }
	    if(second > 0 && second <= 9) {  
	        sb.append("0"+second);  
	    }else if(second > 9){
	    	sb.append(second);  
	    }else{
	    	sb.append("00");
	    }
//	    if(milliSecond > 0) {  
//	        sb.append(milliSecond+"毫秒");  
//	    }  
	    return sb.toString();  
	}  

	public static int TimeDifference(CountClientTime cct) {
		String s1 = cct.getEtime();
		String s2 = cct.getBtime();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		int count = 0;
		try {
			Date d1 = df.parse(s1);
			Date d2 = df.parse(s2);
			count = (int) ((d1.getTime() - d2.getTime()) / (60 * 60 * 1000 * 24));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return count;
	}

	public String getDeviceMark() {
		return deviceMark;
	}

	public void setDeviceMark(String deviceMark) {
		this.deviceMark = deviceMark;
	}
	
	public Integer getAreaCode() {
		return areaCode;
	}


	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}


	public String getBtime() {
		return Btime;
	}


	public void setBtime(String btime) {
		Btime = btime;
	}


	public String getEtime() {
		return Etime;
	}


	public void setEtime(String etime) {
		Etime = etime;
	}

	
	

	
}
