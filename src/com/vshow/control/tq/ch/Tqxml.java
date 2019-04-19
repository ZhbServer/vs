
package com.vshow.control.tq.ch;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.vshow.control.data.Tq;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class Tqxml {
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
		String city="";
		String json="";
		String unicodeJson="";
		for (int i = 0; i < list.size(); i++) {
			wr = list.get(i);
			
			if(wr.getType()==0){
			try {

				city=URLEncoder.encode(wr.getCode(), "UTF-8");
				//city=URLEncoder.encode("延吉", "UTF-8");
				HttpURLConnection huc = (HttpURLConnection) new URL("http://api.map.baidu.com/telematics/v3/weather?location="+city+"&output=json&ak="+Constant.WEATHERKEY).openConnection();
				huc.setRequestMethod("GET");
				huc.setUseCaches(true);
				huc.connect();
				InputStream is = huc.getInputStream();
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(is, "utf-8"));
				StringBuffer temp = new StringBuffer();
				String str;
				while ((str = reader.readLine()) != null) {
					temp.append(str + "\n");
				}
				json = temp.toString();
				wr.setWdata(json);
				unicodeJson=UnicodeToString(json);
				JSONObject jsonObject = JSONObject.fromObject(unicodeJson);
				
				JSONArray ja=jsonObject.getJSONArray("results");
				jsonObject = JSONObject.fromObject(ja.get(0));
				JSONArray data=jsonObject.getJSONArray("weather_data");
				wr.setCity(jsonObject.getString("currentCity"));
				
			    JSONObject info=data.getJSONObject(0);
			    JSONObject info2=data.getJSONObject(1);
				
				String content = info.getString("temperature")+"|"+info2.getString("temperature");
			
				wr.setContent(content);
				
				
				String[] days = new String[2];
				days[0] = info.getString("weather");
				days[1] = info2.getString("weather");
				wr.setDay(days[0] + "|" + days[1]);
				String gifs = "";

				for (int j = 0; j < days.length; j++) {
					if (days[j].indexOf(CLOUDY) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_cloudy.png";
						} else {
							gifs = gifs + "|w_cloudy.png";
						}
					} else if (days[j].indexOf(OVERCAST) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_overcast.png";
						} else {
							gifs = gifs + "|w_overcast.png";
						}
					} else if (days[j].indexOf(RAIN) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_rain.png";
						} else {
							gifs = gifs + "|w_rain.png";
						}

					} else if (days[j].indexOf(SNOW) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_snow.png";
						} else {
							gifs = gifs + "|w_snow.png";
						}

					} else if (days[j].indexOf(HAZE) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_haze.png";
						} else {
							gifs = gifs + "|w_haze.png";
						}
					} else if (days[j].indexOf(FOG) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_fog.png";
						} else {
							gifs = gifs + "|w_fog.png";
						}
					} else if (days[j].indexOf(CLEAR) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_clear.png";
						} else {
							gifs = gifs + "|w_clear.png";
						}
					} else if (days[j].indexOf(THUR) != -1) {
						if ("".equals(gifs)) {
							gifs = "w_thunderstorms.png";
						} else {
							gifs = gifs + "|w_thunderstorms.png";
						}
					}
				}

				wr.setGif(gifs);
				sm.update("update_tqyb", wr);
				is.close();
				reader.close();

			} catch (Exception e) {
	
			}
			
			}
		}

	}
	 public static String UnicodeToString(String str){
		  Pattern pattern=Pattern.compile("(\\\\u(\\p{XDigit}{4}))");
		  Matcher mather=pattern.matcher(str);
		  char ch;
		  while (mather.find()) {
		  ch=(char)Integer.parseInt(mather.group(2),16);
		  str=str.replace(mather.group(1), ch+"");
		  }
		  return str;
	}
}
