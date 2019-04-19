package com.vshow.control.count;

import java.util.ArrayList;
import java.util.List;

import com.vshow.control.tool.HttpRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TestJson {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
        CountPeople cp=new CountPeople();
        
        //标识
        cp.setClientMark("SS:FF:CC:EE:DF:GG");
        
        //统计条数
        List<CountPeopleArticle> countPeopleArticleList=new ArrayList<CountPeopleArticle>();
        
        
        CountPeopleArticle  cpa=new CountPeopleArticle();
        cpa.setCountDate("2017-06-02 10:03:00");
        cpa.setCountPeople(1);
        
        //统计详情
        List<CountPeopleDetails> countPeopleDetailsList=new ArrayList<CountPeopleDetails>();
        CountPeopleDetails cpd=new CountPeopleDetails();
        cpd.setAge(20);
        cpd.setSex(1);
        countPeopleDetailsList.add(cpd);
        
        
        cpa.setCountPeopleDetailsList(countPeopleDetailsList);
        
        countPeopleArticleList.add(cpa);
       
        
        
        cpa=new CountPeopleArticle();
        cpa.setCountDate("2017-06-02 11:05:00");
        cpa.setCountPeople(2);
        
        
        
        //统计详情
        countPeopleDetailsList=new ArrayList<CountPeopleDetails>();
        cpd=new CountPeopleDetails();
        cpd.setAge(22);
        cpd.setSex(1);
        countPeopleDetailsList.add(cpd);
        
        cpd=new CountPeopleDetails();
        cpd.setAge(25);
        cpd.setSex(1);
        countPeopleDetailsList.add(cpd);
        
        cpa.setCountPeopleDetailsList(countPeopleDetailsList);
        
        
        
        countPeopleArticleList.add(cpa);
        
        
        
        cp.setCountPeopleArticleList(countPeopleArticleList);
        
        JSONObject jsonObject = JSONObject.fromObject(cp);
		//System.out.println(jsonObject.toString());
		
		HttpRequest.sendPost("http://localhost:8512/vs/countPeopleDataInteract.vs", "dataInfos="+jsonObject.toString());
		
		
	}

}
