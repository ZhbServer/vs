package com.vshow.control.item;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;

public class SeeSceneAction implements Action {

	private String seecontent;
	private String mfile;

	public void setSeecontent(String seecontent) {
		this.seecontent = seecontent;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public String getMfile() {
		return mfile;
	}

	public String execute() throws Exception {
		String ourdir = Constant.FILES + File.separator + mfile + File.separator;
		File ff = new File(ourdir + "jqfont.js");
		if (!ff.exists()) {
			try {
				FileInputStream fis = new FileInputStream(Constant.EXE
						+ File.separator + "jqfont.js");
				FileOutputStream fos = new FileOutputStream(ff);
				byte[] buff = new byte[1024];
				int readed = -1;
				while ((readed = fis.read(buff)) > 0)
					fos.write(buff, 0, readed);
				fis.close();
				fos.close();
			} catch (Exception e) {
			}
		}

		ff = new File(ourdir + "jqfont2.js");
		if (!ff.exists()) {
			try {
				FileInputStream fis = new FileInputStream(Constant.EXE
						+ File.separator + "jqfont2.js");
				FileOutputStream fos = new FileOutputStream(ff);
				byte[] buff = new byte[1024];
				int readed = -1;
				while ((readed = fis.read(buff)) > 0)
					fos.write(buff, 0, readed);
				fis.close();
				fos.close();
			} catch (Exception e) {
			}
		}

		mfile = mfile.trim();
		File f = new File(Constant.FILES + File.separator + mfile + File.separator
				+ "see.html");
		FileOutputStream oldFileWriter = new FileOutputStream(f);
		oldFileWriter.write(seecontent.getBytes("UTF-8"));
		oldFileWriter.close();
		return SUCCESS;
	}

}
