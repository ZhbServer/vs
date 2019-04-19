package com.vshow.control.log;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
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
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class OutLogAction implements Action {

	private String fname;
	private String idstr;
	

	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		List<Log> list = null;
		//String tkey = (String) session.get("urtkey");
		list = SqlConnect.getSqlMapInstance().queryForList("sel_all_logs_sel",idstr);
	    SimpleDateFormat formatfile = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		fname = formatfile.format(new Date()) + ".xls";
		String filename = Constant.SEE + File.separator + fname;
		File f = new File(filename);
		WritableWorkbook wwb = Workbook.createWorkbook(f);
		WritableSheet ws = wwb.createSheet(Constant.LOCAL.getA00114(), 0);   //日志列表
		ws.setColumnView(0, 50); // 设置列的宽度 
		ws.setColumnView(1, 50); // 设置列的宽度
		ws.setColumnView(2, 50); // 设置列的宽度
		ws.setColumnView(3, 50); // 设置列的宽度
		WritableFont wf = new WritableFont(WritableFont.TIMES, 12,WritableFont.BOLD, false);
		WritableCellFormat wcfF = new WritableCellFormat(wf);
		ws.addCell(new Label(0, 0, Constant.LOCAL.getA00116(), wcfF));  //日志内容
		ws.addCell(new Label(1, 0, Constant.LOCAL.getA00127(), wcfF));  //生成时间
		ws.addCell(new Label(2, 0, Constant.LOCAL.getA00124(), wcfF)); //操作用户
		ws.addCell(new Label(3, 0, Constant.LOCAL.getA00118(), wcfF));  //操作结果
		
		
		
		
		
		for (int i = 0; i < list.size(); i++) {
			Log log = list.get(i);
			
			ws.addCell(new Label(0, i+1, log.getContent()));
			ws.addCell(new Label(1, i+1, log.getSdate()));
			ws.addCell(new Label(2, i+1, log.getUname()));
			
			if(log.getState()==1){
				ws.addCell(new Label(3, i+1, Constant.LOCAL.getA00128()));
			}else{
				ws.addCell(new Label(3, i+1, Constant.LOCAL.getA00805()));
			}
			/*List ls=SqlConnect.getSqlMapInstance().queryForList("sel_out_return", log.getId());
			if(ls.size()==0){
				ws.addCell(new Label(3, i, Constant.LOCAL.getA00128()));
			}else{
				
				String xiaojie="";
				String jieguo="";
				for (int j = 0; j < ls.size(); j++) {
					Result result=(Result)ls.get(j);
					if (result.getState() == 0) {
						xiaojie = Constant.LOCAL.getA00129();
					} else if (result.getState() == 1) {
						xiaojie = Constant.LOCAL.getA00130();
					} else if (result.getState() == 2) {
						xiaojie =Constant.LOCAL.getA00125();
					}
					jieguo += " "+Constant.LOCAL.getA00038()+":" + result.getName() + "," + " "+Constant.LOCAL.getA00118()+":"
					+ xiaojie;
				}
				ws.addCell(new Label(3, i, jieguo));
			}*/
			
			
		}
		wwb.write();
		wwb.close();

		return SUCCESS;
	}
	
	public String getIdstr() {
		return idstr;
	}

	public void setIdstr(String idstr) {
		this.idstr = idstr;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}
