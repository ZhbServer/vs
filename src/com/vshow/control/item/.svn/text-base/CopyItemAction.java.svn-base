package com.vshow.control.item;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Scene;
import com.vshow.control.data.UserSpace;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoZip;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class CopyItemAction extends ActionSupport {
	private String copyItemName;///需要拷贝节目名
	private int copyItemId;   //需要拷贝的节目id
	
	private int igid;//分组id
	@Override
	public String execute() throws Exception {
		SqlMapClient sm=SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		Local local= (Local) session.get("local");
		//id获取item
		Item item=(Item)sm.queryForObject("sel_item_all_id", copyItemId);
		
		float sizem = (float) (item.getLen()) / 1024 / 1024;
		int flag = 0;
		Float userspaces = (Float) SqlConnect.getSqlMapInstance()
		.queryForObject("sel_us_total_uid", urid);
		if (userspaces != null && userspaces > 0) {
			Integer state = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_desc_state_byuid", urid);
			if(state != null && state == 0){
				float userSize = getUSTotal.doMain(urid); //获取总的用户存储空间大小
				if(userspaces < userSize + sizem){
					flag = 1;
				}
			}
		}
		
		if(flag == 1){
			return NONE;
		}else{
			// 转码
			//String iname = new String(itemname.getBytes("UTF-8"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(new Date());
			item.setName(copyItemName);
			item.setSdate(date);
			item.setUserid(urid);
			Integer justIid=(Integer)sm.insert("insert_one_item",item);
			item.setId(justIid);
			LogHandle.insertTheLog(LogType.type6, urid, Constant.LOCAL.getA00657()+":" + item.getName(),1,1);
			Scene se = (Scene)sm.queryForObject("sel_scene_by_item_all",copyItemId);
			String tempFileName="";
			
			//创建场景名字
			String scenefilename=Long.toString(System.currentTimeMillis())
			+ (int) (Math.random() * 100);
			//获取要复制的场景
			
			String copypath=Constant.FILES+File.separator+se.getFilename();
			
			File dirFile = new File(Constant.FILES + File.separator
					+ scenefilename);
			dirFile.mkdir();
			
			String path=Constant.FILES+File.separator+scenefilename;
			
			FileHandle.copy(copypath, path);
			
			//修改vsjm文件
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(path + File.separator + "program.txt"), "utf-8"));
	
			String temp = "";
			String newVsjm= "";
			while ((temp = br.readLine()) != null) {
				newVsjm += temp;
			}
			newVsjm=newVsjm.replaceAll(se.getFilename(), scenefilename);
		
			br.close();
			File f = new File(path+ File.separator + "program.txt");
			FileOutputStream oldFileWriter = new FileOutputStream(f);
			oldFileWriter.write(newVsjm.getBytes("UTF-8"));
			oldFileWriter.close();
			
			
			//修改key文件
			BufferedReader br1 = new BufferedReader(new InputStreamReader(
					new FileInputStream(path + File.separator + "key.txt"), "utf-8"));
	
			String temp1 = "";
			String newKey= "";
			while ((temp1 = br1.readLine()) != null) {
				newKey += temp1;
			}
			newKey=newKey.replaceAll(se.getFilename(), scenefilename);
		
			br1.close();
			File f1 = new File(path+ File.separator + "key.txt");
			FileOutputStream oldFileWriter1 = new FileOutputStream(f1);
			oldFileWriter1.write(newKey.getBytes("UTF-8"));
			oldFileWriter1.close();
			
			
			//压缩成zip
			DoZip zip = new DoZip();
			zip.zip(path, path + ".zip");
			tempFileName=se.getFilename();
			
			se = (Scene) sm.queryForObject("sel_scene_all_id", se.getId());
			se.setFilename(scenefilename);
			se.setMcontent(se.getMcontent().replaceAll(tempFileName, scenefilename));
			
			//插入场景
			Integer justSceneId= (Integer)sm.insert("insert_one_scene", se);
			
			//更新节目
			item.setSceneid(justSceneId);
			sm.update("update_item_sceneid", item);
			
			//获取当前节目的分组id
			igid=(Integer)sm.queryForObject("sel_group_item_igid_all", copyItemId);
			
			//节目与分组建立关系
			ItemGroupRelation sgr=new ItemGroupRelation();
			sgr.setItemid(item.getId());
		    sgr.setItemgroupid(igid);
			sm.insert("ad_item_group_relation", sgr);
				
			return SUCCESS;
		}
	}
	public int getCopyItemId() {
		return copyItemId;
	}
	public void setCopyItemId(int copyItemId) {
		this.copyItemId = copyItemId;
	}
	public String getCopyItemName() {
		return copyItemName;
	}
	public void setCopyItemName(String copyItemName) {
		this.copyItemName = copyItemName;
	}
	
	public int getIgid() {
		return igid;
	}
	public void setIgid(int igid) {
		this.igid = igid;
	}

	
}
