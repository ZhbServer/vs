package com.vshow.control.client.set;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.Result;
import com.vshow.control.tool.AntZip;
import com.vshow.control.tool.Constant;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;


public class SeeLogAction extends ActionSupport {
	private int id;
	private String name;

	private String filename;
	
	private List<String> logs=new ArrayList();

	public String execute() throws Exception {
		Client cl = (Client) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_client_byid", id);
		name = cl.getName();
		String mark=cl.getMark().replaceAll("\\:", "\\_");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String date = sf.format(new Date());
		
		//filename =mark+"_"+date+"_"+Long.toString(System.currentTimeMillis());
		filename =mark+"_"+date;
		
		String msg = "15+" + filename;
		Result rs = new Result();
		HashMap hm = new HashMap();
		String vlu;
		String fzmsg;
		MyMsg mymsg;
		Client client;
		// 发送给终端

		if (cl.getServerid() == 0) {
			Mlt mt = Constant.messageMap.get(cl.getMark());
			if (mt != null) {
				mymsg = new MyMsg();
				mymsg.msg = msg;
				mymsg.sendkey = "";
				mt.allmsg.add(mymsg);
			}
		} else {
			
		}

		

		File f = new File(Constant.LOG + File.separator + filename+".zip");
		int i = 0;
		AntZip az = new AntZip();
		while (true) {
			
			
			if (f.exists()) {
				//解压zip文件
				az.unzip(Constant.LOG + File.separator + filename+".zip", Constant.LOG + File.separator + filename);
				//获取这个文件夹下所有的文件
				File fsss = new File(Constant.LOG + File.separator + filename);
				File[] fsd = fsss.listFiles();
				if (fsd != null) {
					for (int j = 0; j < fsd.length; j++) {
						fsss = fsd[j];
						if (fsss.isDirectory()) {
							
						}else{
							logs.add(fsss.getName());
							
						}
					}
				}
				break;
			
			} else {
				Thread.sleep(1000);
				i++;
				if (i > 120) {
					break;
				}
			}
	  }
		/*File fsss = new File(Constant.LOG + File.separator + "B3_51_E9_00_1C_05_2014-04-02-14-39-18");
		filename="B3_51_E9_00_1C_05_2014-04-02-14-39-18";
		File[] fsd = fsss.listFiles();
		if (fsd != null) {
			for (int j = 0; j < fsd.length; j++) {
				fsss = fsd[j];
				if (fsss.isDirectory()) {
					
				}else{
					logs.add(fsss.getName());
					
				}
			}
		}*/
		
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List getLogs() {
		return logs;
	}

	public void setLogs(List<String> logs) {
		this.logs = logs;
	}

	
}
