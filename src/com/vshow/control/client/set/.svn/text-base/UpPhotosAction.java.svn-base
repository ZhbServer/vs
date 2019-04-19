package com.vshow.control.client.set;

import java.io.File;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.UpFile;
import com.vshow.control.tool.VCommon;

public class UpPhotosAction extends ActionSupport {

	private File up;
	private String upFileName;
	private String key;

	public void setUp(File up) {
		this.up = up;
	}

	public void setUpFileName(String upFileName) {
		this.upFileName = upFileName;
	}

	public String execute() throws Exception {
		
		//通过key获取终端名
		key=key.replaceAll("\\-", "\\:");
		String cname=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_make_name_client",key);
		if(cname==null||"".equals(cname)){
			return ERROR;
		}else{
			
		    String keyfile = Constant.PHOTOS + File.separator + cname;
			
		    if (!new File(keyfile).exists()) {
				new File(keyfile).mkdirs();
			}
		    
			if (new File(keyfile + File.separator + upFileName).exists()) {
				new File(keyfile + File.separator + upFileName).delete();
			}
			up.renameTo(new File(keyfile + File.separator + upFileName));
			if (Constant.tky.length() == 17) {
				new UpFile(new File(keyfile + File.separator + upFileName),
						"http://" + Constant.svip + ":"+VCommon.port3+"/vs/upphotos.vs?key="
								+ key).start();
			}
			return SUCCESS;
		}
	}

	public void setKey(String key) {
		this.key = key;
	}
}
