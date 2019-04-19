package com.vshow.control.item;



import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.NumberFormat;
import java.util.List;

import javax.imageio.ImageIO;

import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONObject;



import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramImageGroup;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdImageGrouptoAction extends ActionSupport {

	private String mfile;
	private String info;

	private int width;
	private int height;

	private int blflag;
	private int xy_x;
	private int xy_y;
	
	private String jsonData;   //播放列表数据

	
	public String execute() throws Exception {

		JSONObject jsonobject = JSONObject.fromObject(jsonData);
		ProgramImageGroup programImageGroup= (ProgramImageGroup)JSONObject.toBean(jsonobject,ProgramImageGroup.class);
		
		//解析数据
		String ourdir = Constant.FILES + File.separator + mfile
				+ File.separator;
		String alldir = Constant.FILES + File.separator;
		String refile = "";
		String ourfi  = "";
		String allfi  = "";		
		double bl=0D;
		boolean dot = false;
		ProgramMedia  programMedia;
		MorphDynaBean md;
		List mMediaList=programImageGroup.getmMediaImageGroupMediaList();
		for (int i = 0; i < mMediaList.size(); i++) {
			//JSONObject jsonObject = mMediaList.getJSONObject(i); 
			//TouchInteractive ti=(TouchInteractive)JSONObject.toBean(jsonObject, TouchInteractive.class);
			md=(MorphDynaBean)mMediaList.get(i);
		
			dot = false;
		
			Sucai s = (Sucai) SqlConnect.getSqlMapInstance().queryForObject(
					"sel_sc_filename", md.get("path"));
			ourfi = ourdir + s.getFilename();
			allfi = alldir + s.getFilename();
			
			if (blflag == 1&&i==0) {
				BufferedImage bi = null;
				File imgfile=new File(allfi);
				try {
					bi = ImageIO.read(imgfile);
				    bl=Hsbl( bi.getWidth(), bi.getHeight());
				    width=Integer.parseInt(new java.text.DecimalFormat("0").format(height*bl));
				} catch (Exception e) {
					
				}
			}

			if (new File(ourfi).exists()) {
				dot = true;
			} else if (new File(allfi).exists()) {
				try {
					FileInputStream fis = new FileInputStream(allfi);
					FileOutputStream fos = new FileOutputStream(ourfi);
					byte[] buff = new byte[1024];
					int readed = -1;
					while ((readed = fis.read(buff)) > 0)
						fos.write(buff, 0, readed);
					fis.close();
					fos.close();
					dot = true;
				} catch (Exception e) {
				}
			}
			if (dot) {
				if (refile.isEmpty()) {
					refile = s.getFilename();
				} else {
					refile += "|" + s.getFilename();
				}
			}
		}

	
		info=jsonData;
		return SUCCESS;
	}

	
	public int getXy_x() {
		return xy_x;
	}


	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}


	public int getXy_y() {
		return xy_y;
	}


	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}


	//比例换算
	public double Hsbl(int num1,int num2){
		// 创建一个数值格式化对象
		NumberFormat numberFormat = NumberFormat.getInstance();
		// 设置精确到小数点后2位
		numberFormat.setMaximumFractionDigits(2);
	    return Double.parseDouble(numberFormat.format((float)num1/(float)num2));
	}


	
	
	public void setMfile(String mfile) {
		this.mfile = mfile;
	}


	public String getInfo() {
		return info;
	}


	public void setWidth(int width) {
		this.width = width;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	


	public int getBlflag() {
		return blflag;
	}

	public void setBlflag(int blflag) {
		this.blflag = blflag;
	}
	public String getJsonData() {
		return jsonData;
	}


	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
}
