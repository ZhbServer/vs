package com.vshow.control.letv.cloud;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.VSEchoServerHandler;





public class LetvCloudUtil {
	
	
	public static String USER_UNIQUE = "94792e49d6";
    public static String SECRET_KEY =  "6cd4fabe9563a8f0892cd25d62c9009a";
    
	
	/**
	public static String USER_UNIQUE = "qgaegxbftq";
    public static String SECRET_KEY =  "ef725a97e3a6b8d171bc97f331dd8d9c";
    **/
	
  
    /**
     * 视频上传初始化
     * @throws Exception 
     */
    public static Map<String, String> cloudUp(String filename,File file) throws Exception{
    	  
    	Map map=new HashMap<String, String>();
    	LetvCloudSDK letvCloudSDK=new LetvCloudSDK(USER_UNIQUE, SECRET_KEY);
    	letvCloudSDK.format = "json";
        String response = letvCloudSDK.videoUploadInit(filename);
        //System.out.println("视频上传初始化:"+response);
        
    	if(response==null||response.equals("")){
    		 map.put("code", 1);
    	}else{
    		  JsonParser parser=new JsonParser();  //创建JSON解析器
    	      JsonObject object=(JsonObject) parser.parse(response);  //创建JsonObject对象
    	      int code=object.get("code").getAsInt();  //获取code  0表示数据正确
    	      if(code==0){
    	    	  JsonObject subObject=object.get("data").getAsJsonObject();
    	    	  String video_id=subObject.get("video_id").getAsString();
    	    	  String upload_url=subObject.get("upload_url").getAsString();
    	    	  
    	    	  map.put("video_id", video_id);
    	    	  
    	    	  //视频上传
    	    	  String responseUp =letvCloudSDK.videoUpload(file.getPath(),upload_url);
    	    	  System.out.println("responseUp: "+responseUp);
    	    	  map.put("responseUp", responseUp);
    	    	  object=(JsonObject) parser.parse(responseUp);  //创建JsonObject对象
        	      code=object.get("code").getAsInt();  //获取code  0表示数据正确
        	      if(code==0){
        	    	    //获取视频下载地址 (根据video_unique值    http://hangye.letv.com/play.php?v=video_unique )
        	    	    String video_unique=subObject.get("video_unique").getAsString();
        	    	    
        	    	    map.put("video_unique", video_unique);
        	    	    
        	    	    //String url="http://hangye.letv.com/play.php";
        	    	    //String param="v="+video_unique;
        	    	    //String downUrl=HttpRequest.sendGet(url, param);
        	    	    //System.out.println("downUrl:"+downUrl);
        	    	    //map.put("downUrl", downUrl);
        	    	  
        	      }
        	      
    	    	
    	    	  
        	      map.put("code", 0);
    	    	  
    	      }else{
    	    	  
    	    	  map.put("code", 1);
    	      }
    	     
    	      
    	        
    	}
    	map.put("responseInit", response);
    	
        return map;
    }
    
    
   
    
    
    /**
     * 删除视频
     */
    public static String delcloudUp(int videoid) throws Exception{
    	LetvCloudSDK letvCloudSDK=new LetvCloudSDK(USER_UNIQUE, SECRET_KEY);
    	letvCloudSDK.format = "json";
    	return letvCloudSDK.videoDel(videoid);
    }
    
    
    
    public static void main(String[] args) {
    	String url="http://hangye.letv.com/play.php";
	    String param="v="+"e085ffd80e";
	    String downUrl=HttpRequest.sendGet(url, param);
	    System.out.println("downUrl:"+downUrl);

	}
}
