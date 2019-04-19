package com.vshow.control.tool;



import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.UpFile;
import com.vshow.control.tool.VCommon;

public class SeeImgAction extends ActionSupport {

	private File up;
	private String upFileName;

	public void setUp(File up) {
		this.up = up;
	}

	public void setUpFileName(String upFileName) {
		this.upFileName = upFileName;
	}

	public String execute() throws Exception {
	   
		String[] sss = upFileName.split("\\#");
		String fna = sss[1];
		String fnd = sss[0];
		String[] sds = fnd.split("\\_");
		String jk[] = fna.split("\\&");
		if (jk.length == 1) {
			if (sds.length == 7) {
				Constant.imgMap.put(fna, fnd);
			}else if(sds.length==5) {
				//获取文件属性
				BufferedImage bi = ImageIO.read(up);
				Constant.imgMap.put(fna,bi.getWidth()+"_"+bi.getHeight());
			}
			up.renameTo(new File(Constant.SEE + File.separator + fna));
			if (Constant.tky.length() == 17) {
				FileHandle.copy2(Constant.SEE + File.separator + fna,
						Constant.SEE + File.separator + upFileName);
				new UpFile(
						new File(Constant.SEE + File.separator + upFileName),
						"http://" + Constant.svip + ":"+VCommon.port3+"/vs/upimg.vs")
						.start();
				
			}
		} else if (jk.length == 2) {
			String jkvideo = jk[1];
			if (sds.length == 7) {
                Sucai sucai=(Sucai)SqlConnect.getSqlMapInstance().queryForObject("get_sc_filename",sds[4] + "." + sds[5]);
				jkvideo = sucai.getName() + "_" + sucai.getStime()+"_"+jkvideo;
            }	
			up.renameTo(new File(Constant.SEE + File.separator + jk[0]+ File.separator + jkvideo));
			if (Constant.tky.length() == 17) {
				FileHandle.copy2(Constant.SEE + File.separator + jk[0]
						+ File.separator + jkvideo, Constant.SEE
						+ File.separator + upFileName);
				new UpFile(
						new File(Constant.SEE + File.separator + upFileName),
						"http://" + Constant.svip + ":"+VCommon.port3+"/vs/upimg.vs")
						.start();
			}
		}
		return SUCCESS;
	}
}
