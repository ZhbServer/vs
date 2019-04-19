package com.vshow.control.client.set;



import java.io.File;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.UpFile;
import com.vshow.control.tool.VCommon;

public class UpLogAction extends ActionSupport {

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
		
		String keyfile = Constant.LOG + File.separator + key;
		/*if (!new File(keyfile).exists()) {
			new File(keyfile).mkdir();
		}*/
		if (new File(Constant.LOG + File.separator + upFileName).exists()) {
			new File(Constant.LOG + File.separator + upFileName).delete();
		}
		up.renameTo(new File(Constant.LOG+ File.separator + upFileName));
		//if (Constant.tky.length() == 17) {
		//	new UpFile(new File(Constant.LOG + File.separator + upFileName),
		//			"http://" + Constant.svip + ":"+VCommon.port3+"/vs/uplog.vs?key="
		//					+ key).start();
		//}
		return SUCCESS;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
