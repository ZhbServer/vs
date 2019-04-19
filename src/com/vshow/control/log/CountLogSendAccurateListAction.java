package com.vshow.control.log;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class CountLogSendAccurateListAction extends ActionSupport {
	
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1用户名) 
	private Pages ps;     //分页
    private Integer pagetype=10;  //页码类型(10,20,30)
    
    private List<Log> logs;  //日志集合
    
    
    
    
    
    public String execute() throws Exception {
    	ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		// 分页类型存入session
		if (pagetype == null) {

			// 查看session是否有分页类型 null择默认10条显示
			Integer publicPagetype = (Integer) session.get("publicPagetype");
			if (publicPagetype == null) {
				session.put("publicPagetype", 10);
				pagetype = 10;
			} else {
				pagetype = publicPagetype;
			}
		} else {
			session.put("publicPagetype", pagetype);
		}
		
		Log templog=new Log();
		//查询当前用户，下级用户的素材
		templog.setTkey(tkey);
		templog.setStype(LogType.type104);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		
		if(sel==0){
			total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_stype_all_count",templog);
		}else{
			total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_log_send_uname_stype_all_count",templog);
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}
		
		templog.setStartid((id - 1) * pagetype);
		templog.setPagetype(pagetype);
		
		if(sel==0){
			logs=SqlConnect.getSqlMapInstance().queryForList("sel_log_send_stype_all",templog);
		}else if(sel==1){
			templog.setUname(ser);
			logs=SqlConnect.getSqlMapInstance().queryForList("sel_log_send_uname_stype_all",templog);
		}
		subStringList(logs);
		
		if (pagetype == 0) {
		} else {
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
    // 截取字符串
    public void subStringList(List<Log> list) {
		for (Log log : list) {
			int loglen = log.getContent().length();
			if (loglen >= 40) {
				log.setContentsub((log.getContent().substring(0, 39) + "..."));
			} else {
				log.setContentsub(log.getContent());
			}
		}
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
	public String getSer() {
		return ser;
	}
	public void setSer(String ser) {
		this.ser = ser;
	}
	public int getSel() {
		return sel;
	}
	public void setSel(int sel) {
		this.sel = sel;
	}
	public Pages getPs() {
		return ps;
	}
	public void setPs(Pages ps) {
		this.ps = ps;
	}
	public int getPagetype() {
		return pagetype;
	}
	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}
	public List<Log> getLogs() {
		return logs;
	}
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}
	
}
