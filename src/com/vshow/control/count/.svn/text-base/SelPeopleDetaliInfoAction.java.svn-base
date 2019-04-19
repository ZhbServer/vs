package com.vshow.control.count;

import java.util.List;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.SqlConnect;

public class SelPeopleDetaliInfoAction extends ActionSupport {
	
	private int cpId;
	
	List<CountPeopleDetails> countPeopleDetailsList;
	
	
	@Override
	public String execute() throws Exception {
		String countPeopleDetalis=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_cp_countPeopleDetalis", cpId);
		
		if(countPeopleDetalis!=null){
			JSONArray json = JSONArray.fromObject(countPeopleDetalis);
			countPeopleDetailsList  = (List<CountPeopleDetails>) JSONArray.toCollection(json,
					CountPeopleDetails.class);
		
			
		}
		return SUCCESS;
	}
	
	public List<CountPeopleDetails> getCountPeopleDetailsList() {
		return countPeopleDetailsList;
	}
	public void setCountPeopleDetailsList(
			List<CountPeopleDetails> countPeopleDetailsList) {
		this.countPeopleDetailsList = countPeopleDetailsList;
	}
	
	public int getCpId() {
		return cpId;
	}
	public void setCpId(int cpId) {
		this.cpId = cpId;
	}
}
