package com.vshow.control.interfaces;

import java.util.ArrayList;
import java.util.List;

import com.vshow.control.protocol.Protocol;
import com.vshow.control.protocol.ProtocolType;

import net.sf.json.JSONArray;

public class DllTest {
  
	 
	 public static void main(String[] args) {
		
		  List<DllPublic> mDlls=new ArrayList<DllPublic>();
		 
		  //图片
		  DllMedia dm=new DllMedia();
	
		  dm.setFilesName("123.png");
		  
		  dm.setPath("123.png");
		  
		  dm.setSname("123");
		  
		  dm.setType(1);
		  
		  dm.setTimeoutMillis(5);
		  
		  dm.setInAnim(6);
		  
		  mDlls.add(dm);
		  
		  
		  //文本
		  DllTxt dtxt=new DllTxt();
		  dtxt.setBcolor("0");
		  dtxt.setFcolor("-16777216");
		  dtxt.setFs(15);
		  dtxt.setTxtcontent("文本内容...");
		  
		  dtxt.setTitleContent("文本标题...");
		  dtxt.setTitleFcolor("-16777216");
		  dtxt.setTitleFs(20);
		  
		  mDlls.add(dtxt);
		  
		  
		  InteractDll interactDll=new InteractDll();
		  
		  interactDll.setDllInteractType(1);
		  
		  interactDll.setShowType(1);
		  
		  interactDll.setmDlls(mDlls);
		  
		  
	      Protocol p=new Protocol();
	      
	      p.setType(ProtocolType.TYPE67);
	      
	      p.setProtocolPlayBaseList(interactDll);
	      
	      p.setDllInteractType(3);
		  
		  
		  //打印json
		  JSONArray jsonArray = JSONArray.fromObject(p);
		
		  System.out.println(jsonArray.toString());
		  
		  
	}
	
}
