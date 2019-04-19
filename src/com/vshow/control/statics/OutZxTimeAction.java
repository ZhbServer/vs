package com.vshow.control.statics;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class OutZxTimeAction implements Action {

	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1终端名,2ip,3标识mark)
	private String fname;
	private String datemode = ""; // 时间类型
	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String zdybtime = ""; 
	private String zdyetime = "";
	private int timediffer = 0;

	private List<CountClientTime> cctList;
	private CountClientTime cct;

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int uid = (Integer) session.get("urid");

		cct = new CountClientTime();
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
		
		if (sel == 0) {
			// 查询全部
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out", cct);
			}
		} else if (sel == 1) {
			cct.setName(ser);
			// 条件查询节目名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_name_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_name", cct);
			}
		} else if (sel == 2) {
			cct.setIp(ser);
			// 条件查询素材名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_ip_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_ip", cct);
			}
		} else if (sel == 3) {
			cct.setMark(ser);
			// 条件查询素材名
			if (TimeDifference(cct) > 0) {
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_mark_group", cct);
			}else{
				cctList = SqlConnect.getSqlMapInstance().queryForList(
						"sel_cct_list_out_mark", cct);
			}
		}

		checkCountResult(cctList);
		
		SimpleDateFormat formatfile = new SimpleDateFormat(
				"yyyy_MM_dd_HH_mm_ss");
		fname = formatfile.format(new Date()) + ".xls";
		String filename = Constant.SEE + File.separator + fname;
		File f = new File(filename);
		WritableWorkbook wwb = Workbook.createWorkbook(f);
		WritableSheet ws = wwb.createSheet(Constant.LOCAL.getA00114(), 0); // 日志列表
		ws.setColumnView(0, 50); // 设置列的宽度
		ws.setColumnView(1, 50); // 设置列的宽度
		ws.setColumnView(2, 50); // 设置列的宽度
		ws.setColumnView(3, 50); // 设置列的宽度
		if (TimeDifference(cct) == 0) {
			ws.setColumnView(4, 50); // 设置列的宽度
		}
		WritableFont wf = new WritableFont(WritableFont.TIMES, 12,
				WritableFont.BOLD, false);
		WritableCellFormat wcfF = new WritableCellFormat(wf);
		ws.addCell(new Label(0, 0, Constant.LOCAL.getA00038(), wcfF)); // 终端名称
		ws.addCell(new Label(1, 0, Constant.LOCAL.getA00040(), wcfF)); // 标识码
		ws.addCell(new Label(2, 0, Constant.LOCAL.getA00041(), wcfF)); // ip地址
		ws.addCell(new Label(3, 0, Constant.LOCAL.getA00856(), wcfF)); // 在线时长
		if (TimeDifference(cct) == 0) {
			ws.addCell(new Label(4, 0, Constant.LOCAL.getB00085(), wcfF)); // 日期
		}

		for (int i = 0; i < cctList.size(); i++) {
			CountClientTime client = cctList.get(i);

			ws.addCell(new Label(0, i+1, client.getName()));
			ws.addCell(new Label(1, i+1, client.getMark()));
			ws.addCell(new Label(2, i+1, client.getIp()));
			ws.addCell(new Label(3, i+1, client.getLongtime()));
			if (TimeDifference(cct) == 0) {
				ws.addCell(new Label(4, i+1, client.getDate()));
			}
		}
		wwb.write();
		wwb.close();

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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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

	public String getDatemode() {
		return datemode;
	}

	public void setDatemode(String datemode) {
		this.datemode = datemode;
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

	public List<CountClientTime> getCctList() {
		return cctList;
	}

	public void setCctList(List<CountClientTime> cctList) {
		this.cctList = cctList;
	}

	public CountClientTime getCct() {
		return cct;
	}

	public void setCct(CountClientTime cct) {
		this.cct = cct;
	}
	
}
