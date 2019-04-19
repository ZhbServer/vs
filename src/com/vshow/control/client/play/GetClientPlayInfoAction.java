package com.vshow.control.client.play;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.data.Device;
import com.vshow.control.data.ClientAdvertising;
import com.vshow.control.data.ClientPlay;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.InteractItem;
import com.vshow.control.data.Item;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class GetClientPlayInfoAction extends ActionSupport{
	
	
	
	Logger logger  =  Logger.getLogger(GetClientPlayInfoAction.class);
	private String mark;         //终端标识
	private String playlist;     //普通播放 
	private String dplist;       //垫片播放
	private String timelist;     //轮播播放
	private String cblist;       //插播播放
	private String datelist;     //有效期播放
	private String warninglist;  //预警节目
	private String configinfo;   //config json
	private String conditionlist; //条件节目
	private String number;     //终端最多播放节目数 
	private String use_number;// 终端有效节目数 
	private String currentFileName;  //当前终端正在播放的节目
	private String sendkey;          //发送消息的sendkey
	private String playState;     //播放状态  1播放 2暂停 3停止


	@Override
	public String execute() throws Exception {
		
		logger.info("config:"+configinfo);
		if(configinfo!=null&&!configinfo.equals("")){
	
			Properties properties=(Properties)JSONObject.toBean(JSONObject.fromObject(configinfo), Properties.class);
			//properties.get
			mark=properties.getProperty("mac");
			playlist=properties.getProperty("playlist");
			dplist=properties.getProperty("dplist");
			timelist=properties.getProperty("timelist");
			cblist=properties.getProperty("cblist");
			datelist=properties.getProperty("datelist");
			warninglist=properties.getProperty("warninglist");
			conditionlist=properties.getProperty("conditionlist");
			number=properties.getProperty("number");
			currentFileName=properties.getProperty("currentFileName");
			sendkey=properties.getProperty("sendkey");
			use_number=properties.getProperty("use_number");
			playState=properties.get("playState")+"";
			
		}
		
		List<Item> items=new ArrayList<Item>();
		
		
		if(mark!=null&&!mark.equals("")){
			//普通播放
			if(datelist==null||datelist.equals("")){
				
			}else{
				if(datelist.substring(0,7).equals("-1_-1_a")){
					playlist=datelist.split("\\_")[2];
					datelist="";
				}
			}
			
			if(playlist==null||playlist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt23);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
				
				
				cp.setSendtype(ResultType.rt1);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
			
			}else{
				
				String[] plays=playlist.split("\\|");
				
				//截取首位a的字符为互动节目
				if(playlist.substring(0, 1).equals("a")){
					
					String content=Constant.LOCAL.getA00445();
					
					String interactplays[]=playlist.split("\\|");
					
					InteractItem interactitem=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename", interactplays[0]);
					
					content=content+":"+interactitem.getName();
					
                    ClientPlayHandle.insertClientPlay(interactitem.getId()+"", 2, ResultType.rt23, content, 1, mark, "", 2);
                    
				}else{
					
					ClientPlay cp=getItemIdsNames(playlist);
					
					String[] itemIds=cp.getItemids().split(",");
					Item item;
					for (int i = 0; i < itemIds.length; i++) {
						
						item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_pro_id",Integer.parseInt(itemIds[i]));
						if(item!=null){
							
							if(item.getFilename().equals(currentFileName)){
								item.setIs_current(true);
							}else{
								item.setIs_current(false);
							}
							
							items.add(item);
						}
						
					}
					
					ClientPlayHandle.insertClientPlay(cp.getItemids(), 1, ResultType.rt1, Constant.LOCAL.getA00417()+ ":"+cp.getItemnames(), 1, mark, "", 2);
				}
				
			}
			
			
			
           if(warninglist==null||warninglist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt41);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
			
			}else{
				String[] warinings=warninglist.split("\\|");
				//截取首位a的字符为互动节目
				if(warninglist.substring(0, 1).equals("a")){
					
					String content=Constant.LOCAL.getB00275();
					
					String interactplays[]=warninglist.split("\\|");
					
					InteractItem interactitem=(InteractItem)SqlConnect.getSqlMapInstance().queryForObject("sel_interact_item_filename", interactplays[0]);
					
					content=content+":"+interactitem.getName();
					
                    ClientPlayHandle.insertClientPlay(interactitem.getId()+"", 2, ResultType.rt41, content, 1, mark, "", 2);
                    
				}else{
					
					ClientPlay cp=getItemIdsNamesm(warninglist);
					
					ClientPlayHandle.insertClientPlay(cp.getItemids(), 1, ResultType.rt41,cp.getItemnames(), 1, mark, "", 2);
				}
			}

			
			
			//垫片播放
			if(dplist==null||dplist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt18);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
				
			}else{
				
				String[] dpvs=dplist.split("\\_");
				if(dpvs.length==5){
					ClientPlay cp=getItemIdsNames(dpvs[4]);
					
					// 开始时间
					String logcontent = Constant.LOCAL.getA00150()+":" + cp.getItemnames();
					logcontent += Constant.LOCAL.getA00582() + " :" + dpvs[0];

					// 结束时间
					logcontent += Constant.LOCAL.getA00583() + " :" + dpvs[1];

					// 间隔时间
					logcontent += Constant.LOCAL.getA00584() + " :" + dpvs[2];
					
					// 播放次数
				    logcontent += Constant.LOCAL.getA00585() + " :" + dpvs[3];
					
				    ClientPlayHandle.insertClientPlay(cp.getItemids(), 1, ResultType.rt18, logcontent, 1,mark, "", 2);
				}
			}
			//轮播播放
			if(timelist==null||timelist.equals("")){
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt16);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
			}else{
				//多轮用 ^分割
				String[] timelistvss=timelist.split("\\^");
				String itemidss="";
				//String itemnamess="";
				String logcontents="";
				for (int i = 0; i < timelistvss.length; i++) {
					String[] tlvs=timelistvss[i].split("\\_");
					if(tlvs.length==4){
						ClientPlay cp=getItemIdsNames(tlvs[3]);
						String logcontent = Constant.LOCAL.getA00151()+":" + cp.getItemnames();
						if (tlvs[0].equals("8")) {
							logcontent += Constant.LOCAL.getA00483()+": ";
							
						} else if (tlvs[0].equals("7")) {
							logcontent += Constant.LOCAL.getA00482()+": ";
							
						} else if (tlvs[0].equals("6")) {
							logcontent += Constant.LOCAL.getA00481()+": ";
							
						} else if (tlvs[0].equals("5")) {
							logcontent += Constant.LOCAL.getA00480()+": ";
							
						} else if (tlvs[0].equals("4")) {
							logcontent += Constant.LOCAL.getA00479()+": ";
							
						} else if (tlvs[0].equals("3")) {
							logcontent += Constant.LOCAL.getA00478()+": ";
							
						} else if (tlvs[0].equals("2")) {
							logcontent += Constant.LOCAL.getA00476()+": ";
							
						} else if (tlvs[0].equals("1")) {
							logcontent += Constant.LOCAL.getA00475()+": ";
							
						}
						logcontent += " "+Constant.LOCAL.getA00540()+":" + tlvs[1];
						logcontent += " "+Constant.LOCAL.getA00541()+":" + tlvs[2];
						
						 if(itemidss.equals("")){
	                        	itemidss=cp.getItemids();
	                        	logcontents=logcontent;
	                     }else{
	                        	itemidss=itemidss+","+cp.getItemids();
	                        	logcontents=logcontents+"^"+logcontent;
	                     }
	                        
				}
			   }
			   ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt16, logcontents, 1, mark, "", 2);	
			}
			
			//插播节目
			if(cblist==null||cblist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt17);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
				
			}else{
				//多轮用 ^分割
				String[] cblistvss=cblist.split("\\^");
				String itemidss="";
				//String itemnamess="";
				String logcontents="";
				for (int i = 0; i < cblistvss.length; i++) {
					String[] cbvs=cblistvss[i].split("\\_");
					if(cbvs.length==3){
					    ClientPlay cp=getItemIdsNames(cbvs[2]);
					    
					    String logcontent = Constant.LOCAL.getA00152()+":" + cp.getItemnames();
					  
						logcontent += Constant.LOCAL.getA00582()+" :" + cbvs[0];

                        logcontent += Constant.LOCAL.getA00583()+" :" + cbvs[1];
                        
                        if(itemidss.equals("")){
                        	
                        	itemidss=cp.getItemids();
                        	
                        	logcontents=logcontent;
                        }else{
                        	itemidss=itemidss+","+cp.getItemids();
                        	
                        	logcontents=logcontents+"^"+logcontent;
                        }
                        
                        
					}
				}
				ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt17, logcontents, 1, mark, "", 2);
				
			}
			//有效期节目
			if(datelist==null||datelist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt23);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
				
			}else{
				//多轮用 ^分割
				String[] datelistvss=datelist.split("\\^");
				String itemidss="";
				//String itemnamess="";
				String logcontents="";
				for (int i = 0; i < datelistvss.length; i++) {
					String[] datelistvs= datelistvss[i].split("\\_");
					if(datelistvs.length==3){
					    ClientPlay cp=getItemIdsNames(datelistvs[2]);
					    
					    String[] itemIds=cp.getItemids().split(",");
						Item item;
						for (int j = 0; j < itemIds.length; j++) {
							if(itemIds[j].equals("")){
								
							}else{
								item=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_pro_id",Integer.parseInt(itemIds[j]));
								if(item!=null){
									
									if(item.getFilename().equals(currentFileName)){
										item.setIs_current(true);
									}else{
										item.setIs_current(false);
									}
									
									items.add(item);
								}
							}
						
							
						}
						
					    String logcontent = Constant.LOCAL.getA00642()+":" + cp.getItemnames();
					  
					    if(datelistvs[0].equals("-1")){
					    	logcontent += Constant.LOCAL.getA00582()+" :no";
					    }else{
					    	logcontent += Constant.LOCAL.getA00582()+" :" + datelistvs[0];	
					    }
						
					    if(datelistvs[1].equals("-1")){
					    	logcontent += Constant.LOCAL.getA00583()+" :no";
					    }else{
					    	logcontent += Constant.LOCAL.getA00583()+" :" + datelistvs[1];
					    }

                       
                        if(itemidss.equals("")){
                            
                        	itemidss=cp.getItemids();
                        	
                        	logcontents=logcontent;
                        }else{
                        	itemidss=itemidss+","+cp.getItemids();
                        	
                        	logcontents=logcontents+"^"+logcontent;
                        }
                        
                        
				    }
				}
				ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt23, logcontents, 1, mark, "", 2);
			}
			
			
			//条件节目
			if(conditionlist==null||conditionlist.equals("")){
				
				ClientPlay cp= new ClientPlay();
			    cp.setSendtype(ResultType.rt46);
				cp.setMark(mark);
				cp.setState(2);
				SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark_null", cp);
				
			}else{
				//多轮用 ^分割
				String[] datelistvss=conditionlist.split("\\^");
				String itemidss="";
				//String itemnamess="";
				String logcontents="";
				for (int i = 0; i < datelistvss.length; i++) {
					String[] datelistvs= datelistvss[i].split("\\_");
					if(datelistvs.length==3){
					    ClientPlay cp=getItemIdsNames(datelistvs[2]);
					    
					    String logcontent = Constant.LOCAL.getB00370()+":" + cp.getItemnames();
					  
					    if(datelistvs[0].equals("-1")){
					    	logcontent += Constant.LOCAL.getA00582()+" :no";
					    }else{
					    	logcontent += Constant.LOCAL.getA00582()+" :" + datelistvs[0];	
					    }
						
					    if(datelistvs[1].equals("-1")){
					    	logcontent += Constant.LOCAL.getA00583()+" :no";
					    }else{
					    	logcontent += Constant.LOCAL.getA00583()+" :" + datelistvs[1];
					    }

                       
                        if(itemidss.equals("")){
                            
                        	itemidss=cp.getItemids();
                        	
                        	logcontents=logcontent;
                        }else{
                        	itemidss=itemidss+","+cp.getItemids();
                        	
                        	logcontents=logcontents+"^"+logcontent;
                        }
                        
                        
				    }
				}
				ClientPlayHandle.insertClientPlay(itemidss, 1, ResultType.rt46, logcontents, 1, mark, "", 2);
			}
			
			
			try {
				//广告位剩余量
				if(number==null||number.equals("")){
					
					SqlConnect.getSqlMapInstance().delete("del_client_advertising", mark);
					
				}else{
					
					SqlConnect.getSqlMapInstance().delete("del_client_advertising", mark);
					ClientAdvertising cad=new ClientAdvertising();
					cad.setMark(mark);
					cad.setNumber(Integer.parseInt(number));
					cad.setUse_number(Integer.parseInt(use_number));
					SqlConnect.getSqlMapInstance().insert("add_client_advertising", cad);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			Device device=new Device();
			
			if(playState==null||playState.equals("")||playState.equals("null")){
				
			}else{
				device.setPlayState(Integer.parseInt(playState));	
			}
			
			device.setItems(items);
			Constant.clientPlayMap.put(sendkey, device);
		}
	   return SUCCESS;
	}
	 
	

	public String getPlayState() {
		return playState;
	}



	public void setPlayState(String playState) {
		this.playState = playState;
	}



	public static void main(String[] args) {
		
	}
	 
	public String getConfiginfo() {
		return configinfo;
	}


	public void setConfiginfo(String configinfo) {
		this.configinfo = configinfo;
	}


	/**
	 * 获取节目 ids names 
	 * @return
	 * @throws SQLException 
	 */
	public static ClientPlay getItemIdsNames(String filenames) throws SQLException{
		String[] plays=filenames.split("\\|");
		String content=Constant.LOCAL.getA00417()+ ":";
		String itemids="";
		String itemnames="";
		Item tempitem;
		for (String play : plays) {
			tempitem=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_filename", play);
			if(tempitem!=null){
				if(itemids.equals("")){
					itemids=tempitem.getId()+"";
					itemnames=tempitem.getName();
				}else{
					itemids=itemids+","+tempitem.getId()+"";
					itemnames=itemnames+","+tempitem.getName();
				}
			}
		}
		ClientPlay cp=new ClientPlay();
		cp.setItemids(itemids);
		cp.setItemnames(itemnames);
		return cp;
		
	} 
	
	
	
	
	/**
	 * 获取节目 ids names 多个
	 * @return
	 * @throws SQLException 
	 */
	public static ClientPlay getItemIdsNamesm(String filenames) throws SQLException{
		String[] plays=filenames.split("\\|");
		String content=Constant.LOCAL.getA00417()+ ":";
		String itemids="";
		String itemnames="";
		Item tempitem;
		String tempPlays[];
		for (String play : plays) {
			
			tempPlays=play.split("\\_");
			
			if(tempPlays.length==3){
				play=tempPlays[2];
			}else{
				play=tempPlays[0];
			}
			
			tempitem=(Item)SqlConnect.getSqlMapInstance().queryForObject("sel_item_filename", play);
			if(tempitem!=null){
				if(itemids.equals("")){
					itemids=tempitem.getId()+"";
					itemnames=tempitem.getName();
				}else{
					itemids=itemids+","+tempitem.getId()+"";
					itemnames=itemnames+","+tempitem.getName();
				}
			}
		}
		ClientPlay cp=new ClientPlay();
		cp.setItemids(itemids);
		cp.setItemnames(itemnames);
		return cp;
		
	} 
	 
	 
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getPlaylist() {
		return playlist;
	}
	public void setPlaylist(String playlist) {
		this.playlist = playlist;
	}
	public String getDplist() {
		return dplist;
	}
	public void setDplist(String dplist) {
		this.dplist = dplist;
	}
	public String getTimelist() {
		return timelist;
	}
	public void setTimelist(String timelist) {
		this.timelist = timelist;
	}
	public String getCblist() {
		return cblist;
	}
	public void setCblist(String cblist) {
		this.cblist = cblist;
	}
	public String getDatelist() {
			return datelist;
	}
    public void setDatelist(String datelist) {
			this.datelist = datelist;
	}
    public String getWarninglist() {
		return warninglist;
	}
    public void setWarninglist(String warninglist) {
		this.warninglist = warninglist;
	}

    public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getUse_number() {
		return use_number;
	}

	public void setUse_number(String use_number) {
		this.use_number = use_number;
	}
	public String getCurrentFileName() {
		return currentFileName;
	}

	public void setCurrentFileName(String currentFileName) {
		this.currentFileName = currentFileName;
	}

	public String getSendkey() {
		return sendkey;
	}

	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}
    
}
