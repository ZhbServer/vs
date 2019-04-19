package com.vshow.control.item;



import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Scene;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramMedia;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AdOfficeToAction implements Action {

	private int scid;
	private String info;
	private String mfile;
	private int times;
	private int width;
	private int height;
    private int tx;
	private int xy_x;
	private int xy_y;
	private String filenames;
    
	private String jsonData;


	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		Scene se = (Scene) session.get("scene");
		
		
		
		JSONObject jsonobject = JSONObject.fromObject(jsonData);
		ProgramComplexMediaManager programComplexMediaManager= (ProgramComplexMediaManager)JSONObject.toBean(jsonobject,ProgramComplexMediaManager.class);
		
		
		
		// 通过背景id找素材的文件名
		String fileName = programComplexMediaManager.getOfficeFileName();
		String ourfi = "";
		String allfi = "";
		String temfi = "";
		String cufi = fileName.trim();
		ourfi = Constant.FILES + File.separator + mfile
				+ File.separator + cufi;
		allfi = Constant.FILES + File.separator + cufi;
		temfi = ourfi + "01.png";
		String allpic = "";
		String fd;

		File f = new File(allfi);
		if (f.exists()) {
			File[] files = f.listFiles(new FileFilter() {
				public boolean accept(File file) {
					return file.getName().toLowerCase().endsWith(".png");
				}
			});
			Arrays.sort(files, new Comparator<File>() {
				public int compare(File f1, File f2) {
					return Long.valueOf(f1.lastModified()).compareTo(
							f2.lastModified());
				}
			});
			List<ProgramMedia> mMediaList=new ArrayList<ProgramMedia>();
			ProgramMedia  pm;
			int mPlayTimes=0;
			for (int i = 0; i < files.length; i++) {
				fd = files[i].getName();
				pm=new ProgramMedia();
				
				pm.setInAnim(programComplexMediaManager.getOfficeInAnim());
				
				pm.setPath(cufi+"0"+fd);
				
				pm.setTbType(1);
				
				pm.setType(1);
				
				pm.setFilesName(programComplexMediaManager.getOfficeFileName());
				
				pm.setSname(programComplexMediaManager.getOfficeName());
				
				pm.setTimeoutMillis(programComplexMediaManager.getOfficeTimeoutMillis());
				
				mPlayTimes=mPlayTimes+programComplexMediaManager.getOfficeTimeoutMillis();//播放时长
				mMediaList.add(pm);
				//System.out.println(cufi+"0"+fd);
				
				
				
				
				
				if (!new File(ourfi + "0" + fd).exists()) {
					try {
						FileInputStream fis = new FileInputStream(allfi
								+ File.separator + fd);
						FileOutputStream fos = new FileOutputStream(ourfi + "0"
								+ fd);
						byte[] buff = new byte[1024];
						int readed = -1;
						while ((readed = fis.read(buff)) > 0)
							fos.write(buff, 0, readed);
						fis.close();
						fos.close();
					} catch (Exception e) {
					}
				}
				
			}
			programComplexMediaManager.setmMediaList(mMediaList);
			programComplexMediaManager.setmPlayTimes(mPlayTimes);

		}
		JSONObject jsonObject = JSONObject.fromObject(programComplexMediaManager);
		
		//info =tx+ "|" + times + "|" + allpic + "-" + width + "-" + height+"-"+xy_x+"-"+xy_y+"-"+filenames;
   
		info=jsonObject.toString();
		//System.out.println(info);
		return SUCCESS;
	}

	public int getScid() {
		return scid;
	}

	public void setScid(int scid) {
		this.scid = scid;
	}

	

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getTx() {
		return tx;
	}

	public void setTx(int tx) {
		this.tx = tx;
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

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}
	
	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

}
