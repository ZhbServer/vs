package com.vshow.control.voicebroadcast;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Jh;
import com.vshow.control.data.Notice;
import com.vshow.control.data.NoticeJhRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.data.VoiceBroadcast;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToVoiceBroadcastListAction extends ActionSupport {
	
	private int id; // 当前页数
	private int total; // 总页数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private Pages ps;
	private Integer pagetype=10;
	
	
	
	private List<VoiceBroadcast> voices;
	

	private String uids; // 所有用户id拼接
	private String tids; // 所有终端id拼接

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		//分页类型存入session
		if(pagetype==null){
			
			//查看session是否有分页类型 null择默认10条显示
			Integer publicPagetype=(Integer)session.get("publicPagetype");
			if(publicPagetype==null){
				session.put("publicPagetype", 10);
				pagetype=10;
			}else{
				pagetype=publicPagetype;
			}
		}else{
			session.put("publicPagetype", pagetype);
		}
		
		if (id <= 0) {
			id = 1;
		}
		
		total = (Integer) sm.queryForObject("see_notice_all_page_count");
		//获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if(pagetype==-1){
			pagetype=total;
		}
		
		
		User user=new User();
		user.setId(uid);
		user.setStartid((id - 1) * pagetype);
		user.setPagetype(pagetype);
		voices = sm.queryForList("sel_voicebroadcast_page", user);
		

		if(pagetype==0){
		}else{
			if (total % pagetype > 0) { 
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}
			
		}
		qian = id - 1;
		hou = id + 1;
		if (hou >= totalpage) {
			hou = totalpage;
		}
		ps = Constant.getPages(totalpage, id);
		
		return SUCCESS;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getQian() {
		return qian;
	}

	public void setQian(int qian) {
		this.qian = qian;
	}

	public int getHou() {
		return hou;
	}

	public void setHou(int hou) {
		this.hou = hou;
	}

	public Pages getPs() {
		return ps;
	}

	public void setPs(Pages ps) {
		this.ps = ps;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}


	

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}
	
	public List<VoiceBroadcast> getVoices() {
		return voices;
	}

	public void setVoices(List<VoiceBroadcast> voices) {
		this.voices = voices;
	}
}
