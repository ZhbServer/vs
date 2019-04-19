package com.vshow.control.item.touch;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.vshow.control.data.program.ProgramAdapter;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.data.program.ProgramRecyder;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HtmlUtil;

/**
 * touch工具
 * @author w
 *
 */
public class TouchTool {

	/**
	 * 解析touchs集合 返回
	 * @param  touchsJson  json格式字符串  
	 * @param  mfile       节目文件名
	 * @return List<TouchInteractive>
	 */
	
	public static List<TouchInteractive>  analyzeTouchsJson(String touchsJson,String mfile){
		
		List<TouchInteractive> touchList=new ArrayList<TouchInteractive>();
		if(touchsJson==null||touchsJson.equals("[]")){
			
		}else{
			JSONArray array = JSONArray.fromObject(touchsJson);
			String path="";
			String ourdir = Constant.FILES + File.separator + mfile+ File.separator;
	        String alldir = Constant.FILES + File.separator;
	        String ourfi  = "";
			String allfi  = "";
			String txtcontent="";
			for(int z = 0; z < array.size(); z++){ 
				JSONObject jsonObject = array.getJSONObject(z); 
				TouchInteractive ti=(TouchInteractive)JSONObject.toBean(jsonObject, TouchInteractive.class);
				if(ti!=null){
					String tVideoPaths="";
					List resourcesList=ti.gettResourcesList();
					MorphDynaBean md;
					int type;
					for (int i = 0; i < resourcesList.size(); i++) {
						md=(MorphDynaBean)resourcesList.get(i);
						type=(Integer)md.get("type");
						if(type==1){
							path=(String)md.get("path");
							
							ourfi = ourdir + path;
							allfi = alldir + path;
							
							if (new File(ourfi).exists()) {
								
							} else if (new File(allfi).exists()) {
								try {
									FileInputStream fis = new FileInputStream(allfi);
									FileOutputStream fos = new FileOutputStream(ourfi);
									byte[] buff = new byte[1024];
									int readed = -1;
									while ((readed = fis.read(buff)) > 0)
										fos.write(buff, 0, readed);
									fis.close();
									fos.close();
									
								} catch (Exception e) {
								}
							}
							
							
						}else if(type==0){
							path=(String)md.get("path");
							
							if(tVideoPaths.length()==0){
								tVideoPaths=path;
							}else{
								tVideoPaths=tVideoPaths+"|"+path;
							}
						}else if(type==4){
							
							//System.out.println(md.get("path"));
						}else if(type==3){//文本
							
							txtcontent=(String)md.get("txtcontent");
							txtcontent=Constant.replaceAllSpan(txtcontent);
							txtcontent=Constant.replaceAllFont(txtcontent);  
							txtcontent=HtmlUtil.delHTMLTag(txtcontent);
							
							md.set("txtcontent", txtcontent);
						}
						
						
						
					}
					ti.settVideoPaths(tVideoPaths);
					touchList.add(ti);
					

					
				}
			
			} 
			
		}
		return touchList;
	}
	
	
	/**
	 * 过滤 获取当前元素下所有touch事件
	 * @param mId 当前元素id
	 * @param touchs 全部触摸时间
	 * @return List<TouchInteractive> 
	 */
	public static List<TouchInteractive> filterTouchs(String mId,List<TouchInteractive> touchs){
		List<TouchInteractive>  mTouchList=new ArrayList<TouchInteractive>();
		TouchInteractive ti;
		for (int j = 0; j < touchs.size(); j++) {
			ti=touchs.get(j);
			if(ti!=null){
				if(ti.gettCurrentId().equals(mId)){
					mTouchList.add(ti);
				}
				
				
			}
		}
		return mTouchList;
		
	} 
	
	
	
	/**
	 * 解析互动组集合
	 */
	
	public static List<ProgramRecyder> analysisInteractGroupJson(String jsonRecyclers,String mfile){
		
		List<ProgramRecyder> programRecyderList=new ArrayList<ProgramRecyder>();
		if(jsonRecyclers==null||jsonRecyclers.equals("[]")){
			
		}else{
			JSONArray array = JSONArray.fromObject(jsonRecyclers);
			
			String ourdir = Constant.FILES + File.separator + mfile+ File.separator;
	        String alldir = Constant.FILES + File.separator;
	        
			for(int z = 0; z < array.size(); z++){ 
				JSONObject jsonObject = array.getJSONObject(z); 
				ProgramRecyder ti=(ProgramRecyder)JSONObject.toBean(jsonObject, ProgramRecyder.class);
				
				List mAdapterList =ti.getmAdapterList();
				
				MorphDynaBean mb;
				List<String> videos=new ArrayList<String>();
				for (int i = 0; i < mAdapterList.size(); i++) {
					mb=(MorphDynaBean)mAdapterList.get(i);
					analysisFile(mb,ourdir,alldir,videos);
				}
				String videosStr="";
				for (String string : videos) {
					if(videosStr.length()==0){
						videosStr=string;
					}else{
						videosStr=videosStr+"|"+string;
					}
					
				}
				
				ti.setVideos(videosStr);
				programRecyderList.add(ti);
				
			}	
		}
		return programRecyderList;
		
		
	}
	
