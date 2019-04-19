package com.vshow.control.interfaces;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolDownResource;
import com.vshow.control.protocol.ProtocolType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.VCommon;

public class DllTool {

	
	/**
	 * @param type  1文本  2图片0撤销清理
	 * @param showType  0 局部  1全屏
	 * @param dllPublic 协议值
	 * @return
	 */
	
	public static Protocol crarteSendDll(int type,int showType,DllPublic dllPublic){
		
		Protocol p=new Protocol();
		
		if(type==1||type==2){
			
			 List<DllPublic> mDlls=new ArrayList<DllPublic>();
			
			 if(type==1){
				 
				 DllTxt dt=(DllTxt)dllPublic;
				
				 mDlls.add(dt);
			 
			 }else if(type==2){
				 
	             DllMedia dm=(DllMedia)dllPublic;
				 
				 mDlls.add(dm);
				 
				 List<ProtocolDownResource>  protocolDownResourceList=new  ArrayList<ProtocolDownResource>();  //下载资源
				 //获取文本下载地址
				 ProtocolDownResource protocolDownResourceTemp =new ProtocolDownResource(); 
				 protocolDownResourceTemp.setDownType(0);
				 protocolDownResourceTemp.setDownUrl("http://"+Constant.IP+":"+VCommon.port4+"/"+dm.getFilesName());
				 protocolDownResourceTemp.setFileName(dm.getFilesName());
				 protocolDownResourceTemp.setVideoUnique("");
				 protocolDownResourceList.add(protocolDownResourceTemp);
			     p.setProtocolDownResourceList(protocolDownResourceList);
				 
				 
			 }
			 
			 InteractDll interactDll=new InteractDll();
			  
			 //interactDll.setType(type);
			 interactDll.setDllInteractType(type);
			  
			 interactDll.setShowType(showType);
			  
			 interactDll.setmDlls(mDlls);
			
		     p.setProtocolPlayBaseList(interactDll);
			
		     p.setDllInteractType(type);
			
		}else if(type==0){
			
			 p.setDllInteractType(type);
			
		}
		
		 p.setType(ProtocolType.TYPE67);
		
		 //打印json
		 JSONArray jsonArray = JSONArray.fromObject(p);
		
		 System.out.println(jsonArray.toString());
		  
		 return p;
		 
		 
	}
	
}
