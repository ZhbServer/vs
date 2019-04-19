package com.vshow.control.power;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Power;
import com.vshow.control.data.PowerExpand;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.SqlConnect;

public class ToUpPowerAction extends ActionSupport {

	private int pid; // 权限id

	private Power power;

	public String execute() throws Exception {

		power = (Power) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_power_all_id", pid);

		// 获取拓展权限
		// PowerExpand
		// ped=(PowerExpand)SqlConnect.getSqlMapInstance().queryForObject("sel_powerExpand_all",
		// power.getId());
		List<PowerExpand> peds = SqlConnect.getSqlMapInstance().queryForList(
				"sel_powerExpand_all", power.getId());
		PowerExpand ped;
		for (int i = 0; i < peds.size(); i++) {
			ped = peds.get(i);
			if (ped != null) {
				String expandContent = ped.getExpandContent();

				JSONArray array = JSONArray.fromObject(expandContent);

				for (int j = 0; j < array.size(); j++) {
					JSONObject jsonObject = array.getJSONObject(j);
					PowerExpand ti = (PowerExpand) JSONObject.toBean(
							jsonObject, PowerExpand.class);

					if (ti.getPowerName().equals("dllItemSend")) {
						power.setDllItemSend(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendAdd")) {
						power.setItemsendAdd(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendReplace")) {
						power.setItemsendReplace(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendInduction")) {
						power.setItemsendInduction(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendPrecise")) {
						power.setItemsendPrecise(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendInteractive")) {
						power.setItemsendInteractive(ti.getPowerState());
					} else if (ti.getPowerName().equals("itemsendWarning")) {
						power.setItemsendWarning(ti.getPowerState());
					}
                     

				}

			}
		}

		return SUCCESS;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public Power getPower() {
		return power;
	}

	public void setPower(Power power) {
		this.power = power;
	}

}
