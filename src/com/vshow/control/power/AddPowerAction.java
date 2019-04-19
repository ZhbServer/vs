package com.vshow.control.power;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;

import com.vshow.control.tool.SqlConnect;

public class AddPowerAction implements Action {
	private Power power;

	public void setPower(Power power) {
		this.power = power;
	}
	

	public Power getPower() {
		return power;
	}


	@Override
	public String execute() throws Exception {
		
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		if(power.getItemsendAdd()==1||power.getItemsendReplace()==1||power.getItemsendInteractive()==1||power.getItemsendInduction()==1||power.getItemsendPrecise()==1
				||power.getItemsendWarning()==1){
			power.setItemsend(1);
		}else{
			power.setItemsend(0);
		}
		
		
		Integer powerId=(Integer)SqlConnect.getSqlMapInstance().insert("add_power", power);
		LogHandle.insertTheLog(LogType.type56, urid,Constant.LOCAL.getA00171()+":" + power.getName(), 1,1);
		
		
		//添加拓展权限
		
		if(powerId!=null){
			
			PowerUtil.updatePowerExpand("dllItemSend",powerId,power.getDllItemSend());
			
			PowerUtil.updatePowerExpand("itemsendAdd",powerId,power.getItemsendAdd());
			
			PowerUtil.updatePowerExpand("itemsendReplace",powerId,power.getItemsendReplace());
			
			PowerUtil.updatePowerExpand("itemsendInduction",powerId,power.getItemsendInduction());
			
			PowerUtil.updatePowerExpand("itemsendPrecise",powerId,power.getItemsendPrecise());
			
			PowerUtil.updatePowerExpand("itemsendInteractive",powerId,power.getItemsendInteractive());

			PowerUtil.updatePowerExpand("itemsendWarning",powerId,power.getItemsendWarning());
			
			
			
		}
		
		return SUCCESS;
	}

	
}
