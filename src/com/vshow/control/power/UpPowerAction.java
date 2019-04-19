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

public class UpPowerAction implements Action {
	private Power power;

	public void setPower(Power power) {
		this.power = power;
	}
	

	public Power getPower() {
		return power;
	}


	@Override
	public String execute() throws Exception {
		
		if(power.getItemsendAdd()==1||power.getItemsendReplace()==1||power.getItemsendInteractive()==1||power.getItemsendInduction()==1||power.getItemsendPrecise()==1){
			power.setItemsend(1);
		}else{
			power.setItemsend(0);
		}
		
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		
		SqlConnect.getSqlMapInstance().update("update_power", power);
		
		LogHandle.insertTheLog(LogType.type57, urid,Constant.LOCAL.getA00172()+":" + power.getName(), 1,1);
		
		PowerUtil.editPowerExpand("dllItemSend",power.getId(),power.getDllItemSend());
		
		PowerUtil.editPowerExpand("itemsendAdd",power.getId(),power.getItemsendAdd());
		
		PowerUtil.editPowerExpand("itemsendReplace",power.getId(),power.getItemsendReplace());
		
		PowerUtil.editPowerExpand("itemsendInduction",power.getId(),power.getItemsendInduction());
		
		PowerUtil.editPowerExpand("itemsendPrecise",power.getId(),power.getItemsendPrecise());
		
		PowerUtil.editPowerExpand("itemsendInteractive",power.getId(),power.getItemsendInteractive());
		
		PowerUtil.editPowerExpand("itemsendWarning",power.getId(),power.getItemsendWarning());
		
		return SUCCESS;
	}

	
}
