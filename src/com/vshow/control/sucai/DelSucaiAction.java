package com.vshow.control.sucai;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiCloud;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.letv.cloud.LetvCloudUtil;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.SqlConnect;

public class DelSucaiAction implements Action {

	// 素材id;
	private int[] qx;
	

	// 素材类型
	private Sucai sucai;
	
	//分组
	private ScGroupRelation gssi; // 分组


	//页面显示类型 (1.列表 2视图)
	private int showtype=1;
	
	private int pagetype=10;  //页码类型(10,20,30)
	

	Logger logger  =  Logger.getLogger(DelSucaiAction.class);

	public String execute() throws Exception {

		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String videoid;
		String response;
		// 追加删除文件的名字
		String logcontent = "";
		// 追加无权限删除的名字
		String nologcontent = "";
		// 批量删除
		for (int i = 0; i < qx.length; i++) {
		
			// 通过素材id查询素材
			Sucai sc = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("get_sc_all_id", qx[i]);
			//SqlConnect.getSqlMapInstance().delete("del_countsucai_sucaiid", qx[i]);
            //删除统计  
			
	
			if (logcontent == "") {
				logcontent = sc.getName();
			} else {
				logcontent = logcontent + "," + sc.getName();
			}

			// 删除素材
			SqlConnect.getSqlMapInstance().delete("del_sucai", sc);
		    // 删除素材与分组的表
			SqlConnect.getSqlMapInstance().delete("del_sucai_group", qx[i]);
			// 删除素材共享
			SqlConnect.getSqlMapInstance().delete("del_scshare", sc.getId());

			// 本地删除素材文件
			// (删除素材:1背景,4图片,5Flash)
			if (sc.getType() == 1 || sc.getType() == 4 || sc.getType() == 5) {
				//删除原图片
				String filepath = Constant.FILES + File.separator + sc.getFilename();
				FileHandle.deleteFile(filepath);
				//删除缩略图
				String sfilepath = Constant.FILES + File.separator +"_"+sc.getFilename();
				FileHandle.deleteFile(sfilepath);
				
				// (删除素材:2音频,3视频)
			} else if (sc.getType() == 2 || sc.getType() == 3) {
				String filepath = Constant.FILES + File.separator + sc.getFilename();
				FileHandle.deleteFile(filepath);
				//删除flv文件
				String fileName=sc.getFilename().substring(0, sc.getFilename().lastIndexOf("."));
				String fileFlv=Constant.FILES + File.separator +fileName+"_.flv";
				FileHandle.deleteFile(fileFlv);
				
					
				SucaiCloud  sCloud=(SucaiCloud)SqlConnect.getSqlMapInstance().queryForObject("sel_sucaiCloud_param", sc.getFilename());
				
				
				if(sc.getType()==3){
					if(sCloud!=null){
						if(sCloud.getCloudtype()==1){
							if(Constant.UPVIDEOCLOUDTYPE==1){
								response=LetvCloudUtil.delcloudUp(Integer.parseInt(sCloud.getVideoid()));
								logger.info("删除视频文件乐视云返回信息:"+response);
							}
						}
						
					}
				}
				if(sCloud!=null){
					SqlConnect.getSqlMapInstance().delete("del_sucaiCloud_videoid", sCloud.getVideoid());	
				}
				
						
						
				
					
				
				// (删除素材:6PPT,7Word,8Excel,9PDF)
			} else if (sc.getType() == 6 || sc.getType() == 7
						|| sc.getType() == 8 || sc.getType() == 9) {
					String filepath = Constant.FILES + File.separator + sc.getFilename();
					FileHandle.delFolder(filepath);  
			}

		} 

		// 判断有没有内容
		if (!"".equals(logcontent)) {
			// 记录日志
			if (sucai.getType() == 1) {
				//背景
				LogHandle.insertTheLog(LogType.type2, urid, Constant.LOCAL.getA00082()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 4) {
				//图片
				LogHandle.insertTheLog(LogType.type2, urid,  Constant.LOCAL.getA00085()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 2) {
				//音频
				LogHandle.insertTheLog(LogType.type2, urid, Constant.LOCAL.getA00086()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 3) {
				//视频
				LogHandle.insertTheLog(LogType.type2, urid,  Constant.LOCAL.getA00089()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 5) {
				//Flash
				LogHandle.insertTheLog(LogType.type2, urid,  Constant.LOCAL.getA00084()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 6) {
				//PPT
				LogHandle.insertTheLog(LogType.type2, urid,  Constant.LOCAL.getA00088()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 7) {
				//Word
				LogHandle.insertTheLog(LogType.type2, urid, Constant.LOCAL.getA00090()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 8) {
				//Excel
				LogHandle.insertTheLog(LogType.type2, urid,  Constant.LOCAL.getA00083()+":" + logcontent, 1,1);
			} else if (sucai.getType() == 9) {
				//PDF
				LogHandle.insertTheLog(LogType.type2, urid, Constant.LOCAL.getA00087()+":" + logcontent, 1,1);
			}
		}

       
        
	   
	    String return_v="";
			if(showtype==1){
				return_v="SUCCESS_LIST";
			}else if(showtype==2){
				return_v="SUCCESS_VIEW";
			}
		
		return return_v;
		
		
	}

	public Sucai getSucai() {
		return sucai;
	}

	public void setSucai(Sucai sucai) {
		this.sucai = sucai;
	}
	
	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}
	
	public ScGroupRelation getGssi() {
		return gssi;
	}

	public void setGssi(ScGroupRelation gssi) {
		this.gssi = gssi;
	}

	public int getShowtype() {
		return showtype;
	}

	public void setShowtype(int showtype) {
		this.showtype = showtype;
	}
	
	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
}
