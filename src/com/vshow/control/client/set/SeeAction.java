package com.vshow.control.client.set;



import java.io.File;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.Result;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DoVideo;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;

import com.vshow.control.tool.SqlConnect;

public class SeeAction extends ActionSupport {
	private int id;
	private String name;
	private int videox;
	private int videoy;
	private int videowidth;
	private int videoheight;
	private String videocontent;
	private String filename;
	
	private int imgw;
	private int imgh;
	private int propor=0;  //比例状态兼容版本 0关闭 1打开
	
	
	
	public String execute() throws Exception {
		Client cl = (Client) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_client_byid", id);
		name = cl.getName();
		filename = Long.toString(System.currentTimeMillis()) + ".png";
		File f = new File(Constant.SEE + File.separator + filename);
        String msg = "03+" + filename;
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
			/*cl = (Client) SqlConnect.getSqlMapInstance().queryForObject("see_terminal_server_mark",
					cl.getId());
			fzmsg = msg + "@0@";
			vlu = (String) hm.get(cl.getSrvmark());
			if (vlu == null) {
				hm.put(cl.getSrvmark(), fzmsg + cl.getMark());
			} else {
				hm.put(cl.getSrvmark(), vlu += "_" + cl.getMark());
			}*/
		}

		/*Iterator iit = hm.keySet().iterator();
		String tke;
		MyMsg myt;
		while (iit.hasNext()) {
			tke = (String) iit.next();
			Mlt mt = Constant.messageMap2.get(tke);
			if (mt != null) {
				myt = new MyMsg();
				myt.msg = (String) hm.get(tke);
				mt.allmsg.add(myt);
			}
		}*/

		int i = 0;
		while (true) {
			if (f.exists()) {
				String sd = Constant.imgMap.get(filename);
				
				if (sd == null) {
					break;
				} else {
					//System.out.println(sd);
					String[] sdsdd = sd.split("\\_");
					if (sdsdd.length == 7) {
						videox = Integer.parseInt(sdsdd[0].trim());
						videoy = Integer.parseInt(sdsdd[1].trim());
						videowidth = Integer.parseInt(sdsdd[2].trim());
						videoheight = Integer.parseInt(sdsdd[3].trim());
						DoVideo dv = new DoVideo();
						try {
							videocontent = Long.toString(System
									.currentTimeMillis())
									+ (int) (Math.random() * 100) + ".flv";
							dv.Do2(Constant.FILES + File.separator + sdsdd[4]
									+ "." + sdsdd[5], Constant.FILES
									+ File.separator + videocontent,
									Integer.parseInt(sdsdd[6]));
						} catch (Exception e) {

						}

					}else if(sdsdd.length==2){
						propor=1;
						imgw=Integer.parseInt(sdsdd[0].trim());
						imgh=Integer.parseInt(sdsdd[1].trim());
					}
					break;
				}
			} else {
				Thread.sleep(1000);
				i++;
				//if (i > 60) {
				//	break;
				//}
			}
		}
		if (!f.exists()) {
			propor=2;
		}
		Constant.imgMap.remove(filename);
		return SUCCESS;
	}

	

	public int getImgw() {
		return imgw;
	}

	public void setImgw(int imgw) {
		this.imgw = imgw;
	}

	public int getImgh() {
		return imgh;
	}

	public void setImgh(int imgh) {
		this.imgh = imgh;
	}

	public int getPropor() {
		return propor;
	}

	public void setPropor(int propor) {
		this.propor = propor;
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

	public int getVideox() {
		return videox;
	}

	public void setVideox(int videox) {
		this.videox = videox;
	}

	public int getVideoy() {
		return videoy;
	}

	public void setVideoy(int videoy) {
		this.videoy = videoy;
	}

	public int getVideowidth() {
		return videowidth;
	}

	public void setVideowidth(int videowidth) {
		this.videowidth = videowidth;
	}

	public int getVideoheight() {
		return videoheight;
	}

	public void setVideoheight(int videoheight) {
		this.videoheight = videoheight;
	}

	public String getVideocontent() {
		return videocontent;
	}

	public void setVideocontent(String videocontent) {
		this.videocontent = videocontent;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
