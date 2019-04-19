package com.vshow.control.api.item.fb;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.Log;
import com.vshow.control.data.Notice;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendNotice;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;


/**
 * 发布通知
 * @param account账号
 * @param password 密码 
 * @param tids 通知id
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiFbNoticeAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
	private String tids;
	private String cids;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				HashSet<Integer> tmidsset = new HashSet();
				try{	
					if (cids != null && !"".equals(cids)) {
						/** 获取选中的所有终端 **/
						String[] tids_s = cids.split("\\_");
						for (int i = 0; i < tids_s.length; i++) {
							tmidsset.add(Integer.parseInt(tids_s[i]));
						}
					}
					
					List<Notice> nlist = new ArrayList<Notice>();
					String[] ids = tids.split("\\_");
					for (int i = 0; i < ids.length; i++) {
						Notice notice=(Notice)SqlConnect.getSqlMapInstance().queryForObject("see_notice_id", Integer.parseInt(ids[i]));
						nlist.add(notice);
					}
					
					Notice nc = new Notice();
					String cmd = "";
					String ts = "";
					String ts2 = "";
					String tname = "";
					String ztys = "";
					String bjys = "";
					String tnames = "";
					
					String fonttitle = "";
					String fontcontent = "";
					String sdate = "";
					String edate = "";
					int fontcolor = 0;
					int fontsize = 0;
					int fonttype = 0;
					int backcolor = 0;
					int fontspeed = 0;
					int up = 0;

					String fontcontent2 = "";
					int fontcolor2 = 0;
					int fontsize2 = 0;
					int fonttype2 = 0;
					int backcolor2 = 0;
					int fontspeed2 = 0;
					int up2 = 0;
					
					int noticeid = 0;
						
					for (int i = 0; i < nlist.size(); i++) {
						nc = nlist.get(i);
						tname = "";
						ts = "";
						ts2 = "";
							
						if(!"0".equals(nc.getFontcontent()) && !"".equals(nc.getFontcontent())){
							fonttitle = nc.getFonttitle();
							fontcontent = nc.getFontcontent();
							fontcolor = nc.getFontcolor();
							fontsize = nc.getFontsize();
							fonttype = nc.getFonttype();
							backcolor = nc.getBackcolor();
							fontspeed = nc.getFontspeed();
							sdate = nc.getSdate();
							edate = nc.getEdate();
							up = nc.getUp();
							if(!"0".equals(nc.getFontcontent2()) && !"".equals(nc.getFontcontent2())){
								fontcontent2 = nc.getFontcontent2();
								fontcolor2 = nc.getFontcolor2();
								fontsize2 = nc.getFontsize2();
								fonttype2 = nc.getFonttype2();
								backcolor2 = nc.getBackcolor2();
								fontspeed2 = nc.getFontspeed2();
								//up2 = nc.getUp2();
							}
						}
						
						fontcontent = fontcontent.replaceAll("[~!%*|&@?=^#`]", "");
						if (fontcontent.equals("0")) {
							fontcontent = " ";
							tname = Constant.LOCAL.getA00535();
						} else {
							if (!fontcontent.isEmpty()) {

								if (ts.isEmpty()) {
									ts = "fontcontent|" + fontcontent;
									tname += Constant.LOCAL.getA00547() + ":" + fontcontent;
								} else {
									ts += "*fontcontent|" + fontcontent;
									tname += Constant.LOCAL.getA00547() + ":" + fontcontent;
								}
							}

							if (ts.isEmpty()) {
								ts = "up|" + up;
							} else {
								ts += "*up|" + up;
							}
							tname += "," + Constant.LOCAL.getA00548() + ":" + up;

							if (backcolor != -1) {
								// if (backcolor == -2) {
								// backcolor = -1;
								// }
								if (backcolor == -65536) {
									bjys = Constant.LOCAL.getA00338();
								} else if (backcolor == -16776961) {
									bjys = Constant.LOCAL.getA00339();
								} else if (backcolor == -256) {
									bjys = Constant.LOCAL.getA00342();
								} else if (backcolor == -16711936) {
									bjys = Constant.LOCAL.getA00341();
								} else if (backcolor == -2) {
									bjys = Constant.LOCAL.getA00340();
								} else if (backcolor == -7829368) {
									bjys = Constant.LOCAL.getA00343();
								} else if (backcolor == -16777216) {
									bjys = Constant.LOCAL.getA00337();
								} else if (backcolor == 0) {
									bjys = Constant.LOCAL.getA00366();
								}
								if (ts.isEmpty()) {
									ts = "backcolor|" + backcolor;
									tname += "," + Constant.LOCAL.getA00551() + ":" + bjys;
								} else {
									ts += "*backcolor|" + backcolor;
									tname += "," + Constant.LOCAL.getA00551() + ":" + bjys;
								}
							}
							if (fonttype != -1) {
								if (ts.isEmpty()) {
									ts = "fonttype|" + fonttype;
								} else {
									ts += "*fonttype|" + fonttype;
								}
							}
							if (fontcolor != -1) {
								// if (fontcolor == -2) {
								// fontcolor = -1;
								// }
								if (fontcolor == -65536) {
									ztys = Constant.LOCAL.getA00338();
								} else if (fontcolor == -16776961) {
									ztys = Constant.LOCAL.getA00339();
								} else if (fontcolor == -256) {
									ztys = Constant.LOCAL.getA00342();
								} else if (fontcolor == -16711936) {
									ztys = Constant.LOCAL.getA00341();
								} else if (fontcolor == -2) {
									ztys = Constant.LOCAL.getA00340();
								} else if (fontcolor == -7829368) {
									ztys = Constant.LOCAL.getA00343();
								} else if (fontcolor == -16777216) {
									ztys = Constant.LOCAL.getA00337();
								} else if (fontcolor == 0) {
									ztys = Constant.LOCAL.getA00366();
								}
								if (ts.isEmpty()) {
									tname += "," + Constant.LOCAL.getA00552() + ":" + ztys;

									ts = "fontcolor|" + fontcolor;
								} else {
									tname += "," + Constant.LOCAL.getA00552() + ":" + ztys;
									ts += "*fontcolor|" + fontcolor;
								}
							}

							if (fontspeed != -1) {
								if (ts.isEmpty()) {
									ts = "fontspeed|" + fontspeed;
								} else {
									ts += "*fontspeed|" + fontspeed;
								}
								tname += "," + Constant.LOCAL.getA00550() + ":" + fontspeed;
							}

							if (fontsize != -1) {
								if (ts.isEmpty()) {
									ts = "fontsize|" + fontsize;
								} else {
									ts += "*fontsize|" + fontsize;
								}
								tname += "," + Constant.LOCAL.getA00549() + ":" + fontsize;
							}

							// 第二个通知
							if (fontcontent2 != null && !"".equals(fontcontent2)) {
								fontcontent2 = fontcontent2
										.replaceAll("[~!%*|&@?=^#`]", "");
								if (!fontcontent2.isEmpty()) {

									if (ts.isEmpty()) {
										ts2 = "fontcontent2|" + fontcontent2;

									} else {
										ts2 += "*fontcontent2|" + fontcontent2;

									}
								}
								// if (up2 != -1) {
								if (ts2.isEmpty()) {
									ts2 = "up2|" + up2;
								} else {
									ts2 += "*up2|" + up2;
								}

								// }
								if (backcolor2 != -1) {

									if (ts.isEmpty()) {
										ts2 = "backcolor2|" + backcolor2;

									} else {
										ts2 += "*backcolor2|" + backcolor2;

									}
								}
								if (fonttype2 != -1) {
									if (ts2.isEmpty()) {
										ts2 = "fonttype2|" + fonttype2;
									} else {
										ts2 += "*fonttype2|" + fonttype2;
									}
								}
								if (fontcolor2 != -1) {

									if (ts2.isEmpty()) {

										ts2 = "fontcolor2|" + fontcolor2;
									} else {

										ts2 += "*fontcolor2|" + fontcolor2;
									}
								}

								if (fontspeed2 != -1) {
									if (ts2.isEmpty()) {
										ts2 = "fontspeed2|" + fontspeed2;
									} else {
										ts2 += "*fontspeed2|" + fontspeed2;
									}

								}

								if (fontsize2 != -1) {
									if (ts2.isEmpty()) {
										ts2 = "fontsize2|" + fontsize2;
									} else {
										ts2 += "*fontsize2|" + fontsize2;
									}

								}

								if (!"".equals(ts2)) {
									ts = ts + ts2;
								} else if ("".equals(ts)) {
									ts = ts2;
								}
							} else {
								ts = ts
										+ "*fontcontent2|*up2|*backcolor2|*fonttype2|*fontcolor2|*fontspeed2|*fontsize2|";
							}
							ts = ts + "*fonttime|" + sdate + "_" + edate;
							tname = tname + "   " + sdate + "_" + edate;
						}
						if (i == 0) {
							cmd = ts;
							tnames = tname;
						} else {
							cmd = cmd + "^" + ts;
							tnames = tnames + "^" + tname;
						}
					}
					SendNotice sn;
					Client client;
					int rid;

					Log log = LogHandle.insertTheLogSend(LogType.type20, user.getId(),
							tnames, 1);

					String sendkey = log.getSendkey();

					String msg = "01+" + "sendkey!" + sendkey + "#scrollfont!" + cmd;
	                //System.out.println(msg);
					log.setMsg(msg);
					SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
					Result rs = new Result();

					// String vlu;
					MyMsg mymsg;

					/** 发送给终端 **/
					for (Integer cid : tmidsset) {
						client = (Client) SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", cid);
						// sm.delete("del_one_senditem", client.getId());
						rs.setClid(client.getId());
						rs.setLogid(log.getId());
						rs.setState(0);
						rs.setType(ResultType.rt15);
						rid = (Integer) SqlConnect.getSqlMapInstance().insert("ad_result", rs);
						/** 添加指令记录 **/
						// Constant.addCml(cid, rid, log.getId(),log.getSendkey());
						SqlConnect.getSqlMapInstance().delete("del_one_sendnotic", client.getId());
						if (noticeid != 0) {
							sn = new SendNotice();
							sn.setResultid(rid);
							sn.setNoticeid(noticeid);
							SqlConnect.getSqlMapInstance().insert("insert_one_sendnotice", sn);
						}
						if (client.getServerid() == 0) {
							Mlt mt = Constant.messageMap.get(client.getMark());
							if (mt != null) {
								mymsg = new MyMsg();
								mymsg.msg = msg;
								mymsg.sendkey = log.getSendkey();
								mt.allmsg.add(mymsg);
							}
						} 
					}
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);
	
		content = jsons.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}