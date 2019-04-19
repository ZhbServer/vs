package com.vshow.control.item.dao;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.InteractItemGroupRelation;
import com.vshow.control.data.ItemGroupRelation;

import com.vshow.control.data.ItemScene;
import com.vshow.control.data.Scene;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.AntZip;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;

public class DaoInteractItemInAction extends ActionSupport {


	private File file;
	private String fileFileName;
	private int igid=0;

	@Override
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");

		
		Integer sessionIgid=(Integer)session.get("igid");
		if(sessionIgid==null){
			sessionIgid=0;
		}
		igid=sessionIgid;
		
		
		String fs;
		String st;

		File ff;
		AntZip az = new AntZip();
		
		InteractItem item = null;
		int iid = 0;
		int sid = 0;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sf.format(new Date());

		int ocheck = (Integer) session.get("urcheck");
		if (ocheck == 0 || ocheck == 2) {
			ocheck = 0;
		} else if (ocheck == 1 || ocheck == 3) {
			ocheck = 1;
		}
		ff = file;
		fs = ff.getAbsolutePath();
		st = fs.substring(0, fs.lastIndexOf('.'));
		fileFileName = fileFileName.substring(0, fileFileName.lastIndexOf('.'));
		az.unzip(fs, st);
		try {

			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(st + File.separator + "itemData.txt"),
					"utf-8"));
			
			String temp = "";
			String s = "";
			while ((temp = br.readLine()) != null) {
				s += temp;
			}
			JSONArray array = JSONArray.fromObject(s);
			Scene scene;
			int fblid;
			Fbl tempfbl;
			int itemid;
			int sceneid;
			for (int i = 0; i < array.size(); i++) {
				JSONObject jsonObject = array.getJSONObject(i); 
				InteractItem ti=(InteractItem)JSONObject.toBean(jsonObject, InteractItem.class);
				
				//插入数据
				scene=ti.getScene();
				
				
				//查找分辨率存在不存在
				
			    tempfbl=new Fbl();
				tempfbl.setTx(scene.getTx());
				tempfbl.setTy(scene.getTy());
				Fbl tempfbl2=(Fbl)sm.queryForObject("sel_fbl_xy",tempfbl);
				if(tempfbl2==null){
						//新增分辨率
						tempfbl.setName(scene.getTx()+"*"+scene.getTx());
						
						fblid=(Integer)sm.insert("add_fbl", tempfbl);
				}else{
						fblid=tempfbl2.getId();
				}
				
				ti.setFblid(fblid);
				ti.setOcheck(ocheck);
				ti.setSdate(Constant.getCurrentDate());
				
				
				//把当前场景zip包解压,copy到 file
				az.unzip(st + File.separator + ti.getScene().getFilename()+".zip", Constant.FILES+File.separator+ti.getScene().getFilename());
				
				
				
				
				//插入节目
				itemid=(Integer)sm.insert("insert_one_interactitem_dao", ti);
				
				
				//查询场景是否存在
				String exitSceneFileName=(String)sm.queryForObject("sel_interactScene_exist", ti.getScene().getFilename());
				
				if(exitSceneFileName!=null){
					sm.delete("del_interactscene_filename", ti.getScene().getFilename());
				}
				
				//插入场景
				sceneid=(Integer)sm.insert("insert_one_interactscene",ti.getScene());
				
				
				//插入节目场景关系
				ItemScene iScene=new ItemScene();
				iScene.setItemid(itemid);
				iScene.setSceneid(sceneid);
				sm.insert("insert_one_interactitemscene",iScene);
				
				//插入分组			
				InteractItemGroupRelation sgr=new InteractItemGroupRelation();
				sgr.setItemid(itemid);
			    sgr.setItemgroupid(igid);
				sm.insert("add_interactitem_group_relation", sgr);
				
			}
				
			    
	
			
			//当前压缩包文件解压到file目录下
			FileHandle.copy(st, Constant.FILES);
		

		}catch(Exception e){
			
		}
    
		return SUCCESS;
		
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public int getIgid() {
		return igid;
	}

	public void setIgid(int igid) {
		this.igid = igid;
	}

}
