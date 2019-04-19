package com.vshow.control.item.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.log.LogHandle;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DaoItemAction extends ActionSupport {

	private String fname;
	//private int[] qx;
	private int id;

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		// 创建节目文件夹
		String temp = Long.toString(System.currentTimeMillis());
        String olddir = Constant.FILES + File.separator + temp;
		new File(olddir).mkdir();
		
		int iid=0;
		Item item;
		Scene se;
		String oldfile;
		String playlist = "playlist=";
		String items="";
		Fbl fbl; 
//		for (int i = 0; i < qx.length; i++) {
//			iid=qx[i];
		iid = id;
		//获取节目
		item=(Item)sm.queryForObject("sel_item_all_id", iid);
		//获取场景
		se=(Scene)sm.queryForObject("sel_fnvn_iid", iid);
		//拼接播放列表
//			if (i == 0) {
			playlist = playlist + se.getFilename();

//			} else {
//				playlist = playlist + "|" + se.getFilename();
//			}
		//拷贝文件
		oldfile = Constant.FILES + File.separator + se.getFilename();
		FileHandle.copy2(oldfile + ".zip",olddir + File.separator + se.getFilename() + ".zip");
		
	
		
		// 写入视频或者音频
		String[] sstr = se.getVname().split("\\|");
		String flv = "";
		for (int j = 0; j < sstr.length; j++) {
			if (!"".equals(sstr[j])) {
				FileHandle.copy2(Constant.FILES + File.separator + sstr[j],
						olddir + File.separator + sstr[j]);
				flv = sstr[j].substring(0, sstr[j].lastIndexOf('.'))
						+ "_.flv";
				FileHandle.copy2(Constant.FILES + File.separator + flv,
						olddir + File.separator + flv);
			}
		}
		
		//拼接节目协议
		    // 获取分辨率
			fbl = (Fbl) sm.queryForObject("sel_fbl_all_id", item.getFblid());
			// 拼接items
			if(items.length()==0){
				items=item.getName().replaceAll("\\^", "") + "*" + item.getStime() + "*"+ fbl.getTx()+"-"+fbl.getTy() + "*" + item.getLen()+"*"+se.getFilename();
			}else{
				items+="^"+item.getName().replaceAll("\\^", "") + "*" + item.getStime() + "*"+ fbl.getTx()+"-"+fbl.getTy() + "*" + item.getLen()+"*"+se.getFilename();
			}
			
//		}
			
		//***********************************************************************************************
		//拼接播放协议
		long clen=0L;
		int fileExists=0;
		String[] vms;
		
		//获取场景zip大小
		String filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
		
		
		long len = FileHandle.getFileByte(filepathzip);
		
		
		//获取视频,音频大小
		if(!"".equals(se.getVname())){					
			vms = se.getVname().split("\\|");
			for (int j = 0; j < vms.length; j++) {
				
				fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
				//if(fileExists==0){
				//	return "success2"; 
				//}
				len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
				
				
			}
		}
		clen+=len;
		
		
		String msg = "02" + clen + "/" + se.getFilename()+  ".zip|"+se.getVname() + "+"
		+ "sendkey!" + LogHandle.createSendKey() + "%playlist!" + se.getFilename();	
		//***********************************************************************************************
		
		// 写入protocol.txt文件
		new File(olddir + File.separator + "protocol.txt");
		FileHandle.readFileInfo(olddir + File.separator + "protocol.txt", msg);
		
		
		
		// 写入config文件 ,创建一个ini文件
		String ininame = olddir + File.separator + "config.ini";
		new File(ininame);
		FileHandle.readFileInfo(ininame, playlist);
		
        // 写入item.txt文件
		new File(olddir + File.separator + "item.txt");
		FileHandle.readFileInfo(olddir + File.separator + "item.txt", items);
		
		// 压缩zip
		fname = temp + ".zip";
		DoZip zip = new DoZip();
		zip.zip(olddir, olddir + ".zip");
		
		return SUCCESS;
	
	}
	
//	public int[] getQx() {
//		return qx;
//	}
//
//	public void setQx(int[] qx) {
//		this.qx = qx;
//	}
	
	public String getFname() {
		return fname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
}
