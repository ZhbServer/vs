package com.vshow.control.jiankong;



import java.io.File;
import java.util.List;
import java.util.Map;



import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.JianKong;

import com.vshow.control.tool.Constant;


import com.vshow.control.tool.SqlConnect;

public class SelJkListAction extends ActionSupport {
	
	
	private List<JianKong> jkList;
	
	private int rotate=0;
	
	

	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		int uid = (Integer) session.get("urid");
		
		jkList=SqlConnect.getSqlMapInstance().queryForList("sel_jk_last_list", uid);
		
	    for (JianKong jk : jkList) {
	    	
	    	File file = new File(Constant.SEE +File.separator +jk.getFilename());
	    	
			if (file.exists()) { // 判断文件是否存在
				
			}else{
				
				jk.setFilename("unfile.png");
				
			}
			
		}
		
		return SUCCESS;
	}

	public List<JianKong> getJkList() {
		return jkList;
	}

	public void setJkList(List<JianKong> jkList) {
		this.jkList = jkList;
	}

	public int getRotate() {
		return rotate;
	}

	public void setRotate(int rotate) {
		this.rotate = rotate;
	}
}
