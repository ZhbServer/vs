package com.vshow.control.item;

import java.io.File;
import java.io.FileOutputStream;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;


public class CreateCjTimeAction implements Action {

	private String sdate;
	private String edate;
	private String mfile;
	@Override
	public String execute() throws Exception {
		String dir = Constant.FILES + File.separator + mfile;
		File f;
		
		if (sdate == null || "".equals(sdate) || edate == null || ("00:00".equals(sdate)&&"00:00".equals(edate))||"".equals(edate))
		{
			if (new File(dir + File.separator + "cjtime.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "cjtime.txt");
			}
			
		} else {
			if (new File(dir + File.separator + "cjtime.txt").exists()) {
				FileHandle.deleteFile(dir + File.separator + "cjtime.txt");
			}
			f = new File(dir + File.separator + "cjtime.txt");
			FileOutputStream oldFileWriter = new FileOutputStream(f);
			oldFileWriter = new FileOutputStream(f);
			String str = sdate+"_"+edate;
			oldFileWriter.write(str.getBytes("UTF-8"));
			oldFileWriter.close();
		
		}
		return SUCCESS;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getMfile() {
		return mfile;
	}
	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

}
