package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.ItemKey;
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
import com.vshow.control.tool.SqlConnect;

public class AjaxGetItemKeyAction  extends BaseAction {
	
	private String filename;    
	
    private String selfItemKey;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		responseEntity = ResponseEntity.err0000();
		
		ItemKey itemKey=new ItemKey();
		
		itemKey.setFilename(filename);
		itemKey.setKey(selfItemKey);
		
		ItemKey iKey=(ItemKey)SqlConnect.getSqlMapInstance().queryForObject("sel_un_key", itemKey);
		
		if(iKey!=null){
			
			iKey.getKey();
			
			responseEntity.putDataValue("itemKey", iKey.getKey());
			
		}else{
			
		    responseEntity.putDataValue("itemKey", "");
			
		}		
		return SUCCESS;
	}



	public String getSelfItemKey() {
		return selfItemKey;
	}



	public void setSelfItemKey(String selfItemKey) {
		this.selfItemKey = selfItemKey;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}

	
	
	
	
	
	
}
