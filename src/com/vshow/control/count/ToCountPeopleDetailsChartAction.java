package com.vshow.control.count;

import java.util.List;
import java.util.Map;

import jxl.write.Label;
import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.data.CountPeopleData;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToCountPeopleDetailsChartAction implements Action {


	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String name = ""; //终端名
	private String mark = ""; //Mac
	private String ip = ""; //ip

	private List<CountPeopleData> countPeopleList;
	private CountPeopleData cpd;

	private int sex1;
	private int sex2;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

	

		cpd = new CountPeopleData();
		cpd.setBtime(btime);
		cpd.setEtime(etime);
		cpd.setMark(mark);
		
	

		

		countPeopleList = SqlConnect.getSqlMapInstance().queryForList(
				"sel_cp_list_info_countPeopleDetails", cpd);
		
		
		for (CountPeopleData cpd : countPeopleList) {
			
             String countPeopleDetails=cpd.getCountPeopleDetails();
			
			if(countPeopleDetails==null||countPeopleDetails.equals("")){
				
			}else{
				JSONArray json = JSONArray.fromObject(countPeopleDetails);
				List<CountPeopleDetails> countPeopleDetailsList  = (List<CountPeopleDetails>) JSONArray.toCollection(json,
						CountPeopleDetails.class);
				
				for (CountPeopleDetails cpDetails : countPeopleDetailsList) {
					
					if(cpDetails.getSex()==1){
						sex1++;
					}else if(cpDetails.getSex()==2){
						sex2++;
					}	
				}
				
			}
		}

		
		
		
		return SUCCESS;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public List<CountPeopleData> getCountPeopleList() {
		return countPeopleList;
	}

	public void setCountPeopleList(List<CountPeopleData> countPeopleList) {
		this.countPeopleList = countPeopleList;
	}

	public CountPeopleData getCpd() {
		return cpd;
	}

	public void setCpd(CountPeopleData cpd) {
		this.cpd = cpd;
	}

	public int getSex1() {
		return sex1;
	}

	public void setSex1(int sex1) {
		this.sex1 = sex1;
	}

	public int getSex2() {
		return sex2;
	}

	public void setSex2(int sex2) {
		this.sex2 = sex2;
	}
	


	
	
}
