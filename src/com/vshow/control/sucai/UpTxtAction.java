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
import com.vshow.control.data.UserSpace;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class UpTxtAction implements Action {

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
		sucai.setType(10);
		sucai.setSdate(date);
		fileFileName=fileFileName.replaceAll("\\'", "");
		sucai.setName(fileFileName);
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		sucai.setLen(file.length());
		float sizem = (float) (file.length()) / 1024 / 1024;
		String size=dcmFmt.format(sizem);
		if(size.equals("0.00")){
			size="0.01";
		}
		sucai.setSize(size);
		
		int flag = 0;
		Float userspaces = (Float) SqlConnect.getSqlMapInstance()
		.queryForObject("sel_us_total_uid", urid);
		if(userspaces !=null && userspaces > 0){
			Integer state = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_desc_state_byuid", urid);
			if(state != null && state == 0){
				float userSize = getUSTotal.doMain(urid); //获取总的用户存储空间大小
				if(userspaces < userSize + sizem){
					flag = 1;
				}
			}
		}
		
		if(flag == 1){
			return ERROR;
		}else{
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
			
			//读取文本内容
			String txtContent=FileHandle.readTxtFile(Constant.FILES + File.separator + tempf);
			
			sucai.setTxt_content(txtContent);
			Integer sid=(Integer)sm.insert("add_sucai_txt", sucai);
			//素材与分组建立关系
			ScGroupRelation sgr=new ScGroupRelation();
			
			
		    Integer gsid=(Integer)session.get("gsid");
		    if(gsid==null||gsid==-2){
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
	}



	public String getFileFileName() {
		return fileFileName;
	}

	public File getFile() {
		return file;
	}

}
