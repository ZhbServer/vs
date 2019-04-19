package com.vshow.control.dataif;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.program.ProgramDataSourceUnit;
import com.vshow.control.data.program.ResourceType;
import com.vshow.control.kh.bus.api.BusStopDataInteractAction;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDataSource;
import com.vshow.control.protocol.ProtocolPlayBase;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;

public class DataInterfaceAction  extends BaseAction {
	
	private String dataSource;    //  数据源  [[{"key":"id","value":"主键"},{"key":"name","value":"姓名"}],[{"key":"id","value":"主键2"},{"key":"name","value":"姓名2"}]] 
	
	private String macs;     // 标识码      ["AD:XC:AW:DD:AS:AS","AD:XC:AW:DD:AS:12","AD:XC:AW:DD:AS:56"] 
	
	private int opt=0;  //0替换  , 1 追加   ,2 清理
	
	private int showPos=0; // 0从上   1从下
	
	Logger logger  =  Logger.getLogger(DataInterfaceAction.class);
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		logger.info("接收接口数据信息:");
		logger.info("dataSource:"+dataSource);
		logger.info("macs:"+macs);
		logger.info("opt:"+opt);
		logger.info("showPos:"+showPos);
		
		responseEntity = ResponseEntity.err0000();
		
		JSONObject job;
		JSONArray jsonArray;
		JSONArray jsonArray2;
		ProgramDataSourceUnit  programDataSourceUnit;
		
		if(macs!=null&&!macs.equals("")){
			
			
			List psuListAll=new ArrayList();
			
			if(dataSource!=null&&!dataSource.equals("")){
					
					 //转换为json
					 try {
					    	 jsonArray = JSONArray.fromObject(dataSource);
					 
							 String  key="";
							 String  value="";
							 
							 for (int i = 0; i < jsonArray.size(); i++) {
								 
								 List<String> psuList=new ArrayList<String>();
								 
								 jsonArray2=jsonArray.getJSONArray(i);
								
								 for (int j = 0; j < jsonArray2.size(); j++) {
									 //programDataSourceUnit  =new ProgramDataSourceUnit();
									 //job=jsonArray2.getJSONObject(j);
									 //key=job.getString("key");
									 //value=job.getString("value");
									 //programDataSourceUnit.setKey(key);
									 //programDataSourceUnit.setValue(value);
									 psuList.add(dataSource);
								 }
								 
								 psuListAll.add(psuList);
								 
								
							 }
					 
					 } catch (Exception e) {
						 logger.error("dataSource 转换出错");
					 }
					  
			 }
			
			 
			 jsonArray = JSONArray.fromObject(macs);
			 
			 String mac="";
             
			 Protocol protocol=new Protocol();
        	 
        	 protocol.setType(ProtocolType.TYPE51);
        	 
        	 ProtocolPlayBase ppb=new ProtocolPlayBase();
        	 
        	 ppb.setmType(ResourceType.TYPE_DATA_SOURCE);
        	 
        	 ProtocolDataSource pds=new ProtocolDataSource();
        	 
        	 pds.setDataSource(dataSource);
        	 
        	 pds.setOpt(opt);
        	 
        	 pds.setShowPos(showPos);
        	 
        	 ppb.setmMsgJson(pds);
        	 
        	 protocol.setProtocolPlayBaseList(ppb);
        	 
        	 JSONObject jsonObject = JSONObject.fromObject(protocol);
        	 
        	 System.out.println(jsonObject.toString());
        	 
        	 String msg0818=Constant.sendDownString(jsonObject.toString(), "",null);
        	 
        	 //System.out.println("msg0818:"+msg0818);
        	 MyMsg mymsg;
        	 //发送终端
        	 for (int i = 0; i < jsonArray.size(); i++) {
            	 
            	 mac=jsonArray.get(i).toString();
            	 
            	 Mlt mt = Constant.messageMap.get(mac);
				 if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg0818;
						mymsg.sendkey = "";
						mt.allmsg.add(mymsg);
				 }
            	 
			 }
		}
		
		
		return SUCCESS;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getMacs() {
		return macs;
	}

	public void setMacs(String macs) {
		this.macs = macs;
	}

	public int getOpt() {
		return opt;
	}

	public void setOpt(int opt) {
		this.opt = opt;
	}

	public int getShowPos() {
		return showPos;
	}

	public void setShowPos(int showPos) {
		this.showPos = showPos;
	}
	
	
	public static void main(String[] args) {
		
		List<ProgramDataSourceUnit> psuList=new ArrayList<ProgramDataSourceUnit>();
		
		ProgramDataSourceUnit  psu=new ProgramDataSourceUnit();
		psu.setKey("id");
		psu.setValue("主键");
		
		psuList.add(psu);
		
		
		ProgramDataSourceUnit  psu2=new ProgramDataSourceUnit();
		psu2.setKey("name");
		psu2.setValue("姓名");
		
		psuList.add(psu2);
		
		
		
		List psuListAll=new ArrayList();
		
		psuListAll.add(psuList);
		
		
		
		
		
        List<ProgramDataSourceUnit> psuList2=new ArrayList<ProgramDataSourceUnit>();
		
		ProgramDataSourceUnit  psu21=new ProgramDataSourceUnit();
		psu21.setKey("id");
		psu21.setValue("主键2");
		
		psuList2.add(psu21);
		
		
		ProgramDataSourceUnit  psu22=new ProgramDataSourceUnit();
		psu22.setKey("name");
		psu22.setValue("姓名2");
		
		psuList2.add(psu22);
		
		
		psuListAll.add(psuList2);
		
		
		
		//打印json
		JSONArray jsonArray = JSONArray.fromObject(psuListAll);
		System.out.println(jsonArray.toString());
		
		
		
		
		 List<String> macs=new ArrayList<String>();
		 macs.add("11");
		 macs.add("12");
		 macs.add("13");
		//打印json
		jsonArray = JSONArray.fromObject(macs);
		System.out.println(jsonArray.toString());
		 
		
		
		
		
	}
	
	
}
