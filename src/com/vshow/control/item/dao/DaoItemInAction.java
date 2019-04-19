package com.vshow.control.item.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Fbl;
import com.vshow.control.data.Item;
import com.vshow.control.data.ItemGroupRelation;
import com.vshow.control.data.Scene;
import com.vshow.control.data.UserSpace;
import com.vshow.control.tool.AntZip;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.zdy.user.space.getUSTotal;

public class DaoItemInAction extends ActionSupport {

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
		String tname = "";
		Item item = null;
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
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(st + File.separator + "item.txt"), "utf-8"));

		String temp = "";
		String s = "";
		while ((temp = br.readLine()) != null) {
			s += temp;
		}

		boolean isNewItem = false;
		
		String items[]=s.split("\\^");
		for (int i = 0; i < items.length; i++) {
			String ss[] = items[i].split("\\*");
			if (ss.length == 5) {

				// 解析节目
				String itemFileName = fileFileName;
				File ttem = new File(Constant.FILES + File.separator + fileFileName
						+ ".zip");
				ff.renameTo(ttem);
				
				
				float sizem = (float)ttem.length()/1024/1024;
				Float userspaces = (Float) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_us_total_uid", urid);
				if (userspaces != null && userspaces > 0) {
					Integer state = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_desc_state_byuid", urid);
					if(state != null && state == 0){
						float userSize = getUSTotal.doMain(urid); //获取总的用户存储空间大小
						if(userspaces < userSize + sizem){
							isNewItem = true;
							break;
						}
					}
				}
				
				
				az.unzip(Constant.FILES + File.separator + fileFileName + ".zip",
						Constant.FILES + File.separator);
				
				//查找分辨率存在不存在
				Integer fblid=0;
				String[] fbls=ss[2].split("\\-");
				if(fbls.length==2){
					Fbl tempfbl=new Fbl();
					tempfbl.setTx(Integer.parseInt(fbls[0]));
					tempfbl.setTy(Integer.parseInt(fbls[1]));
					Fbl tempfbl2=(Fbl)sm.queryForObject("sel_fbl_xy",tempfbl);
					if(tempfbl2==null){
						//新增分辨率
						tempfbl.setName(fbls[0]+"*"+fbls[1]);
						
						fblid=(Integer)sm.insert("add_fbl", tempfbl);
					}else{
						fblid=tempfbl2.getId();
					}
				}
				

				item = new Item();
				item.setName(ss[0]);
				item.setStime(Integer.parseInt(ss[1]));
				item.setFblid(fblid);
				item.setLen(Long.parseLong(ss[3]));
				item.setOcheck(ocheck);
				item.setSdate(date);
				item.setUserid(urid);
				
				//判断节目存在不存在
				Integer thid=(Integer)sm.queryForObject("sel_th_item_id", item);
				
				if(thid!=null){
					
					//获取节目下的场景
					//获取场景
					Scene se=(Scene)sm.queryForObject("sel_fnvn_iid", thid);
					if(se!=null){
						// 删除场景表
						sm.delete("del_scene", se.getId());
						sm.delete("del_item_id",thid);
						//sm.delete("del_countsucai_itemid", thid);	
					}
										
				}
				

				// 插入节目 
				iid = (Integer) sm.insert("insert_one_item", item);
	            String mfile;
				Scene scene;
				
				// 获取场景
				long clen=0L;
				long len=0L;
				String filepathzip="";
				int fileExists=0;
				String[] vms;
				// 解析节目
				mfile = ss[4];
				Scene tfileName =(Scene)sm.queryForObject("sel_scfilename_scene",mfile);
				if (tfileName != null) {
					    item.setId(iid);
					    item.setSceneid(tfileName.getId());
					    sm.update("update_item_sceneid", item);
						
				}else{
					az.unzip(Constant.FILES + File.separator + mfile + ".zip", Constant.FILES+ File.separator + mfile);
	                br = new BufferedReader(new InputStreamReader(new FileInputStream(Constant.FILES + File.separator
										+ mfile + File.separator + "key.txt"), "utf-8"));
	                temp = "";
					String key = "";
					while ((temp = br.readLine()) != null) {
							key += temp;
					}
					br.close();
					
					
					int b=key.indexOf("<!-- 网页主体内容 开始 -->");
				    int e=key.indexOf("<!-- 网页主体内容 结束 -->");
				        
				    if(b>0&&e>0){
				    	
				    	//System.out.println(key.subSequence(0, b));
				        
				        //System.out.println(key.subSequence(e, key.length()));
				        
				        //System.out.println(key.subSequence(b, e+18));
				        
				        String bString=key.substring(0, b);
				        String eString=key.substring(e+18,key.length());
				    	String cString=key.substring(b, e+18);
				    	
				    	String keys[] = (bString+eString).split("\\@");
				    	
						if (keys.length == 7) {
							scene = new Scene();
							scene.setName("1");
							scene.setFilename(keys[1]);
							scene.setMcontent(cString);
							scene.setStime(Integer.parseInt(keys[3]));
							scene.setVname(keys[4]);
							scene.setFcontent(keys[5]);
							scene.setSf(Float.parseFloat(keys[6]));

							

							sid = (Integer) sm.insert("insert_one_scene", scene);

							if (iid != 0 && sid != 0) {
								
								 item.setId(iid);
								 item.setSceneid(sid);
								 sm.update("update_item_sceneid", item);
								
							}
							/**获取场景zip大小*/
							filepathzip = Constant.FILES + File.separator+ keys[1]+ ".zip";
								
							/**验证文件存在不存在: 0不存在,1存在**/
							fileExists=FileHandle.fileExists(filepathzip);
																		
							if(fileExists==0){
									return SUCCESS; 
							}
							len = FileHandle.getFileByte(filepathzip);
								
							/**获取视频,音频大小*/
							if(!"".equals(keys[4])){					
									vms = keys[4].split("\\|");
									for (int j = 0; j < vms.length; j++) {
										
										fileExists=FileHandle.fileExists(Constant.FILES + File.separator+ vms[j]);
										if(fileExists==0){
											//return "success"; 
										}
										len += FileHandle.getFileByte(Constant.FILES + File.separator+ vms[j]);
									}
								}
													
							
							clen+=len;

						}
						item.setLen(clen);
						SqlConnect.getSqlMapInstance().update("upd_item", item);
				    }
				    
				    
					
		
				

					   
					
				}
				 //节目与分组建立关系
			    //节目与分组建立关系
				ItemGroupRelation sgr=new ItemGroupRelation();
				sgr.setItemid(item.getId());
			    sgr.setItemgroupid(igid);
				sm.insert("ad_item_group_relation", sgr);
					
				}
			
		}
		if(isNewItem == true){
			return ERROR;
		}else{
			return SUCCESS;
		}
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
