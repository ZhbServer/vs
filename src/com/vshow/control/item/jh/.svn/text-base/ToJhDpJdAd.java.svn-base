package com.vshow.control.item.jh;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Cycle;
import com.vshow.control.data.JhItem;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToJhDpJdAd extends ActionSupport {
	
	private int jhid;
	
	private List<Cycle> cycles=new ArrayList<Cycle>();
	
	
	public List<Cycle> getCycles() {
		return cycles;
	}

	public void setCycles(List<Cycle> cycles) {
		this.cycles = cycles;
	}

	@Override
	public String execute() throws Exception {
		
		Cycle cyle8=new Cycle();
		cyle8.setCycleValue(8);
		cyle8.setCycleName(Constant.LOCAL.getA00483()); //每天
		cycles.add(cyle8);
		
		Cycle cyle1=new Cycle();
		cyle1.setCycleValue(1);
		cyle1.setCycleName(Constant.LOCAL.getA00475()); //周一
		cycles.add(cyle1);
		
		Cycle cyle2=new Cycle();
		cyle2.setCycleValue(2);
		cyle2.setCycleName(Constant.LOCAL.getA00476()); //周二
		cycles.add(cyle2);
		
		Cycle cyle3=new Cycle();
		cyle3.setCycleValue(3);
		cyle3.setCycleName(Constant.LOCAL.getA00478()); //周三
		cycles.add(cyle3);
		
		Cycle cyle4=new Cycle();
		cyle4.setCycleValue(4);
		cyle4.setCycleName(Constant.LOCAL.getA00479()); //周四
		cycles.add(cyle4);
		
		Cycle cyle5=new Cycle();
		cyle5.setCycleValue(5);
		cyle5.setCycleName(Constant.LOCAL.getA00480()); //周五
		cycles.add(cyle5);
		
		Cycle cyle6=new Cycle();
		cyle6.setCycleValue(6);
		cyle6.setCycleName(Constant.LOCAL.getA00481()); //周六
		cycles.add(cyle6);
		
		
		Cycle cyle7=new Cycle();
		cyle7.setCycleValue(7);
		cyle7.setCycleName(Constant.LOCAL.getA00482()); //周日
		cycles.add(cyle7);
		
		
		//获取计划未设定的周期
	    List<JhItem> jhItem=SqlConnect.getSqlMapInstance().queryForList("sel_jh_item",jhid);
		
	    JhItem tempJhItem;
	    
	    Cycle tempCycle;
	    
	    for (int i = 0; i < jhItem.size(); i++) {
	    	
	    	tempJhItem=jhItem.get(i);
	    	
	    	if(tempJhItem.getDay()==8){
	    		
	    		cycles.clear();
	    		
	    		break;
	    		
	    	}else{
	    		
	    		for (int j = 0; j < cycles.size(); j++) {
		    		
		    		tempCycle=cycles.get(j);
		    		
		    		if(tempJhItem.getDay() == tempCycle.getCycleValue()){
		    			
		    			cycles.remove(j);
		    			
		    		}
		    		
		    		
				}
	    		
	    		if(cycles.size()>0){
	    			for (int j = 0; j < cycles.size(); j++) {
	    				
	    				tempCycle=cycles.get(j);
	    				
	    				if(tempCycle.getCycleValue()==8){
			    			
			    			cycles.remove(j);
			    			
			    		}
	    				
	    			}
	    		}
	    		
	    	}
	    	
	    
		}
	   
	   
		
		return SUCCESS;
		
	}
	
	public int getJhid() {
		return jhid;
	}

	public void setJhid(int jhid) {
		this.jhid = jhid;
	}

	
}
