package com.vshow.control.data.program;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class ProgramRecyderMain {
	public static void main(String[] args) {
         
		ProgramRecyder pr=new ProgramRecyder();
		
		pr.setId("r1");
		
		List<ProgramAdapter> mAdapterList = new ArrayList<ProgramAdapter>();
		
		ProgramAdapter pa=new ProgramAdapter();
		
		pa.setPath("1.png");
		
		
		List<TouchInteractive> mTouchList=new ArrayList<TouchInteractive>();
		
		TouchInteractive ti=new TouchInteractive();
		ti.settOnclick(9);
		ti.settType(9);
		
		
		List<TouchBasis> tResourcesList=new ArrayList<TouchBasis>();
		
		tResourcesList.add(pr);
		
		ti.settResourcesList(tResourcesList);
		mTouchList.add(ti);
		pa.setmTouchList(mTouchList);
		
		
		mAdapterList.add(pa);
		pr.setmAdapterList(mAdapterList);
		
		
		JSONArray jsonArray = JSONArray.fromObject(pr);
		System.out.println(jsonArray.toString());
          
          
	}
	
	
	
	//创建recyder
	public static ProgramRecyder createRecyder(String recyderId){
		
		ProgramRecyder pr=new ProgramRecyder();
		//id区分对象
		pr.setId(recyderId);
	
		//加载播放资源
		List<ProgramAdapter> mAdapterList = new ArrayList<ProgramAdapter>();
		
		if(recyderId.equals("rd1")){
			
			mAdapterList.add(createAdapter("show1.png"));
		}
		
		pr.setmAdapterList(mAdapterList);
		
		return pr;
		
		
	}
	
	public static ProgramAdapter createAdapter(String path){
		
		ProgramAdapter pa=new ProgramAdapter();
		pa.setPath(path);
		
		
		//是否有下级 或者触摸时间
		List<TouchInteractive> mTouchList=new ArrayList<TouchInteractive>();
		TouchInteractive ti=new TouchInteractive();
		
		
		
		List<TouchBasis> tResourcesList=new ArrayList<TouchBasis>();
		
		
		
		tResourcesList.add(createRecyder("rd2"));
		ti.settResourcesList(tResourcesList);
		mTouchList.add(ti);
		
		pa.setmTouchList(mTouchList);
		return pa;
		
		
	}
	
	
	// 解析播放资源
	
	public static ProgramMedia crarteMedia(){
		
		ProgramMedia pm=new ProgramMedia();
		pm.setSname("1.mp4");
		return pm;
		
	}
	
	

}
