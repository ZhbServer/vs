package com.vshow.control.statics;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class clientZxTimeAction implements Action {

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1文件名,用户名)
	private Pages ps; // 分页
	private Integer pagetype; // 页码类型(10,20,30)
	private String datemode = ""; // 时间类型
	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String zdybtime = ""; 
	private String zdyetime = "";
	private int timediffer = 0;

	private List<CountClientTime> cctList;
	private CountClientTime cct;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int uid = (Integer) session.get("urid");

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
		// 当前页码
		if (id <= 0) {
			id = 1;
		}

		cct = new CountClientTime();
		cct.setUid(uid);
		if (datemode.equals("")) {
			datemode = "1";
		}

		if (datemode.equals("1")) {
			btime = sdf.format(getTimesmorning());
			etime = sdf.format(new Date());
		} else if (datemode.equals("2")) {
			btime = sdf.format(getTimesWeekmorning());
			etime = sdf.format(new Date());
		} else if (datemode.equals("3")) {
			btime = sdf.format(getTimesMonthmorning());
			etime = sdf.format(new Date());
		} else if (datemode.equals("4")) {
			btime = sdf.format(getCurrYearFirst());
			etime = sdf.format(new Date());
		} else if (datemode.equals("0")) {
			zdybtime = btime;
			zdyetime = etime;
			Date bd = sdf.parse(btime.substring(0,10));
			Date ed = sdf.parse(etime.substring(0,10));
			btime = sdf.format(bd);
			etime = sdf.format(ed);
		}
		cct.setBtime(btime);
		cct.setEtime(etime);

		timediffer = TimeDifference(cct);
		
		if (sel == 0) {
			// 查询全部
			if (TimeDifference(cct) > 0) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_count_group", cct);
			}else{
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_count", cct);
			}
		} else if (sel == 1) {
			cct.setName(ser);
			// 条件查询终端名
			if (TimeDifference(cct) > 0) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_name_count_group", cct);
			}else{
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_name_count", cct);
			}
		} else if (sel == 2) {
			cct.setIp(ser);
			// 条件查询终端ip
			if (TimeDifference(cct) > 0) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_ip_count_group", cct);
			}else{
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_ip_count", cct);
			}
		} else if (sel == 3) {
			cct.setMark(ser);
			// 条件查询标识码
			if (TimeDifference(cct) > 0) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_mark_count_group", cct);
			}else{
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
						"sel_cct_list_mark_count", cct);
			}
		}

		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		cct.setStartid((id - 1) * pagetype);
		cct.setPagetype(pagetype);

		if (sel == 0) {
			// 查询全部
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list", cct);
			}
		} else if (sel == 1) {
			cct.setName(ser);
			// 条件查询节目名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_name_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_name", cct);
			}
		} else if (sel == 2) {
			cct.setIp(ser);
			// 条件查询素材名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_ip_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_ip", cct);
			}
		} else if (sel == 3) {
			cct.setMark(ser);
			// 条件查询素材名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_mark_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_mark", cct);
			}
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

		checkCountResult(cctList);

		return SUCCESS;
	}
	
	public static void checkCountResult(List<CountClientTime> cctList){
		for (int i = 0; i < cctList.size(); i++) {
			CountClientTime cct = cctList.get(i);
			cct.setLongtime(formatTime(cct.getBcount()));
		}
	}
	
	/* 
	 * 毫秒转化时分秒
	 */  
	public static String formatTime(Integer time) {  
	    Integer ss = 1;  
	    Integer mi = ss * 60;  
	    Integer hh = mi * 60;  
	  
	    Long ms = Long.parseLong(String.valueOf(time));
	    
	    Long hour = ms / hh;  
	    Long minute = (ms - hour * hh) / mi;  
	    Long second = (ms - hour * hh - minute * mi) / ss;  
	      
	    StringBuffer sb = new StringBuffer();  
//	    if(day > 0) {  
//	        sb.append(day+"天");  
//	    }  
	    if(hour > 0 && hour <= 9) {  
	        sb.append("0"+hour+":"); 
	    }else if(hour > 9){
	    	sb.append(hour+":");  
	    }else{
	    	sb.append("00:");  
	    }
	    if(minute > 0 && minute <= 9) {  
	        sb.append("0"+minute+":");  
	    }else if(minute > 9){
	    	sb.append(minute+":");  
	    }else{
	    	sb.append("00:");  
	    }
	    if(second > 0 && second <= 9) {  
	        sb.append("0"+second);  
	    }else if(second > 9){
	    	sb.append(second);  
	    }else{
	    	sb.append("00");
	    }
//	    if(milliSecond > 0) {  
//	        sb.append(milliSecond+"毫秒");  
//	    }  
	    return sb.toString();  
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
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY),
				cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH,
				cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		return cal.getTime();
	}

	/**
	 * 获取当年的第一天
	 * 
	 * @param year
	 * @return
	 */
	public static Date getCurrYearFirst() {
		Calendar currCal = Calendar.getInstance();
		int currentYear = currCal.get(Calendar.YEAR);
		return getYearFirst(currentYear);
	}

	/**
	 * 获取某年第一天日期
	 * 
	 * @param year
	 *            年份
	 * @return Date
	 */
	public static Date getYearFirst(int year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		Date currYearFirst = calendar.getTime();
		return currYearFirst;
	}
	
	public static int TimeDifference(CountClientTime cct) {
		String s1 = cct.getEtime();
		String s2 = cct.getBtime();
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

	public List<CountClientTime> getCctList() {
		return cctList;
	}

	public void setCctList(List<CountClientTime> cctList) {
		this.cctList = cctList;
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

	public int getTimediffer() {
		return timediffer;
	}

	public void setTimediffer(int timediffer) {
		this.timediffer = timediffer;
	}

}
