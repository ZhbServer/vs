package com.vshow.control.advertising;

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
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.AdvertisingPlay;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.SucaiPlayCount;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class OutAdvertisingPlayAction implements Action {

	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1终端名,2ip,3标识mark)
	private String fname;
	private String stype = ""; // 素材类型
	private String datemode; // 时间类型
	private String btime = ""; // 开始时间
	private String etime = ""; // 结束时间
	private String zdybtime = "";
	private String zdyetime = "";
	private int timediffer = 0;

	private List<AdvertisingPlay> spcList;
	
	private AdvertisingPlay  ap;

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");
		
		String olddatemode = (String)session.get("publicDatemode");
		if(olddatemode == null){
			olddatemode = "1";
		}
		if(olddatemode.equals("0") && btime.equals("") && etime.equals("")){
			olddatemode = "1";
			session.put("publicDatemode", olddatemode);
		}
		ap = new AdvertisingPlay();
		
		if(olddatemode.equals("1")){
			btime = sdf.format(getTimesmorning());
			etime = sdf.format(new Date());
		}else if(olddatemode.equals("2")){
			btime = sdf.format(getTimesWeekmorning());
			etime = sdf.format(new Date());
		}else if(olddatemode.equals("3")){
			btime = sdf.format(getTimesMonthmorning());
			etime = sdf.format(new Date());
		}else if(olddatemode.equals("4")){
			btime = sdf.format(getCurrYearFirst());
			etime = sdf.format(new Date());
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
		
		
			spcList = SqlConnect.getSqlMapInstance().queryForList(
					"sel_adPlay_list_all", ap);
			
		}else if(sel ==1){
			//spc.setName(ser);
			// 条件查询节目名
			//if (TimeDifference(spc) > 0) {
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_out_name_group", spc);
			//}else{
			//	spc.setBtime(spc.getBtime().substring(0, 10));
			//	spc.setEtime(spc.getEtime().substring(0, 10));
			//	spcList = SqlConnect.getSqlMapInstance().queryForList(
			//			"sel_scpc_list_out_name", spc);
			//}
		}else if(sel ==2){
			//spc.setSname(ser);
			// 条件查询素材名
			
		}

		SimpleDateFormat formatfile = new SimpleDateFormat(
				"yyyy_MM_dd_HH_mm_ss");
		fname = formatfile.format(new Date()) + ".xls";
		String filename = Constant.SEE + File.separator + fname;
		File f = new File(filename);
		
		WritableWorkbook wwb = Workbook.createWorkbook(f);
		WritableSheet ws = wwb.createSheet(Constant.LOCAL.getA00114(), 0); // 日志列表
		ws.setColumnView(0, 50); // 设置列的宽度
		ws.setColumnView(1, 50); // 设置列的宽度
		ws.setColumnView(2, 20); // 设置列的宽度
		ws.setColumnView(3, 20); // 设置列的宽度
		if (TimeDifference(ap) == 0) {
			ws.setColumnView(4, 20); // 设置列的宽度
		}
		WritableFont wf = new WritableFont(WritableFont.TIMES, 12,
				WritableFont.BOLD, false);
		WritableCellFormat wcfF = new WritableCellFormat(wf);
		 //设置背景颜色;  
        wcfF.setBackground(Colour.YELLOW);  
        //wcfF.setBorder(Border.ALL, BorderLineStyle.THIN);  
		ws.addCell(new Label(0, 0, Constant.LOCAL.getA00040(), wcfF)); // 终端标识
		//ws.addCell(new Label(1, 0, Constant.LOCAL.getA00255(), wcfF)); // 节目名
		ws.addCell(new Label(1, 0, Constant.LOCAL.getB00296(), wcfF)); // 文件名
		ws.addCell(new Label(2, 0, Constant.LOCAL.getA00585(), wcfF)); // 播放次数
		ws.addCell(new Label(3, 0, Constant.LOCAL.getA00747(), wcfF)); // 点击次数
		//if (TimeDifference(ap) == 0) {
		//	ws.addCell(new Label(4, 0, Constant.LOCAL.getB00085(), wcfF)); // 日期
		//}

		for (int i = 0; i < spcList.size(); i++) {
			
			AdvertisingPlay tempAp = spcList.get(i);
			ws.addCell(new Label(0, i+1, tempAp.getMark()));
			ws.addCell(new Label(1, i+1, tempAp.getAurl()));
			ws.addCell(new Label(2, i+1, tempAp.getAcount()+""));
			ws.addCell(new Label(3, i+1, tempAp.getAtime()+""));
			//if (TimeDifference(ap) == 0) {
			//	ws.addCell(new Label(4, i+1, tempAp.getAdate()));
			//}
		}
		wwb.write();
		wwb.close();

		return SUCCESS;
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
	
	public static int TimeDifference(AdvertisingPlay spc) {
		String s1 = spc.getEtime();
		String s2 = spc.getBtime();
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

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public int getTimediffer() {
		return timediffer;
	}

	public void setTimediffer(int timediffer) {
		this.timediffer = timediffer;
	}

}
