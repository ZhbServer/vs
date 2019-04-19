package com.vshow.control.index;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.vshow.control.data.Client;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;

public class IndexAction implements Action {

	private int onclient;     //在线终端
	private int offclient;    //离线终端
	private int cocount;      //终端总数
	private int noterminal;   //未录入终端
	private int nocheckitem;  //未审核节目
    private int nocheckjh;     //未审核计划
    private int nocheckdata;   //未审核数据

    
	public int getNocheckdata() {
		return nocheckdata;
	}

	public void setNocheckdata(int nocheckdata) {
		this.nocheckdata = nocheckdata;
	}

	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		//long btime=0L;
		
		//long etime=0L;
		
		//btime=System.currentTimeMillis();
		
		//etime=System.currentTimeMillis()-btime;
	    
		//System.out.println("MainReCeMsgHandle0:"+etime);
		
		//获取当前用户下终端
		List clientlist=SqlConnect.getSqlMapInstance().queryForList("sel_client_ccount_all_rj", urid);
		
		
		//etime=System.currentTimeMillis()-btime;
	    //System.out.println("MainReCeMsgHandle1:"+etime);
		
		
		cocount=clientlist.size();
		
		// 判断终端在不在线
		/*Client cl;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < clientlist.size(); i++) {

			Long lo = 0L;
			cl = (Client) clientlist.get(i);

			try {
				if (cl.getLast() == null || "".equals(cl.getLast())) {
					lo = 0L;
				} else {
					Date dd = df.parse(cl.getLast());
					long oDate = dd.getTime();
					long nDate = new Date().getTime();
					lo = nDate - oDate;
				}
			} catch (ParseException e) {
				lo = 0L;
				e.printStackTrace();
			}
			if (lo == 0) {
				//clientlist.get(i).setZxstate(0);
				offclient++;
			} else if (lo < Constant.OUT) {
				//clientlist.get(i).setZxstate(1);
				onclient++;
			} else {
				//clientlist.get(i).setZxstate(0);
				offclient++;
			}

		}*/
		User tuser=new User();
		tuser.setId(urid);
		tuser.setZxstate(1);
		onclient=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_onclient_zxstate_count_rj", tuser);
		
		//etime=System.currentTimeMillis()-btime;
	    //System.out.println("MainReCeMsgHandle2:"+etime);
		
		
		tuser.setZxstate(0);
		offclient=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_onclient_zxstate_count_rj", tuser);
		
		//etime=System.currentTimeMillis()-btime;
	    //System.out.println("MainReCeMsgHandle3:"+etime);
	    
		// 获取未录入的终端
		noterminal = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_unclient_count");
		
		//etime=System.currentTimeMillis()-btime;
	   // System.out.println("MainReCeMsgHandle4:"+etime);
	    
		
		// 获取未审核的节目
		User u = new User();
		u.setId(urid);
		u.setTkey(tkey);
		nocheckitem = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_nocheckitem_count", u);
		
		
		//etime=System.currentTimeMillis()-btime;
	    //System.out.println("MainReCeMsgHandle6:"+etime);
	    
	    
		
		int tempinteract = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_nocheckinteractitem_count", u);
		
		//etime=System.currentTimeMillis()-btime;
	    //System.out.println("MainReCeMsgHandle7:"+etime);
		
		//获取未录入的计划
		u.setOcheck(2);
		nocheckjh=(Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_nocheck_jh_all_count", u);
		
		nocheckitem=nocheckitem+tempinteract;
		
		
		//未审核的数据nocheckdata
		if(new VVersion().dishOnOff.equals("1")){
			u.setOcheck(0);
			nocheckdata=(Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_noncheck_dish_all_count", u);
			
		}
		
		
		return SUCCESS;
	}

	public int getNocheckjh() {
		return nocheckjh;
	}

	public void setNocheckjh(int nocheckjh) {
		this.nocheckjh = nocheckjh;
	}

	public int getNocheckitem() {
		return nocheckitem;
	}

	public void setNocheckitem(int nocheckitem) {
		this.nocheckitem = nocheckitem;
	}

	public int getNoterminal() {
		return noterminal;
	}

	public void setNoterminal(int noterminal) {
		this.noterminal = noterminal;
	}
	
	public int getOnclient() {
		return onclient;
	}

	public int getOffclient() {
		return offclient;
	}

	public int getCocount() {
		return cocount;
	}

	public void setCocount(int cocount) {
		this.cocount = cocount;
	}

	public void setOnclient(int onclient) {
		this.onclient = onclient;
	}

	public void setOffclient(int offclient) {
		this.offclient = offclient;
	}

}
