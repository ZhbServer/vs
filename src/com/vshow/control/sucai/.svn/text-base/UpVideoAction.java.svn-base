package com.vshow.control.sucai;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;
import com.vshow.control.data.UserSpace;
import com.vshow.control.letv.cloud.LetvCloudUtil;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.MainReCeMsgHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class UpVideoAction implements Action {

	private String fileFileName;
	private File file;
	private int end;
	private int jm;
	private String endJm;

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}
	Logger logger  =  Logger.getLogger(UpVideoAction.class);
	public String execute() throws Exception {
		fileFileName=fileFileName.replaceAll("\\-","").replaceAll("_", "");
		if(endJm==null||"".equals(endJm)){
			endJm="0_15";
		}
		String[] ej = endJm.split("\\_");
		jm = Integer.parseInt(ej[0]);
		end = Integer.parseInt(ej[1]);
		if (end == 0) {
			end = 15;
		}
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sf.format(new Date());
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		Sucai sucai = new Sucai();
		sucai.setUrid(urid);
		sucai.setType(3);
		sucai.setSdate(date);
		fileFileName=fileFileName.replaceAll("\\'", "").replaceAll("\\[", "")
		             .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");
		sucai.setName(fileFileName);
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		float sizem = (float) (file.length()) / 1024 / 1024;
		sucai.setSize(dcmFmt.format(sizem));
		
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
			
			
			
			
	
			// 加密
			String jm1="";
			if(jm==1){
			   jm1=(int) (file.length()+1734)+"";
			   sucai.setLen(file.length()+1734);
			   if (file.length() + "".length() >= 4) {
					jm1 = jm1.substring(jm1.length() - 4, jm1.length());
			   } else {
					jm1 = "0000";
			   }
			   tempname = replaceString(tempname, jm1.substring(0, 1), 0);
			   tempname = replaceString(tempname, jm1.substring(1, 2), 2);
			   tempname = replaceString(tempname, jm1.substring(2, 3), 4);
			   tempname = replaceString(tempname, jm1.substring(3), 6);
			}else{
			   //jm1 = file.length() + "";
			   sucai.setLen(file.length());
			}
			
			
			String tempf = tempname + "." + type;
			String temjm = "";
	
			File temfs = new File(Constant.FILES + File.separator + tempf);
	
			file.renameTo(temfs);
			
			com.vshow.control.tool.DoVideo.Do(Constant.FILES
					+ File.separator + tempf, Constant.FILES + File.separator
					+ tempname + "_.flv", end);
			
			
			//com.vshow.control.tool.DoVideo.DoMP4(Constant.FILES
			//		+ File.separator + tempf, Constant.FILES + File.separator
			//		+ tempname + "_.mp4", end);
			
			
			//截取图片
			int stime=  com.vshow.control.tool.DoVideo.SnapVideoImage_Duration(Constant.FILES
					+ File.separator + tempf, Constant.FILES + File.separator
					+ tempname + "_.jpg");
			
			
			sucai.setStime(stime);
			sucai.setName(sucai.getName().replaceAll("[~!%*|&@?=^#`$']", ""));
			
			
	
	
			if (jm == 1) {
				temjm = tempf.substring(0, tempf.lastIndexOf('.')) + ".jm";
				
				File ff = new File(Constant.FILES + File.separator + temjm);
				if (!ff.exists()) {
					FileInputStream is = new FileInputStream(Constant.FILES
							+ File.separator + tempf);
					FileOutputStream fos = new FileOutputStream(ff);
	
					byte[] tvb = new byte[1734];
					tvb[0] = 't';
					tvb[1] = 'f';
					tvb[32] = '9';
					tvb[55] = 'g';
					tvb[212] = 'z';
					tvb[928] = 'o';
					tvb[1541] = 'p';
					tvb[1675] = '6';
					fos.write(tvb, 0, 1734);
	
					byte[] buffer = new byte[4096];
					int readLen = 0;
					while ((readLen = is.read(buffer, 0, 4096)) >= 0) {
						fos.write(buffer, 0, readLen);
					}
					fos.close();
					is.close();
					
				}
				tempf = temjm;
				
			}
	
			sucai.setFilename(tempf);
			
			if(Constant.UPVIDEOCLOUDTYPE==1){
				Map map=LetvCloudUtil.cloudUp(sucai.getFilename(),temfs);
				int code=Integer.parseInt(map.get("code")+"");
				if(code==0){
					SucaiCloud scCloud=new SucaiCloud();
					String video_unique=map.get("video_unique")+"";
					scCloud.setFilename(tempf);
					scCloud.setDownurl(video_unique);
					
					scCloud.setVideoid((String)map.get("video_id"));
					String responseInit=(String)map.get("responseInit");
					scCloud.setResultdata(responseInit);
					sm.delete("del_sucaiCloud_videoid", (String)map.get("video_id"));
					scCloud.setCloudtype(1);
					sm.insert("add_sucaiCloud", scCloud);
				    //new UpThreadDownUrl("http://hangye.letv.com/play.php", "v="+video_unique, scCloud.getVideoid()).start();
					temfs.delete();
				}
				logger.info("letvUp[responseInit]:"+(String)map.get("responseInit"));
				logger.info("letvUp[responseUp]:"+(String)map.get("responseUp"));
			}else{
				SucaiCloud scCloud=new SucaiCloud();
				scCloud.setFilename(tempf);
				String downUrl=tempf;
				scCloud.setDownurl(downUrl);
				scCloud.setVideoid(tempf);
				scCloud.setResultdata("");
				scCloud.setCloudtype(0);
				sm.delete("del_sucaiCloud_videoid", tempf);
				sm.insert("add_sucaiCloud", scCloud);
				
			}
			
			
			Integer sid = (Integer) sm.insert("add_sucai", sucai);
			
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

	public String replaceString(String str, String rstr, int startIndex) {
		if (startIndex > str.length() - 1) {
			// throw new ArrayIndexOutOfBoundsException("越界了");
		}
		String preStr = str.substring(0, startIndex);
		String subStr = str.substring(startIndex + 1);
		return preStr + rstr + subStr;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public File getFile() {
		return file;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getJm() {
		return jm;
	}

	public void setJm(int jm) {
		this.jm = jm;
	}

	public String getEndJm() {
		return endJm;
	}

	public void setEndJm(String endJm) {
		this.endJm = endJm;
	}

}
