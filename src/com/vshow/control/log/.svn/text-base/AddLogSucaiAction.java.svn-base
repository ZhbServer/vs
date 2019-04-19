package com.vshow.control.log;

import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;


/**
 * 添加上传日志
 * **/
public class AddLogSucaiAction implements Action {

	
	
	private int sucaiType;//1 背景 2音频 3视频 4图片 5FLASH 6PPT 7Word 8Excel 9PDF 10文本
	
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		/**/
		int urid = (Integer) session.get("urid");
		String snd = (String) session.get("logcontent");
		
		
		if(snd!=null)
		{
			snd=snd.replaceAll("[~!%*|&@?=^#`]", "");
			
			String content="";
						
		
			if(sucaiType==1){
				content=Constant.LOCAL.getA00058();
			}else if(sucaiType==4){
				content=Constant.LOCAL.getA00061();
			}else if(sucaiType==3){
				content=Constant.LOCAL.getA00060();
			}else if(sucaiType==2){
				content=Constant.LOCAL.getA00059();
			}else if(sucaiType==5){
				content="FLASH";
			}else if(sucaiType==6){
				content="PPT";
			}else if(sucaiType==7){
				content="Word";
			}else if(sucaiType==8){
				content="Excel";
			}else if(sucaiType==9){
				content="PDF";
			}else if(sucaiType==10){
				content=Constant.LOCAL.getA00062();
			}
			if(!"".equals(content)){
				LogHandle.insertTheLog(LogType.type1, urid,Constant.LOCAL.getA00063() + content+":" + snd,1,1);	
			}			
		}

		session.remove("logcontent");
		return SUCCESS;
	}
	
	public void setSucaiType(int sucaiType) {
		this.sucaiType = sucaiType;
	}

}
