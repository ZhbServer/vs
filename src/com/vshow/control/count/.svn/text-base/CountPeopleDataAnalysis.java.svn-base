package com.vshow.control.count;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.*;

import org.apache.log4j.Logger;


import com.opensymphony.xwork.Action;

import com.vshow.control.data.CountPeopleData;
import com.vshow.control.tool.SqlConnect;

public class CountPeopleDataAnalysis{ 


	
	public static void countPeopleAnalysis(String mMac ,JSONObject mReportObject) throws SQLException{
		
		//转换为json
		//JSONObject jsonObject = JSONObject.fromObject(mReportObject);
		CountPeople countPeople=(CountPeople)JSONObject.toBean(mReportObject, CountPeople.class);
		
		if(countPeople!=null){
			List countPeopleArticleList=countPeople.getCountPeopleArticleList();
			MorphDynaBean md;
			CountPeopleData cp;
			for (int i = 0; i < countPeopleArticleList.size(); i++) {
				md=(MorphDynaBean)countPeopleArticleList.get(i);
				
				cp=new CountPeopleData();
				cp.setMark(mMac);
				cp.setCountDate((String)md.get("countDate"));
				cp.setCountPeople((Integer)md.get("countPeople"));
				
				
				try {
					Object object= md.get("countPeopleDetails");
					if(object!=null){
						JSONArray jsonArray = JSONArray.fromObject(object);
						//获取详细数据   性别 ,年龄
						String countPeopleDetails=jsonArray.toString();
						
						if(countPeopleDetails!=null){
							cp.setCountPeopleDetails(countPeopleDetails);
						}
				    }
					
				} catch (Exception e) {
					
				}
				
			
				
				 //List<CountPeopleDetails> list = JSONArray.toList(jsonArray, CountPeopleDetails.class);// 过时方法
				 
				 //for (int j = 0; j < list.size(); j++) {
				 //	  System.out.println(list.get(j).getAge());
				 //	  System.out.println(list.get(j).getSex());
				 //}
				
				
				
				
				
				SqlConnect.getSqlMapInstance().insert("add_count_people", cp);
				
			}
		}
		
		
	}
	
	
	
	
	



}
