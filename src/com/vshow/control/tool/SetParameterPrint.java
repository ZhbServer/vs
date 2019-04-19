package com.vshow.control.tool;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.vshow.control.data.SystemInfo;



public class SetParameterPrint {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Map<String,String> map=new HashMap<String, String>();
		try {
			getReflect(new VVersion(),map);
			
			getReflect(new Constant(),map);
			
			getReflect(new SystemInfo(),map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}
	
	public static void getReflect(Object model,Map<String,String> map) throws Exception{
		String fieldName="";
		
		for (Field field : model.getClass().getDeclaredFields()) {
		      field.setAccessible(true);
		   
		      fieldName=field.getName();
		      if(fieldName.equals("lType")||fieldName.equals("lCheck")||fieldName.equals("lUsername")||fieldName.equals("lPassword")
		         ||fieldName.equals("NetJmInitUrl")||fieldName.equals("NetJmAddUrl")||fieldName.equals("NetJmDelUrl")){
		    	  
		      }else{
		    	  //System.out.println(fieldName + ":" + field.get(model) );
		    	  map.put(fieldName, field.get(model)+"");
		      }	  		    
		}
		
		
	}

}
