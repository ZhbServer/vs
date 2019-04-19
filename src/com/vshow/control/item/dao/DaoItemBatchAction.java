package com.vshow.control.item.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.Scene;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.log.LogHandle;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DaoItemBatchAction extends ActionSupport {





	private String fname;
	private int[] qx;
	
	private String itemPlayNumberJson;


	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		
		//解析json 获取每个节目的播放次数
		List<Item> itemPlayNumbers=new ArrayList();
		if(itemPlayNumberJson==null||itemPlayNumberJson.equals("")){
		}else{
			
			JSONArray json = JSONArray.fromObject(itemPlayNumberJson);
			itemPlayNumbers= (List<Item>)JSONArray.toCollection(json, Item.class);			  
		   
		
		}
		
		
		
		
		// 创建节目文件夹
		String temp = Long.toString(System.currentTimeMillis());
        String olddir = Constant.FILES + File.separator + temp;
		new File(olddir).mkdir();
		
		int iid=0;
		Item item;
		Scene se;
		String oldfile;
		String playlist = "";
		String items="";
		Fbl fbl; 
		long clen=0L;
		int fileExists=0;
		String[] vms;
		String downcmd = "";
		String playFileName="";
		for (int i = 0; i < itemPlayNumbers.size(); i++) {
			item=itemPlayNumbers.get(i);
		
			//获取节目
			item=(Item)sm.queryForObject("sel_item_all_id", item.getId());
			//获取场景
			se=(Scene)sm.queryForObject("sel_fnvn_iid", item.getId());
			
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
			
			
			//获取播放次数
			for (Item itemPlayNumber : itemPlayNumbers) {
				if(itemPlayNumber.getId()==item.getId()){
					if(itemPlayNumber.getPlayNumber()==0){
						itemPlayNumber.setPlayNumber(1);
					}
					item.setPlayNumber(itemPlayNumber.getPlayNumber());
				}
			}
			//拼接播放次数
			playFileName="";
			for (int j = 0; j < item.getPlayNumber(); j++) {
				if(j==0){
					playFileName=se.getFilename();
				}else{
					playFileName=playFileName + "|" + se.getFilename();
				}
			}
			
			//拼接播放列表/下载列表
		    if (i == 0) {
				   playlist = playFileName;
				   downcmd = se.getFilename() + ".zip";
			} else {
				   playlist = playlist + "|" +playFileName;
				   downcmd = downcmd + "|" + se.getFilename() + ".zip";
			}
		  
			if (se.getVname().length() > 0
					&& (se.getVname().indexOf(':') == -1)) {
				downcmd += "|" + se.getVname();
			}
			
		}
			
			
			
		//***********************************************************************************************
	
		String msg = "02" + clen + "/" + downcmd + "+"
		+ "sendkey!" + LogHandle.createSendKey() + "%playlist!" + playlist;	
		
		
	
	
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
	
	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	public String getFname() {
		return fname;
	}

	

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getItemPlayNumberJson() {
		return itemPlayNumberJson;
	}

	public void setItemPlayNumberJson(String itemPlayNumberJson) {
		this.itemPlayNumberJson = itemPlayNumberJson;
	}
	
}
