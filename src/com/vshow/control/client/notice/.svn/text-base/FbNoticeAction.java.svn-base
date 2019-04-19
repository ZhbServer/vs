package com.vshow.control.client.notice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Notice;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendNotice;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.Local;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;

public class FbNoticeAction implements Action {

	private String clientids; // 终端id多个以"_"分割

	private String sdate;
	private String edate;

	private String fonttitle;
	private String fontcontent;
	private int fontcolor;
	private int backcolor;
	private int fonttype;
	private int fontsize;
	private int fontspeed;
	private int up;

	private String fontcontent2;
	private int fontcolor2;
	private int backcolor2;
	private int fonttype2;
	private int fontsize2;
	private int fontspeed2;
	private int up2;

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put("url", "reusltlast.vs");
		int uid = (Integer) session.get("urid");
		int uocheck = (Integer) session.get("urcheck");
		Local local = (Local) session.get("local");
		HashSet<Integer> tmidsset = new HashSet();

		if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\_");
			for (int i = 0; i < tids_s.length; i++) {
				tmidsset.add(Integer.parseInt(tids_s[i]));
			}
		}

		String ts = "";
		String ts2 = "";
		String tname = "";
		String ztys = "";
		String bjys = "";
		SendNotice sn = new SendNotice();
		int noticeid = 0;

		if (!"0".equals(fontcontent)) {
			Notice nc = new Notice();
			nc.setFonttitle(fonttitle);
			nc.setFontcontent(fontcontent);
			nc.setFontcolor(fontcolor);
			nc.setFontsize(fontsize);
			nc.setFonttype(fonttype);
			nc.setBackcolor(backcolor);
			nc.setFontspeed(fontspeed);
			nc.setSdate(sdate);
			nc.setEdate(edate);
			nc.setUp(up);
			if (!"0".equals(fontcontent2) && !"".equals(fontcontent2)) {
				nc.setFontcontent2(fontcontent2);
				nc.setFontcolor2(fontcolor2);
				nc.setFontsize2(fontsize2);
				nc.setFonttype2(fonttype2);
				nc.setBackcolor2(backcolor2);
				nc.setFontspeed2(fontspeed2);
				nc.setUp2(up2+"");
			}
			nc.setUrid(uid);
			noticeid = (Integer) sm.insert("insert_one_notice", nc);

		}
		fontcontent = fontcontent.replaceAll("[~!%*|&@?=^#`]", "");
		if (fontcontent.equals("0")) {
			fontcontent = " ";
			tname = local.getA00535();
		} else {
			if (!fontcontent.isEmpty()) {

				if (ts.isEmpty()) {
					ts = "fontcontent|" + fontcontent;
					tname += local.getA00547() + ":" + fontcontent;
				} else {
					ts += "*fontcontent|" + fontcontent;
					tname += local.getA00547() + ":" + fontcontent;
				}
			}

			if (ts.isEmpty()) {
				ts = "up|" + up;
			} else {
				ts += "*up|" + up;
			}
			tname += "," + local.getA00548() + ":" + up;

			if (backcolor != -1) {
				// if (backcolor == -2) {
				// backcolor = -1;
				// }
				if (backcolor == -65536) {
					bjys = local.getA00338();
				} else if (backcolor == -16776961) {
					bjys = local.getA00339();
				} else if (backcolor == -256) {
					bjys = local.getA00342();
				} else if (backcolor == -16711936) {
					bjys = local.getA00341();
				} else if (backcolor == -2) {
					bjys = local.getA00340();
				} else if (backcolor == -7829368) {
					bjys = local.getA00343();
				} else if (backcolor == -16777216) {
					bjys = local.getA00337();
				} else if (backcolor == 0) {
					bjys = local.getA00366();
				}
				if (ts.isEmpty()) {
					ts = "backcolor|" + backcolor;
					tname += "," + local.getA00551() + ":" + bjys;
				} else {
					ts += "*backcolor|" + backcolor;
					tname += "," + local.getA00551() + ":" + bjys;
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
					ztys = local.getA00338();
				} else if (fontcolor == -16776961) {
					ztys = local.getA00339();
				} else if (fontcolor == -256) {
					ztys = local.getA00342();
				} else if (fontcolor == -16711936) {
					ztys = local.getA00341();
				} else if (fontcolor == -2) {
					ztys = local.getA00340();
				} else if (fontcolor == -7829368) {
					ztys = local.getA00343();
				} else if (fontcolor == -16777216) {
					ztys = local.getA00337();
				} else if (fontcolor == 0) {
					ztys = local.getA00366();
				}
				if (ts.isEmpty()) {
					tname += "," + local.getA00552() + ":" + ztys;

					ts = "fontcolor|" + fontcolor;
				} else {
					tname += "," + local.getA00552() + ":" + ztys;
					ts += "*fontcolor|" + fontcolor;
				}
			}

			if (fontspeed != -1) {
				if (ts.isEmpty()) {
					ts = "fontspeed|" + fontspeed;
				} else {
					ts += "*fontspeed|" + fontspeed;
				}
				tname += "," + local.getA00550() + ":" + fontspeed;
			}

			if (fontsize != -1) {
				if (ts.isEmpty()) {
					ts = "fontsize|" + fontsize;
				} else {
					ts += "*fontsize|" + fontsize;
				}
				tname += "," + local.getA00549() + ":" + fontsize;
			}

			// 第二个通知
			if (fontcontent2 != null && !"".equals(fontcontent2)) {
				fontcontent2 = fontcontent2.replaceAll("[~!%*|&@?=^#`]", "");
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
		Client client;
		int rid;
		// 判断用户有没有发送权限(0.需审核 1.已审核 2 节目需要审核 3.发布需要审核)
		if (uocheck == 0 || uocheck == 3) {
			Log log = LogHandle.insertTheLogSend(LogType.type20, uid, tname, 2);
			Result rs = new Result();
			Send sd = new Send();
			for (Integer cid : tmidsset) {
				client = (Client) sm.queryForObject("sel_client_byid", cid);
				// sm.delete("del_one_senditem", client.getId());
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt15);
				rid = (Integer) sm.insert("ad_result", rs);
				/** 添加指令记录 **/
				// Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				sm.delete("del_one_sendnotic", client.getId());
				if (noticeid != 0) {
					sn.setResultid(rid);
					sn.setNoticeid(noticeid);
					sm.insert("insert_one_sendnotice", sn);
				}
			}
		} else if (uocheck == 1 || uocheck == 2) {
			Log log = LogHandle.insertTheLogSend(LogType.type20, uid, tname, 1);

			String sendkey = log.getSendkey();

			String msg = "01+" + "sendkey!" + sendkey + "#scrollfont!" + ts;

			log.setMsg(msg);
			sm.update("upd_log_send_msg", log);
			Result rs = new Result();
			HashMap hm = new HashMap();

			// String vlu;
			MyMsg mymsg;

			for (Integer cid : tmidsset) {
				client = (Client) sm.queryForObject("sel_client_byid", cid);
				// sm.delete("del_one_senditem", client.getId());
				rs.setClid(client.getId());
				rs.setLogid(log.getId());
				rs.setState(0);
				rs.setType(ResultType.rt15);
				rid = (Integer) sm.insert("ad_result", rs);
				/** 添加指令记录 **/
				// Constant.addCml(cid, rid, log.getId(),log.getSendkey());
				sm.delete("del_one_sendnotic", client.getId());
				if (noticeid != 0) {
					sn.setResultid(rid);
					sn.setNoticeid(noticeid);
					sm.insert("insert_one_sendnotice", sn);
				}
				if (client.getServerid() == 0) {
					Mlt mt = Constant.messageMap.get(client.getMark());
					if (mt != null) {
						mymsg = new MyMsg();
						mymsg.msg = msg;
						mymsg.sendkey = log.getSendkey();
						mt.allmsg.add(mymsg);
					}
				} else {
					/*
					 * client = (Client) sm.queryForObject(
					 * "see_terminal_server_mark", client.getId()); fzmsg = msg
					 * + "@" + sendkey + "@"; vlu = (String)
					 * hm.get(client.getSrvmark()); if (vlu == null) {
					 * hm.put(client.getSrvmark(), fzmsg + client.getMark()); }
					 * else { hm.put(client.getSrvmark(), vlu += "_" +
					 * client.getMark()); }
					 */
				}

			}
			/*
			 * Iterator iit = hm.keySet().iterator(); String tke; MyMsg myt;
			 * while (iit.hasNext()) { tke = (String) iit.next(); Mlt mt =
			 * Constant.messageMap2.get(tke); if (mt != null) { myt = new
			 * MyMsg(); myt.msg = (String) hm.get(tke); int allmsgSize =
			 * mt.allmsg.size(); if (allmsgSize == 2) { mt.allmsg.remove(0); }
			 * else if (allmsgSize > 2) { mt.allmsg.clear(); }
			 * mt.allmsg.add(myt); } }
			 */

		}

		return SUCCESS;
	}

	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getFonttitle() {
		return fonttitle;
	}

	public void setFonttitle(String fonttitle) {
		this.fonttitle = fonttitle;
	}

	public String getFontcontent() {
		return fontcontent;
	}

	public void setFontcontent(String fontcontent) {
		this.fontcontent = fontcontent;
	}

	public int getFontcolor() {
		return fontcolor;
	}

	public void setFontcolor(int fontcolor) {
		this.fontcolor = fontcolor;
	}

	public int getBackcolor() {
		return backcolor;
	}

	public void setBackcolor(int backcolor) {
		this.backcolor = backcolor;
	}

	public int getFonttype() {
		return fonttype;
	}

	public void setFonttype(int fonttype) {
		this.fonttype = fonttype;
	}

	public int getFontsize() {
		return fontsize;
	}

	public void setFontsize(int fontsize) {
		this.fontsize = fontsize;
	}

	public int getFontspeed() {
		return fontspeed;
	}

	public void setFontspeed(int fontspeed) {
		this.fontspeed = fontspeed;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public String getFontcontent2() {
		return fontcontent2;
	}

	public void setFontcontent2(String fontcontent2) {
		this.fontcontent2 = fontcontent2;
	}

	public int getFontcolor2() {
		return fontcolor2;
	}

	public void setFontcolor2(int fontcolor2) {
		this.fontcolor2 = fontcolor2;
	}

	public int getBackcolor2() {
		return backcolor2;
	}

	public void setBackcolor2(int backcolor2) {
		this.backcolor2 = backcolor2;
	}

	public int getFonttype2() {
		return fonttype2;
	}

	public void setFonttype2(int fonttype2) {
		this.fonttype2 = fonttype2;
	}

	public int getFontsize2() {
		return fontsize2;
	}

	public void setFontsize2(int fontsize2) {
		this.fontsize2 = fontsize2;
	}

	public int getFontspeed2() {
		return fontspeed2;
	}

	public void setFontspeed2(int fontspeed2) {
		this.fontspeed2 = fontspeed2;
	}

	public int getUp2() {
		return up2;
	}

	public void setUp2(int up2) {
		this.up2 = up2;
	}

}
