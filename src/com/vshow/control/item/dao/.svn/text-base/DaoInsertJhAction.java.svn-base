package com.vshow.control.item.dao;

import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.JhItem;
import com.vshow.control.data.Scene;
import com.vshow.control.log.LogHandle;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DaoInsertJhAction extends ActionSupport {

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
		
		
		Scene se;
		String oldfile;
	
		String items="";
		

		

			
		//***********************************************************************************************
			
	    List<JhItem> jhitems=SqlConnect.getSqlMapInstance().queryForList("sel_jh_item_all",id);
	    String cmds="";
	    HashSet<Integer> itemset=new HashSet();
	    String downcmd = "";
	    long clen=0L;
		long len=0L;
		String filepathzip="";
		String[] vms;
		for (JhItem jhitem : jhitems) {
			
            
         
            String jhitemsString[]=jhitem.getItemids().split("\\,");
			/**拼接协议**/
			String cmd =jhitem.getSdate()+"_"+jhitem.getEdate()+"_";
			
			for (int i = 0; i < jhitemsString.length; i++) {
				itemset.add(Integer.parseInt(jhitemsString[i]));
				/**获取节目信息**/
				se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", Integer.parseInt(jhitemsString[i]));
				
				if(se!=null){
					if (i == 0) {
						cmd = se.getFilename();
					} else {
						cmd += "|" + se.getFilename();
					}
					if(downcmd.length()==0){
						downcmd = se.getFilename() + ".zip";
					}else{
						downcmd += "|" + se.getFilename() + ".zip";
					}
					if (se.getVname().length() > 0
							&& (se.getVname().indexOf(':') == -1)) {
						downcmd += "|" + se.getVname();
					}
				}
			}
			if(cmds.length()==0){
				cmds=jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
			}else{
				cmds=cmds+"^"+jhitem.getSdate()+"_"+jhitem.getEdate()+"_"+cmd;
			}
			
		}
		
		
		
		if (itemset.size() > 0) {
			
			for (Integer itemid : itemset) {
				/**获取节目信息**/
				se=(Scene)SqlConnect.getSqlMapInstance().queryForObject("sel_scene_by_item_id", itemid);
				if(se!=null){
					
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
					
					
					
					
					/**获取场景zip大小*/
					filepathzip = Constant.FILES + File.separator+ se.getFilename() + ".zip";
					
					
					
					len = FileHandle.getFileByte(filepathzip);
					
					/**获取视频,音频大小*/
					if(!"".equals(se.getVname())){					
						vms = se.getVname().split("\\|");
						for (int j = 0; j < vms.length; j++) {
							
							//fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
							//if(fileExists==0){
							//	return "success2"; 
							//}
							len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
						}
					}
										
				}
				clen+=len;
			}
		}

		String msg = "02" + clen + "/" + downcmd + "+"
		+ "sendkey!" + LogHandle.createSendKey() + "%cblist!" + cmds;	
		
		//***********************************************************************************************
		
		// 写入protocol.txt文件
		new File(olddir + File.separator + "protocol.txt");
		FileHandle.readFileInfo(olddir + File.separator + "protocol.txt", msg);
		
		
		
		// 写入config文件 ,创建一个ini文件
		//String ininame = olddir + File.separator + "config.ini";
		//new File(ininame);
		//FileHandle.readFileInfo(ininame, playlist);
		
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
