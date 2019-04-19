package com.vshow.control.tq.en;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import com.ibatis.sqlmap.client.SqlMapClient;

import com.vshow.control.data.Tq;
import com.vshow.control.data.tq.TqCity;
import com.vshow.control.data.tq.TqCityContent;
import com.vshow.control.data.tq.TqData;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.TranslateUtil;
import com.vshow.control.tool.translate.TransApi;
import com.wxapi.WxApiCall.WxApiCall;
import com.wxapi.model.RequestModel;

public class EnTqxml {
	
	
	public static String gwUrl="https://way.jd.com/he/freeweather";
	
	public static String appkey="105b6c966803f08e9c6814f7df63efda";
	
	private final String CLEAR = "晴";
	private final String RAIN = "雨";
	private final String SNOW = "雪";
	private final String CLOUDY = "云";
	private final String THUR = "雷";
	private final String FOG = "雾";
	private final String HAZE = "霾";
	private final String OVERCAST = "阴";
	
	public void doTq() throws Exception {

		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		List<Tq> list = sm.queryForList("get_tqyb");
		
		Tq wr;
		
		HttpRequest request;
		
		String requestContent;
		
		String dayPictureUrl="";
		
		for (int i = 0; i < list.size(); i++) {
			
			wr = (Tq) list.get(i);
			
			if(wr.getType()==1){
				if(wr!=null){
					
					//获取结果
					requestContent=(String)HttpRequest.sendGet(gwUrl, "appkey="+appkey+"&city="+wr.getCity());
					
					
					
					
					if(requestContent!=null&&!requestContent.equals("")){
						
						wr.setWdata(requestContent);
						
						JSONObject jsonObject = JSONObject.fromObject(requestContent);
						
						if(jsonObject.getString("code").equals("10000")){
							
							JSONObject  resultsJsonObject= JSONObject.fromObject(jsonObject.getJSONObject("result").getJSONArray("HeWeather5").get(0));
							
							JSONArray  daily_forecastArray=resultsJsonObject.getJSONArray("daily_forecast");
							
							String gif="";   //天气图片 多个用|分割
							
							String day="";   //天气说明 多个用|分割
							
							String content="";  //温度范围 多个用|分割
							
							//保留2天天气
							for (int k = 0; k < 2; k++) {
								
								String tempMax=JSONObject.fromObject(daily_forecastArray.get(k)).getJSONObject("tmp").getString("max");
								
								String tempMin=JSONObject.fromObject(daily_forecastArray.get(k)).getJSONObject("tmp").getString("min");
								
								if(content.equals("")){
									content=tempMin+"~"+tempMax+"℃";
								}else{
									content=content+"|"+tempMin+"~"+tempMax+"℃";
								}
								
								String tempDay=JSONObject.fromObject(daily_forecastArray.get(k)).getJSONObject("cond").getString("txt_d");
								
								String wind=JSONObject.fromObject(daily_forecastArray.get(k)).getJSONObject("wind").getString("dir");
								
								if(day.equals("")){
									//day=TranslateUtil.translate(tempDay,TranslateUtil.ENGLISH);
									//day=tempDay;
									day=TransApi.getTransResultEn(tempDay);
								}else{
									//day=day+"|"+tempDay;
									day=day+"|"+TransApi.getTransResultEn(tempDay);
									
									//day=day+"|"+TranslateUtil.translate(tempDay,TranslateUtil.ENGLISH);
								}
								
								
								if (tempDay.indexOf(CLOUDY) != -1) {
									if ("".equals(gif)) {
										gif = "w_cloudy.png";
										dayPictureUrl="wu.png";
									} else {
										gif = gif + "|w_cloudy.png";
									}
								} else if (tempDay.indexOf(OVERCAST) != -1) {
									if ("".equals(gif)) {
										gif = "w_overcast.png";
										dayPictureUrl="yin.png";
									} else {
										gif = gif + "|w_overcast.png";
									}
								} else if (tempDay.indexOf(RAIN) != -1) {
									if ("".equals(gif)) {
										gif = "w_rain.png";
										dayPictureUrl="yu";
									} else {
										gif = gif + "|w_rain.png";
									}

								} else if (tempDay.indexOf(SNOW) != -1) {
									if ("".equals(gif)) {
										gif = "w_snow.png";
										dayPictureUrl="xue";
									} else {
										gif = gif + "|w_snow.png";
									}

								} else if (tempDay.indexOf(HAZE) != -1) {
									if ("".equals(gif)) {
										gif = "w_haze.png";
										dayPictureUrl="mai.png";
									} else {
										gif = gif + "|w_haze.png";
									}
								} else if (tempDay.indexOf(FOG) != -1) {
									if ("".equals(gif)) {
										gif = "w_fog.png";
										dayPictureUrl="wu.png";
									} else {
										gif = gif + "|w_fog.png";
									}
								} else if (tempDay.indexOf(CLEAR) != -1) {
									if ("".equals(gif)) {
										gif = "w_clear.png";
										dayPictureUrl="qing.png";
									} else {
										gif = gif + "|w_clear.png";
									}
								} else if (tempDay.indexOf(THUR) != -1) {
									if ("".equals(gif)) {
										gif = "w_thunderstorms.png";
										dayPictureUrl="lei";
									} else {
										gif = gif + "|w_thunderstorms.png";
									}
								}
								
								if(k==0){
									
									
									
									TqCityContent tqCityContent=new TqCityContent();
									
									tqCityContent.setTemperature(content);
									tqCityContent.setWeather(day);
									tqCityContent.setDayPictureUrl(dayPictureUrl);
									//tqCityContent.setWind(TransApi.getTransResultEn(wind));
									tqCityContent.setWind("");
									TqCity tqCity=new TqCity();
									
									List<TqCityContent> weather_data=new ArrayList<TqCityContent>();
									weather_data.add(tqCityContent);
									tqCity.setWeather_data(weather_data);
									tqCity.setCurrentCity(wr.getCity());
									
									
									TqData tqData=new TqData();
									
									tqData.setError(0);
									tqData.setStatus("success");
									tqData.setDate(DateUtil.getDay());
									List<TqCity> results=new ArrayList<TqCity>();
									results.add(tqCity);
									tqData.setResults(results);
									
									JSONObject job = JSONObject.fromObject(tqData);
									wr.setWdata(job.toString());
									
								}
								
							}
							
							wr.setContent(content);
							wr.setGif(gif);
							wr.setDay(day);
							
							sm.update("update_tqyb", wr);
							
							
						}
					}
				
				
			}
			
			
				
				
				
				
			}
			
	
			
			
		}
	}
	
	

    public static void main(String[] args) throws Exception {
    	 new EnTqxml().doTq();
	}


}
