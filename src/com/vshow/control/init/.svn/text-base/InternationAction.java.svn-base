package com.vshow.control.init;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Language;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GetLocal;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.VVersion;

public class InternationAction extends ActionSupport {
	private String zv;
	/**选择语言集合*/
	private List<Language> indexlangs=new ArrayList<Language>();  
	
	private String version;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();	
		
		
		GetLocal gl = new GetLocal();
		Local local = gl.getLocal(zv);
		Constant.LOCAL=local;
		session.put("local", local);
		indexlangs = new ArrayList<Language>();
		String[] iis = Constant.INDEXLANG.split("\\_");
		for (int i = 0; i < iis.length; i++) {
			String[] tempis = iis[i].split("\\|");
			if (tempis.length == 2) {
				Language le = new Language();
				le.setLshow(tempis[0]);
				le.setLvalue(tempis[1]);
				indexlangs.add(le);
			}
		}
		version=VVersion.versions;
		return SUCCESS;
	}
	public String getZv() {
		return zv;
	}

	public void setZv(String zv) {
		this.zv = zv;
	}

	public List<Language> getIndexlangs() {
		return indexlangs;
	}

	public void setIndexlangs(List<Language> indexlangs) {
		this.indexlangs = indexlangs;
	}
}
