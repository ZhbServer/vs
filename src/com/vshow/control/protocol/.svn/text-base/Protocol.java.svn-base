package com.vshow.control.protocol;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Protocol {
    
	
	private int  type;               //类型   (详细type说明 见 ProtocalType)
	
    private String sendkey;            //协议标识
        
    private  Object protocolPlayBaseList;  //播放列表(基类)
    
    private List<ProtocolDownResource>  protocolDownResourceList=new  ArrayList<ProtocolDownResource>(); //下载资源
    
    private String playType;           //播放类型   playlist,datalist,insertlist,accuratelist,dpnewlist
    
    private String protocolPlayStitching; //播放列表拼接
    
    private int dllInteractType;    //接口 1文本 2图片 3清理
    
    private int treasureInsideType;//宝箱内容类型 1 二维码、2 url、 3 图片、 4 节目
   
    //**************************************************************************************************************************
    
    public int getDllInteractType() {
		return dllInteractType;
	}
	public void setDllInteractType(int dllInteractType) {
		this.dllInteractType = dllInteractType;
	}



	public int getTreasureInsideType() {
		return treasureInsideType;
	}
	public void setTreasureInsideType(int treasureInsideType) {
		this.treasureInsideType = treasureInsideType;
	}



	private List<ProtocolPlay>  protocolPlayList=new ArrayList<ProtocolPlay>();  //播放列表
    
    
    private  long  downResourceSize;   //下载资源总大小
    
	
    private List<String>  zipResourcesList=new ArrayList<String>();  //zip下载资源
	
	
    private List<ProtocolDownMediaResource> downMediaResourceList=new ArrayList<ProtocolDownMediaResource>();  //音视频资源文件
    
   
	public String getProtocolPlayStitching() {
		return protocolPlayStitching;
	}
	public void setProtocolPlayStitching(String protocolPlayStitching) {
		this.protocolPlayStitching = protocolPlayStitching;
	}
	public List<ProtocolDownResource> getProtocolDownResourceList() {
		return protocolDownResourceList;
	}
	public void setProtocolDownResourceList(
			List<ProtocolDownResource> protocolDownResourceList) {
		this.protocolDownResourceList = protocolDownResourceList;
	}
	public List<ProtocolPlay> getProtocolPlayList() {
    	
		return protocolPlayList;
	}
	public void setProtocolPlayList(List<ProtocolPlay> protocolPlayList) {
		this.protocolPlayList = protocolPlayList;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSendkey() {
		return sendkey;
	}
	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}
	public long getDownResourceSize() {
		return downResourceSize;
	}
	public void setDownResourceSize(long downResourceSize) {
		this.downResourceSize = downResourceSize;
	}
	public String getPlayType() {
		return playType;
	}
	public void setPlayType(String playType) {
		this.playType = playType;
	}
	
	public List<String> getZipResourcesList() {
		return zipResourcesList;
	}
	public void setZipResourcesList(List<String> zipResourcesList) {
		this.zipResourcesList = zipResourcesList;
	}
	public List<ProtocolDownMediaResource> getDownMediaResourceList() {
		return downMediaResourceList;
	}
	public void setDownMediaResourceList(
			List<ProtocolDownMediaResource> downMediaResourceList) {
		this.downMediaResourceList = downMediaResourceList;
	}
	public Object getProtocolPlayBaseList() {
		return protocolPlayBaseList;
	}
	public void setProtocolPlayBaseList(Object protocolPlayBaseList) {
		this.protocolPlayBaseList = protocolPlayBaseList;
	}
	
	
	
	public static void main(String[] args) {
		
		Protocol protocol=new Protocol();
		
		protocol.setType(ProtocolType.TYPE65);
		
		List<ProtocolDpB> protocolDpBList=new ArrayList<ProtocolDpB>();
		
		ProtocolDpB protocolDpB= new ProtocolDpB(); 
		
		protocolDpB.setDay(1);
		
		List<ProtocolDp> protocolDpList=new ArrayList<ProtocolDp>();
		
		ProtocolDp  protocloDp=new ProtocolDp();
		
		List<String> playList=new ArrayList<String>();
		
		playList.add("11111111111111111111");
		
		playList.add("22222222222222222222");
		
		protocloDp.setPlayList(playList);
		
		protocolDpList.add(protocloDp);
		
        ProtocolDp  protocloDp2=new ProtocolDp();
		
		
		
		
		
		List<String> playList2=new ArrayList<String>();
		
		playList2.add("33333333333333333333");
		playList2.add("44444444444444444444");
		
		protocloDp2.setPlayList(playList2);
		
		
		protocolDpList.add(protocloDp2);
		
		
		protocolDpB.setProtocolDp(protocolDpList);
		
		
		protocolDpBList.add(protocolDpB);
		
		protocol.setProtocolPlayBaseList(protocolDpBList);
		
		
		//打印json
		JSONObject jsonObject = JSONObject.fromObject(protocol);
		
		System.out.println(jsonObject.toString());
		
	}
	
}
