package com.vshow.control.api.v1.client;

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
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.User;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;


/**
 * 获取当前用户区域下所有终端
 * @param access_token 
 * @param 
 * @author w
 * @version 6.1 
 *
 */
public class GetAreaDeviceListAction extends BaseAction {

	
	@Override
	public String execute() throws Exception {
		
		//通过token获取用户信息
		if(ActionContext.getContext().get("user")!=null&&!ActionContext.getContext().get("user").equals("")){
			
			 User user=(User)JSONObject.toBean(JSONObject.fromObject(ActionContext.getContext().get("user")), User.class);
			 
			 if(user==null){
				 
				  responseEntity = ResponseEntity.err0008();
				 
			 }else{
				 
				 //获取当前用户分组集合
				 List<ClientGroup> cgs=SqlConnect.getSqlMapInstance().queryForList("sel_cg_uid_all", user.getId());
				 
				 //创建默认分组
				 ClientGroup clientGroup=new ClientGroup();
				 clientGroup.setId(0);
				 clientGroup.setGname("默认分组");
				 cgs.add(clientGroup);
				 
				 //获取分组下的所有终端
				 for (int i = 0; i < cgs.size(); i++) {
					 cgs.get(i).setClients(SqlConnect.getSqlMapInstance().queryForList("sel_group_client_all", cgs.get(i).getId()));
				 }
				 
				 //转换
				 List<Area> areas=new ArrayList<Area>();
				 Area area;
				 List<Device> devices;
				 Device device;
				 for (int i = 0; i < cgs.size(); i++) {
					 
					 area=new Area();
					 area.setAreaCode(cgs.get(i).getId());
					 area.setAreaName(cgs.get(i).getGname());
					 devices=new ArrayList<Device>();
					 for (int j = 0; j < cgs.get(i).getClients().size(); j++) {
						 device=new Device();
						 device.setId(cgs.get(i).getClients().get(j).getId());
						 device.setMark(cgs.get(i).getClients().get(j).getMark());
						 
						 if(cgs.get(i).getClients().get(j).getStandbystate()==1){
							 device.setState(2);
						 }else{
							 device.setState(cgs.get(i).getClients().get(j).getZxstate());
						 }
						
						 
						 
						 device.setName(cgs.get(i).getClients().get(j).getName());
						 devices.add(device);
					 }
					 area.setDevice(devices);
					 areas.add(area);
					 
				 }
				 
				 
				 
				 responseEntity = ResponseEntity.err0000();
				 
				 responseEntity.putDataValue("datas", areas);
				  
			 }
			
		}else{
			
			responseEntity = ResponseEntity.err0008();
			
		}
		
        return Action.SUCCESS;

	}

	public static void main(String[] args) {
		System.out.println(Action.SUCCESS);
	}
	

	
	
	
}
