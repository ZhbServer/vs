package com.vshow.control.api.v1.client;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.api.v1.data.Area;
import com.vshow.control.api.v1.data.Device;
import com.vshow.control.api.v1.util.ResponseEntity;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.Item;
import com.vshow.control.data.Log;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoVideo;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.Img2Base64Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;


/**
 * 获取当前用户区域下所有终端
 * @param access_token 
 * @param 
 * @author w
 * @version 6.1 
 *
 */
public class GetItemInfoAction extends BaseAction {

	
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		
		//通过token获取用户信息
		if(ActionContext.getContext().get("user")!=null&&!ActionContext.getContext().get("user").equals("")){
			
			 User user=(User)JSONObject.toBean(JSONObject.fromObject(ActionContext.getContext().get("user")), User.class);
			 
			 if(user==null){
				 
				  responseEntity = ResponseEntity.err0008();
				 
			 }else{
				 
				 Item item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_pro_filename", fileName);
				 
				 if(item==null){
					 responseEntity = ResponseEntity.err0013();
				 }else{
					 responseEntity = ResponseEntity.err0000();
					 responseEntity.putDataValue("item", item);
				 }
				
				  
			 }
			
		}else{
			
			responseEntity = ResponseEntity.err0008();
			
		}
		
        return Action.SUCCESS;

	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
	

	
	
	
}
