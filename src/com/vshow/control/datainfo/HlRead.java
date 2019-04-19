package com.vshow.control.datainfo;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.vshow.control.data.DataHl;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.SqlConnect;

public class HlRead {
  public static void getHl(){
	  //SqlMapClient sm = SqlConnect.getSqlMapInstance();
	  try{
         
		 //获取接口数据
         String result=HttpRequest.sendGet(Constant.HLURL, "");
         
         //解析存入数据库
         //Map resultMap=JsonHelper.toMap(result);
         List<JSONObject> joList=ParseJson(result);
         
         DataHl dataHl;
         for (JSONObject jsonObject : joList) {
        	 dataHl=new DataHl();
        	 dataHl.setName(jsonObject.getString("name"));   //货币名称
        	 dataHl.setfBuyPrice(jsonObject.getString("fBuyPri")); //现汇买入价
        	 dataHl.setmBuyPrice(jsonObject.getString("mBuyPri")); //现钞买入价
        	 dataHl.setfSellPrice(jsonObject.getString("fSellPri")); //现汇卖出价
        	 dataHl.setmSellPrice(jsonObject.getString("mSellPri")); //现钞卖出价
        	 dataHl.setBankConversionPrice(jsonObject.getString("bankConversionPri"));//银行折算价/中间价
             dataHl.setSdate(jsonObject.getString("date"));//发布日期
             dataHl.setStime(jsonObject.getString("time"));//发布时间
             dataHl.setSymbol(jsonObject.getString("name"));
             SqlConnect.getSqlMapInstance().delete("del_data_hl", dataHl.getName());
             SqlConnect.getSqlMapInstance().insert("insert_data_hl", dataHl);
		 }
         
         
         //System.out.println(result);
         
	 
          
      }catch (Exception e) {
         
      }

  }
  
  /**
   * 解析Json数据
   * 
   * @param jsonString
   *            Json数据字符串
   * @throws JSONException
   * @throws ParseException
   */
  public static List<JSONObject> ParseJson(String jsonString) throws JSONException,
          ParseException {

	
	  String  resultcode =  new JSONObject(jsonString).getString("resultcode");
	  List<JSONObject> joList=new ArrayList<JSONObject>();
	  if(resultcode.equals("200")){
		  JSONArray ja =  new JSONObject(jsonString).getJSONArray("result");
	      Iterator<String> its=new JSONObject(ja.getString(0)).sortedKeys();
	      JSONObject jo;
	      
	      while(its.hasNext()){    	
	    	 jo = new JSONObject(ja.getString(0)).getJSONObject(its.next());
	    	 joList.add(jo);
	      }
	  }
	 
      return joList;
    

  }
}
