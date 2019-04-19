package com.vshow.control.power;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.vshow.control.data.PowerExpand;
import com.vshow.control.tool.SqlConnect;

public class PowerUtil {
	
	
	/**
	 * 更新拓展权限
	 * @author w
	 * @param powerName  拓展权限 权限名
	 * @param powerId    权限Id
	 * @param powerState 拓展权限权限状态 
	 * @throws SQLException
	 */
	
   public static void updatePowerExpand(String powerName,int powerId,int powerState) throws SQLException{
	   
	    //查询拓展权限是否存在
		PowerExpand selPed=new PowerExpand();
		selPed.setPowerName(powerName);
		selPed.setPowerId(powerId);
		PowerExpand  ped=(PowerExpand)SqlConnect.getSqlMapInstance().queryForObject("sel_powerExpand_type", selPed);
		
		List<PowerExpand> powerExpandContentList=new ArrayList<PowerExpand>();
		PowerExpand pTempDllItem=new PowerExpand();
		pTempDllItem.setPowerName(powerName);
		pTempDllItem.setPowerState(powerState);
		powerExpandContentList.add(pTempDllItem);
		JSONArray jsonArray = JSONArray.fromObject(powerExpandContentList);
		
		if(ped!=null){
			
			ped.setExpandContent(jsonArray.toString());
			SqlConnect.getSqlMapInstance().update("update_powerExpand_id", ped);
			
		}else{
			ped=new PowerExpand();
			ped.setExpandContent(jsonArray.toString());
			ped.setPowerId(powerId);
			SqlConnect.getSqlMapInstance().insert("ad_powerExpand", ped);
			
		}
   }
   
   /**
    *修改权限 修改拓展权限
 * @throws SQLException 
    */
   
   public static void editPowerExpand(String powerName,int powerId,int powerState) throws SQLException{
	   

	    //查询拓展权限是否存在
	   PowerExpand selPed=new PowerExpand();
	   selPed.setPowerName(powerName);
	   selPed.setPowerId(powerId);
		
	    PowerExpand  ped=(PowerExpand)SqlConnect.getSqlMapInstance().queryForObject("sel_powerExpand_type", selPed);
	   
	    List<PowerExpand> powerExpandContentList=new ArrayList<PowerExpand>();
		PowerExpand pTempDllItem=new PowerExpand();
		
		//发布控件节目
		pTempDllItem.setPowerName(powerName);
		pTempDllItem.setPowerState(powerState);
		powerExpandContentList.add(pTempDllItem);
		
		
		JSONArray jsonArray = JSONArray.fromObject(powerExpandContentList);
		if(ped!=null){
			
			ped.setExpandContent(jsonArray.toString());
			SqlConnect.getSqlMapInstance().update("update_powerExpand_id", ped);
			
		}else{
			ped=new PowerExpand();
			ped.setExpandContent(jsonArray.toString());
			
			ped.setPowerId(powerId);
			
			SqlConnect.getSqlMapInstance().insert("ad_powerExpand", ped);
			
			
		}
		
   }
}
