package com.vshow.control.sucai;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class UpExcelAction implements Action {

	private String fileFileName;
	private File file;
	private int xuan;

	public void setXuan(int xuan) {
		this.xuan = xuan;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setFile(File file) {
		this.file = file;
	}


	public void rotateImg(File fstr, int degree) throws IOException {
		BufferedImage image = ImageIO.read(fstr);
		int iw = image.getWidth();
		int ih = image.getHeight();
		int w = 0;
		int h = 0;
		int x = 0;
		int y = 0;
		degree = degree % 360;
		if (degree < 0)
			degree = 360 + degree;
		double ang = Math.toRadians(degree);

		if (degree == 180 || degree == 0 || degree == 360) {
			w = iw;
			h = ih;
		} else if (degree == 90 || degree == 270) {
			w = ih;
			h = iw;
		} else {
			int d = iw + ih;
			w = (int) (d * Math.abs(Math.cos(ang)));
			h = (int) (d * Math.abs(Math.sin(ang)));
		}

		x = (w / 2) - (iw / 2);
		y = (h / 2) - (ih / 2);
		int ty=image.getType();
		if(ty==0)
		{
			ty=BufferedImage.TYPE_INT_ARGB;
		}
		BufferedImage rotatedImage = new BufferedImage(w, h,ty);
		Graphics2D gs = (Graphics2D) rotatedImage.getGraphics();
		gs.setColor(Color.WHITE);
		gs.fillRect(0, 0, w, h);
		gs.dispose();
		AffineTransform at = new AffineTransform();
		at.rotate(ang, w / 2, h / 2);
		at.translate(x, y);
		AffineTransformOp op = new AffineTransformOp(at,
				AffineTransformOp.TYPE_BICUBIC);
		op.filter(image, rotatedImage);
		FileOutputStream out = new FileOutputStream(fstr);
		ImageIO.write(rotatedImage, "png", out);
		out.flush();
		out.close();
	}

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sf.format(new Date());
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		Sucai sucai = new Sucai();
		Integer sid=0;
		sucai.setUrid(urid);
		sucai.setType(8);
		sucai.setSdate(date);
		fileFileName=fileFileName.replaceAll("\\'", "").replaceAll("\\'", "").replaceAll("\\[", "")
        .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");
		sucai.setName(fileFileName);
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		sucai.setLen(file.length());
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
		
			sucai.setName(sucai.getName().replaceAll("[~!%*|&@?=^#`]", ""));
			String tempname = Long.toString(System.currentTimeMillis())
					+ (int) (Math.random() * 100);
			sucai.setFilename(tempname);
			String tpdir = Constant.FILES + File.separator + tempname;
			if (new File(tpdir).mkdir()) {
				String cmdd="";
				if(Constant.OFFICETYPE==0){
					cmdd = "cmd /c " + Constant.EXE + File.separator
					+ "pdim.exe  excel " + file.getAbsolutePath() + " " + tpdir;
				}else if(Constant.OFFICETYPE==1){
					cmdd = "cmd /c " + Constant.EXE + File.separator
					+ "pdim2.exe  excel " + file.getAbsolutePath() + " " + tpdir+" "+Constant.OFFICEZOOM;
				}else if(Constant.OFFICETYPE==2){
					String pdfFile=tpdir+".pdf";
					OfficeUtil.excel2Img(file.getAbsolutePath(), pdfFile, tpdir);
				}else if(Constant.OFFICETYPE==3){
					String pdfFile=tpdir+".pdf";
					String newFile=null;
					String files=file.getAbsolutePath();
					if(fileFileName.endsWith("xls")){
					   newFile=files.substring(0, files.lastIndexOf("."))+".xls";
					}else if(fileFileName.endsWith("xlsx"))
					{
						newFile=files.substring(0, files.lastIndexOf("."))+".xlsx";
					}
					file.renameTo(new File(newFile));
					OpenOfficeUtil.excel2Img(newFile, pdfFile, tpdir);
				}else if(Constant.OFFICETYPE==4){
					String pdfFile=tpdir+".pdf";
					String newFile=null;
					String files=file.getAbsolutePath();
					if(fileFileName.endsWith("xls")){
					   newFile=files.substring(0, files.lastIndexOf("."))+".xls";
					}else if(fileFileName.endsWith("xlsx"))
					{
						newFile=files.substring(0, files.lastIndexOf("."))+".xlsx";
					}
					file.renameTo(new File(newFile));
					AsposeUtil.excel2Img(newFile, pdfFile, tpdir);
				}
				
				
				
				sucai.setStime(0);
				sid=(Integer)sm.insert("add_sucai", sucai);
	
			}
			
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

}
