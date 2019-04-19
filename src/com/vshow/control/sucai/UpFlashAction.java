package com.vshow.control.sucai;


import java.io.File;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class UpFlashAction implements Action {

	private String fileFileName;
	private File file;

   
	
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}



	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sf.format(new Date());
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		Sucai sucai = new Sucai();
		
		sucai.setUrid(urid);
		sucai.setType(5);
		sucai.setSdate(date);
		sucai.setName(fileFileName);
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		sucai.setLen(file.length());
		float sizem = (float) (file.length()) / 1024 / 1024;
		sucai.setSize(dcmFmt.format(sizem));
		String type = fileFileName
				.substring(fileFileName.lastIndexOf('.') + 1,
						fileFileName.length()).trim().toLowerCase();
		String tempname = Long.toString(System.currentTimeMillis())
				+ (int) (Math.random() * 100);
		String tempf = tempname + "." + type;
		sucai.setFilename(tempf);
		File temfs = new File(Constant.FILES + File.separator + tempf);
		
		file.renameTo(temfs);
		sucai.setName(sucai.getName().replaceAll("[~!%*|&@?=^#`]", ""));
		
		Integer sid=(Integer)sm.insert("add_sucai", sucai);
		//素材与分组建立关系
		ScGroupRelation sgr=new ScGroupRelation();
		
		
	    Integer gsid=(Integer)session.get("gsid");
	    if(gsid==null){
	    	gsid=0;
	    }
	    sgr.setSucaiid(sid);
	    sgr.setSucaigroupid(gsid);
		sm.insert("add_scgroup_relation", sgr);

		
		String snd = (String) session.get("logcontent");
		if (snd == null) {
			session.put("logcontent", fileFileName);
		}else{
			session.put("logcontent", snd + "," + fileFileName);
		}
		return SUCCESS;
	}



	public String getFileFileName() {
		return fileFileName;
	}

	public File getFile() {
		return file;
	}

}
