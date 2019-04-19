package com.vshow.control.init;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Language;
import com.vshow.control.publics.PublicAction;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.VVersion;

public class ToLoginAction extends ActionSupport {
	
	
	/**选择语言集合*/
	private List<Language> indexlangs=new ArrayList<Language>();  
	
	private String version;

	/**初始化进入登陆页面*/
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		session.put("local", Constant.LOCAL);
		
		String[] iis = Constant.INDEXLANG.split("\\_");
		
		Language le;
		
		String[] tempis;
		
		for (int i = 0; i < iis.length; i++) {
			
			tempis = iis[i].split("\\|");
			
			if (tempis.length == 2) {
				le = new Language();
				le.setLshow(tempis[0]);
				le.setLvalue(tempis[1]);
				indexlangs.add(le);
			}
			
		}
		
		version=VVersion.versions;
		
		return SUCCESS;
	}
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public void setIndexlangs(List<Language> indexlangs) {
		this.indexlangs = indexlangs;
	}

	public List<Language> getIndexlangs() {
		return indexlangs;
	}
}
