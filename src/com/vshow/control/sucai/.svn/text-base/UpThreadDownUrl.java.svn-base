package com.vshow.control.sucai;

import java.sql.SQLException;

import com.vshow.control.data.SucaiCloud;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.SqlConnect;

public class UpThreadDownUrl extends Thread {
	
	//url
	private String url;
	//param
	private String param;
	//videoid
	private String videoid;
	
    public UpThreadDownUrl(String url ,String param,String videoid) {
		// TODO Auto-generated constructor stub
    	this.url=url;
    	this.param=param;
    	this.videoid=videoid;
	}
    
    @Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			sleep(1000*60*2);// 睡一分钟 获取
			
			String downUrl=HttpRequest.sendGet(url, param);
	    	
	    	SucaiCloud sCloud=new SucaiCloud();
	    	sCloud.setDownurl(downUrl);
	    	sCloud.setVideoid(videoid);
	    	SqlConnect.getSqlMapInstance().update("up_sucaiCloud_downUrl", sCloud);
	    	
	    	   
			
		} catch (InterruptedException e) {
		
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.run();
	}
    
    
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getVideoid() {
		return videoid;
	}

	public void setVideoid(String videoid) {
		this.videoid = videoid;
	}

	
}