	//解析获取文件
	
	public static void  analysisFile(MorphDynaBean mb,String ourdir,String alldir,List<String> videos){
		
		    
		        String path;
		    	
		    	try {
		    		 path= mb.get("path")+"";
				} catch (Exception e) {
					path="";
				}
		    	
		    	if(!path.equals("")){
		    		copyFile(path,ourdir,alldir);
		    	}
		    	
		    	String mBackgroundFocused;
		    	try {
		    		mBackgroundFocused= mb.get("mBackgroundFocused")+"";
				} catch (Exception e) {
					mBackgroundFocused="";
				}
				
		    	if(!mBackgroundFocused.equals("")){
		    		copyFile(mBackgroundFocused,ourdir,alldir);
		    	}
		    	
		    	String mBackgroundSelected;
		    	try {
		    		mBackgroundSelected=mb.get("mBackgroundSelected")+"";
				} catch (Exception e) {
					mBackgroundSelected="";
				}
				
		    	if(!mBackgroundSelected.equals("")){
		    		copyFile(mBackgroundSelected,ourdir,alldir);
		    	}
		    	
		    	String mBackgroundPressedInput;
		    	try {
		    		mBackgroundPressedInput=mb.get("mBackgroundPressedInput")+"";
				} catch (Exception e) {
					mBackgroundPressedInput="";
				}
				if(!mBackgroundPressedInput.equals("")){
		    		copyFile(mBackgroundPressedInput,ourdir,alldir);
		    	}
				
				
		    	List<MorphDynaBean> mb2;
		    	try {
		    		mb2=(List<MorphDynaBean>) mb.get("mTouchList");
		 		} catch (Exception e) {
		 			mb2=new ArrayList();
		 		}
		    	
		    	if(mb2.size()>0){
					for (MorphDynaBean morphDynaBean : mb2) {
						String tTypeV;
						try {
							tTypeV=morphDynaBean.get("tType")+"";
				 		} catch (Exception e) {
				 			tTypeV="";
				 		}
						if(!tTypeV.equals("")) {
							
							  if(tTypeV.equals("2")){
							    	
								    List<MorphDynaBean> mbResource;
							    	try {
							    		mbResource=(List<MorphDynaBean>) morphDynaBean.get("tResourcesList");
							 		} catch (Exception e) {
							 			mbResource=new ArrayList<MorphDynaBean>();
							 		}
							 		
							    	for (MorphDynaBean morphDynaBeanV : mbResource) {
							    		String videoPaths;
							    		try {
							    			videoPaths=morphDynaBeanV.get("path")+"";
								 		} catch (Exception e) {
								 			videoPaths="";
								 		}
							    		
							    		videos.add(videoPaths);
										
									}
							    }else if(tTypeV.equals("9")){
							    	
							        List<MorphDynaBean> mbtResuource;
								    try {
								    	     mbtResuource=(List<MorphDynaBean>) morphDynaBean.get("tResourcesList");
								 	    } catch (Exception e) {
								 	    	mbtResuource=new ArrayList<MorphDynaBean>();
								 		}
								 		
								 		
							    	
									
									if(mbtResuource.size()>0){
										
										List<MorphDynaBean> mbmAdapterList;
										 try {
											 mbmAdapterList = (List<MorphDynaBean>)mbtResuource.get(0).get("mAdapterList");
								 	    } catch (Exception e) {
								 	    	mbmAdapterList=new ArrayList<MorphDynaBean>();
								 		}
								 	    
										
										for (MorphDynaBean mba : mbmAdapterList) {
											
											analysisFile(mba,ourdir,alldir,videos);
											
										}
									}
							    	
							    }
							
						}
					  
						
					}
				}
		   
		
			
	}
	
	public static void copyFile(String path,String ourdir,String alldir){
		
		String ourfi = ourdir + path;
		
		String allfi = alldir + path;
		
		if (new File(ourfi).exists()) {
			
		} else if (new File(allfi).exists()) {
			try {
				FileInputStream fis = new FileInputStream(allfi);
				FileOutputStream fos = new FileOutputStream(ourfi);
				byte[] buff = new byte[1024];
				int readed = -1;
				while ((readed = fis.read(buff)) > 0)
					fos.write(buff, 0, readed);
				fis.close();
				fos.close();
				
			} catch (Exception e) {
			}
		}
	}
		


	
	
}
