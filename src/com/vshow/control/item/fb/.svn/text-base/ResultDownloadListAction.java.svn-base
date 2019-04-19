package com.vshow.control.item.fb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

public class ResultDownloadListAction implements Action {

	private List<Client> downloadList;
	private String resultDownloadSizeState;

	@Override
	public String execute() throws Exception {
		
		downloadList=new ArrayList<Client>();
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        int uid = (Integer) session.get("urid");
        String keys;
        String clientName;
        String logContent;
        Client client;
        MyMsg mm;
        for(Iterator<Entry<String, MyMsg>> iterator= Constant.downloadQueue.entrySet().iterator();iterator.hasNext();){
	        
        	client=new Client();
        	
        	Entry<String,MyMsg> entry=iterator.next();
	        
	        //System.out.println("key---------"+entry.getKey());
        	
        	mm=entry.getValue();
        		
        	client.setDownloadKey(entry.getKey());
	        
	        //keys=entry.getKey().split("\\@");
        	keys=entry.getKey();
        	
	        clientName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_make_name_client", keys);  //获取终端名
	        
	        client.setName(clientName);
	        
	        logContent=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_content_sendkey", mm.sendkey);  //获取日志信息   
	        
	        client.setLcontent(logContent);
	        //System.out.println(clientName+"----------"+logContent);
	        downloadList.add(client);
        }
        
        resultDownloadSizeState=Constant.downloadQueue.size()+"/"+Constant.downloadQueueSize;
        
		return SUCCESS;
	}
	
	public String getResultDownloadSizeState() {
		return resultDownloadSizeState;
	}
	public void setResultDownloadSizeState(String resultDownloadSizeState) {
		this.resultDownloadSizeState = resultDownloadSizeState;
	}
	
	public List<Client> getDownloadList() {
		return downloadList;
	}
	public void setDownloadList(List<Client> downloadList) {
		this.downloadList = downloadList;
	}
	
}
