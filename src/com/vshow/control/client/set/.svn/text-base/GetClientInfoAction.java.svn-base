package com.vshow.control.client.set;

import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientAdvertising;
import com.vshow.control.data.ClientPlay;
import com.vshow.control.tool.SqlConnect;

public class GetClientInfoAction extends ActionSupport {
	private int cid;
	private String size;  //存储信息
	private String version;   //版本信息
	private String onoff;    //开关机
	private String vol;     //音量
	
	private String downstatus;  //下载进度
	private int timejk;  //定时监控开关
	private int tb;      //同步开关
	private String orderDate;   //指令发送日期
	private int orderState;   //指令接收状态
	private String content;      //指令内容
	private String contentsub;   //指令内容缩写
	private int uponoff=0;
	
	private String nver;   //内部版本号
	private String sver;   //显示版本号
    private int ctype;
	
    private ClientPlay publicCp;//普通播放
    private ClientPlay publicTime;//轮播节目
    private ClientPlay publicDp;//垫片节目
    private ClientPlay publicInsert;//插播节目
    private ClientPlay publicDate;//有效期节目
    private ClientPlay publicWarning;//预警节目
    private ClientPlay publicCondition;//条件节目
    
	private String advertisingShow;  //广告位显示(有效节目数/最大播放节目数)
   
	


	@Override
	public String execute() throws Exception {
		Client client = (Client) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_client_byid", cid);
		downstatus=client.getDownstate();
		//timejk=client.getTimejk();
		//tb=client.getTb();
		//uponoff=client.getUponoff();
		//nver=client.getNver();
		//sver=client.getSver();
		//ctype=client.getCtype();
		if(client!=null){
		    String info=client.getSize();
			if(info!=null&&!"".equals(info)){
				String[] infos=info.split("\\/");
				if(infos.length==5){
				size=infos[0]+"/"+infos[1];
				version=infos[2];
				vol=infos[3];
				onoff=infos[4];
				}
				if(infos.length==4){
					size=infos[0]+"/"+infos[1];
					version=infos[2];
					vol=infos[3];
				
			    }
				
			}
			
			//获取最后一次播放计划
			List<ClientPlay>  cps=SqlConnect.getSqlMapInstance().queryForList("sel_cp_mark",client.getMark());
			
			for (ClientPlay cp : cps) {
				cp.setContentsub(subStringList(cp.getContent()));
				if(cp.getSendtype()==1){
					publicCp=cp;
				}else if(cp.getSendtype()==16){
					publicTime=cp;
					
					if(publicTime!=null){
						publicTime.setContent(publicTime.getContent().replaceAll("\\^", " <br />"));
					}
					
				}else if(cp.getSendtype()==17){
					
					publicInsert=cp;
					if(publicInsert!=null){
						publicInsert.setContent(publicInsert.getContent().replaceAll("\\^", " <br />"));
					}
					
				}else if(cp.getSendtype()==18){
					
					publicDp=cp;
					
				}else if(cp.getSendtype()==23){
					publicDate=cp;
					if(publicDate!=null){
						publicDate.setContent(publicDate.getContent().replaceAll("\\^", " <br />"));
					}
				}else if(cp.getSendtype()==41){
					publicWarning=cp;
					if(publicWarning!=null){
						publicWarning.setContent(publicWarning.getContent().replaceAll("\\^", " <br />"));
					}
				}else if(cp.getSendtype()==46){
					publicCondition=cp;
					if(publicCondition!=null){
						publicCondition.setContent(publicCondition.getContent().replaceAll("\\^", " <br />"));
					}
				}
				
			}
			
			
		}
		
		//获取广告位
		try {
			ClientAdvertising clientAdvertising=(ClientAdvertising)SqlConnect.getSqlMapInstance().queryForObject("sel_client_advertising", client.getMark());
			if(clientAdvertising!=null){
				advertisingShow=clientAdvertising.getUse_number()+"/"+clientAdvertising.getNumber();  //广告位显示(有效节目数/最大播放节目数)
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		//advertisingShow
		
		//Client resultClient=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_result_client",cid);
		//if(resultClient!=null){
		//	orderDate=resultClient.getOrderDate();
		//	orderState=resultClient.getOrderState();
		//	content=resultClient.getContent();
		//	contentsub=subStringList(content);
		//}
		return SUCCESS;
	}
	
	public ClientPlay getPublicCondition() {
		return publicCondition;
	}

	public void setPublicCondition(ClientPlay publicCondition) {
		this.publicCondition = publicCondition;
	}

	public ClientPlay getPublicDate() {
		return publicDate;
	}

	public void setPublicDate(ClientPlay publicDate) {
		this.publicDate = publicDate;
	}

	public int getCtype() {
		return ctype;
	}

	// 显示截取名字
	public String subStringList(String content) {
		int loglen = content.length();
		if(loglen >= 10){
			return content.substring(0, 9) + "...";
		}else{
			return content;
		}
		
	
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getOnoff() {
		return onoff;
	}

	public void setOnoff(String onoff) {
		this.onoff = onoff;
	}

	public String getVol() {
		return vol;
	}

	public void setVol(String vol) {
		this.vol = vol;
	}

	

	public String getDownstatus() {
		return downstatus;
	}

	public void setDownstatus(String downstatus) {
		this.downstatus = downstatus;
	}

	public int getTimejk() {
		return timejk;
	}

	public void setTimejk(int timejk) {
		this.timejk = timejk;
	}

	public int getTb() {
		return tb;
	}

	public void setTb(int tb) {
		this.tb = tb;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentsub() {
		return contentsub;
	}

	public void setContentsub(String contentsub) {
		this.contentsub = contentsub;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	
	public int getUponoff() {
		return uponoff;
	}

	public void setUponoff(int uponoff) {
		this.uponoff = uponoff;
	}
	
	public String getNver() {
		return nver;
	}

	public String getSver() {
		return sver;
	}
	
	public ClientPlay getPublicCp() {
		return publicCp;
	}

	public void setPublicCp(ClientPlay publicCp) {
		this.publicCp = publicCp;
	}

	public ClientPlay getPublicTime() {
		return publicTime;
	}

	public void setPublicTime(ClientPlay publicTime) {
		this.publicTime = publicTime;
	}

	public ClientPlay getPublicDp() {
		return publicDp;
	}

	public void setPublicDp(ClientPlay publicDp) {
		this.publicDp = publicDp;
	}

	public ClientPlay getPublicInsert() {
		return publicInsert;
	}

	public ClientPlay getPublicWarning() {
		return publicWarning;
	}

	public void setPublicWarning(ClientPlay publicWarning) {
		this.publicWarning = publicWarning;
	}

	public void setPublicInsert(ClientPlay publicInsert) {
		this.publicInsert = publicInsert;
	}
	
	public String getAdvertisingShow() {
		return advertisingShow;
	}

	public void setAdvertisingShow(String advertisingShow) {
		this.advertisingShow = advertisingShow;
	}
}
