package com.vshow.control.advertising;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.AdvertisingPlay;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiPlayCount;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;
import java.util.Calendar;

public class advertisingPlayCountAction implements Action {

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1文件名,用户名)
	private Pages ps; // 分页
	private Integer pagetype; // 页码类型(10,20,30)
	private String stype = ""; // 素材类型
	private String datemode; // 时间类型
	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String zdybtime = "";
	private String zdyetime = "";
	private int timediffer = 0;

	private List<AdvertisingPlay> spcList;
	
	AdvertisingPlay  ap;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
		
		// 时间类型存入session
		if(datemode == null){
			// 查看session是否有时间类型 null择默认1显示
			String olddatemode = (String) session.get("publicDatemode");
			if (olddatemode == null) {
				session.put("publicDatemode", "1");
			}else{
				session.put("publicDatemode", olddatemode);
			}
		}else{
			session.put("publicDatemode", datemode);
		}
		
		// 当前页码
		if (id <= 0) {
			id = 1;
		}
		
		
				

		ap = new AdvertisingPlay();
		
		ap.setTkey(tkey);
		
		String olddatemode = (String)session.get("publicDatemode");
		
		if(olddatemode == null){
			olddatemode = "1";
		}
		if(olddatemode.equals("0") && btime.equals("") && etime.equals("")){
			olddatemode = "1";
			session.put("publicDatemode", olddatemode);
		}
		
		//当天
		if(olddatemode.equals("1")){
			btime = sdf.format(getTimesmorning());
			etime = sdf.format(new Date());
		//本周	
		}else if(olddatemode.equals("2")){
			btime = sdf.format(getTimesWeekmorning());
			etime = sdf.format(new Date());
		//本月	
		}else if(olddatemode.equals("3")){
			btime = sdf.format(getTimesMonthmorning());
			etime = sdf.format(new Date());
		//本年	
		}else if(olddatemode.equals("4")){
			btime = sdf.format(getCurrYearFirst());
			etime = sdf.format(new Date());
		//自定义	
		}else if(olddatemode.equals("0")){
			zdybtime = btime;
			zdyetime = etime;
			Date bd = sdf.parse(btime);
			Date ed = sdf.parse(etime);
			btime = sdf.format(bd);
			etime = sdf.format(ed);
		}
		ap.setBtime(btime);
		ap.setEtime(etime);
		
		timediffer = TimeDifference(ap);
		
		if(sel == 0){
			// 查询全部
			//if (TimeDifference(ap) > 0) {
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_count_group", ap);
			//}else{
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_count", ap);
			//}
			total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
							"sel_adPlay_list_count", ap);
			
			
		}else if(sel ==1){
			//spc.setName(ser);
			// 条件查询节目名
			//if (TimeDifference(spc) > 0) {
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_name_count_group", spc);
			//}else{
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_name_count", spc);
			//}
		}else if(sel ==2){
			//ap.setSname(ser);
			// 条件查询素材名
			//if (TimeDifference(ap) > 0) {
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_sname_count_group", ap);
			//}else{
			//	total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
			//			"sel_scpc_list_sname_count", ap);
			//}
		}
		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		ap.setStartid((id - 1) * pagetype);
		ap.setPagetype(pagetype);

		if(sel == 0){
			// 查询全部
			//if (TimeDifference(ap) > 0) {
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_group_click", ap);
			//}else{
			//	spcList = SqlConnect.getSqlMapInstance().queryForList("sel_scpc_list_click", ap);
			//}
			spcList = SqlConnect.getSqlMapInstance().queryForList("sel_adPlay_list", ap);
			
		}else if(sel ==1){
			//spc.setName(ser);
			// 条件查询节目名
			//if (TimeDifference(spc) > 0) {
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_name_group", spc);
			//}else{
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_name", spc);
			//}
		}else if(sel ==2){
			//spc.setSname(ser);
			// 条件查询素材名
			//if (TimeDifference(ap) > 0) {
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_sname_group_click", ap);
			//}else{
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_sname_click", ap);
			//}
		}
		
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
	
	
	public List<AdvertisingPlay> getSpcList() {
		return spcList;
	}


	public void setSpcList(List<AdvertisingPlay> spcList) {
		this.spcList = spcList;
	}


	public AdvertisingPlay getAp() {
		return ap;
	}


	public void setAp(AdvertisingPlay ap) {
		this.ap = ap;
	}


	// 获得当天0点时间  
	public static Date getTimesmorning() {
		Calendar cal = Calendar.getInstance();  
		cal.set(Calendar.HOUR_OF_DAY, 0);  
		cal.set(Calendar.SECOND, 0);  
		cal.set(Calendar.MINUTE, 0);  
		cal.set(Calendar.MILLISECOND, 0);  
		return cal.getTime();  
	}  
	
	// 获得本周第一天0点时间  
	public static Date getTimesWeekmorning() {  
		Calendar cal = Calendar.getInstance();  
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);  
		cal.setFirstDayOfWeek(Calendar.SUNDAY);
		cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());  
		return cal.getTime();  
	}  
	
	// 获得本月第一天0点时间  
	public static Date getTimesMonthmorning() {  
		Calendar cal = Calendar.getInstance();  
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);  
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));  
		return cal.getTime();  
	}  

	/** 
	 * 获取当年的第一天 
	 * @param year 
	 * @return 
	 */  
	public static Date getCurrYearFirst(){  
		Calendar currCal=Calendar.getInstance();    
		int currentYear = currCal.get(Calendar.YEAR);  
		return getYearFirst(currentYear);  
	}  
	  
	  
	/** 
	 * 获取某年第一天日期 
	 * @param year 年份 
	 * @return Date 
	 */  
	public static Date getYearFirst(int year){  
		Calendar calendar = Calendar.getInstance();  
		calendar.clear();  
		calendar.set(Calendar.YEAR, year);  
		Date currYearFirst = calendar.getTime();  
		return currYearFirst;  
	}  
	  
	public static int TimeDifference(AdvertisingPlay ap) {
		String s1 = ap.getEtime();
		String s2 = ap.getBtime();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		int count = 0;
		try {
			Date d1 = df.parse(s1);
			Date d2 = df.parse(s2);
			count = (int) ((d1.getTime() - d2.getTime()) / (60 * 60 * 1000 * 24));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getTimediffer() {
		return timediffer;
	}

	public void setTimediffer(int timediffer) {
		this.timediffer = timediffer;
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

	public Integer getPagetype() {
		return pagetype;
	}

	public void setPagetype(Integer pagetype) {
		this.pagetype = pagetype;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	

	public String getDatemode() {
		return datemode;
	}

	public void setDatemode(String datemode) {
		this.datemode = datemode;
	}

	public String getZdybtime() {
		return zdybtime;
	}

	public void setZdybtime(String zdybtime) {
		this.zdybtime = zdybtime;
	}

	public String getZdyetime() {
		return zdyetime;
	}

	public void setZdyetime(String zdyetime) {
		this.zdyetime = zdyetime;
	}
	

}
