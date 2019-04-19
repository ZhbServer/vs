package com.vshow.control.user;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToExportUserAction extends ActionSupport {

	private String fname;

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Override
	public String execute() throws Exception {

		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		// 获取当前登录的用户
		User user = (User) sm.queryForObject("sel_user_all_id",
				session.get("urid"));
		// 获取数据
		List<User> userList = (List<User>) sm.queryForList("sel_user_import",
	user);
		SimpleDateFormat formatfile = new SimpleDateFormat(
				"yyyy_MM_dd_HH_mm_ss");
		fname = formatfile.format(new Date()) + ".xls";
		String filename = Constant.SEE + File.separator + fname;
		File f = new File(filename);
		WritableWorkbook wwb = Workbook.createWorkbook(f);
		WritableSheet ws = wwb.createSheet(Constant.LOCAL.getB00120(), 0); // 用户列表
		ws.setColumnView(0, 30); // 设置列的宽度
		ws.setColumnView(1, 15); // 设置列的宽度
		ws.setColumnView(2, 15); // 设置列的宽度
		ws.setColumnView(3, 7); // 设置列的宽度
		ws.setColumnView(4, 15); // 设置列的宽度
		ws.setColumnView(5, 15); // 设置列的宽度
		ws.setColumnView(6, 20); // 设置列的宽度
		//设置单元格样式
		WritableFont wf = new WritableFont(WritableFont.TIMES, 12,
				WritableFont.BOLD, false);
		WritableFont zw = new WritableFont(WritableFont.TIMES,8,
				WritableFont.BOLD, false);
		WritableCellFormat wcfF = new WritableCellFormat(wf);
		WritableCellFormat zwF = new WritableCellFormat(zw);
		zwF.setVerticalAlignment(VerticalAlignment.CENTRE);
		ws.addCell(new Label(0, 0, Constant.LOCAL.getA00689(), wcfF)); // 用户名
		ws.addCell(new Label(1, 0, Constant.LOCAL.getA00047(), wcfF)); // 密码
		ws.addCell(new Label(2, 0, Constant.LOCAL.getA00212(), wcfF)); // 昵称
		ws.addCell(new Label(3, 0, Constant.LOCAL.getD00003(), wcfF)); // 权限ID
		ws.addCell(new Label(4, 0, Constant.LOCAL.getA00169(), wcfF)); // 权限组名
		ws.addCell(new Label(5, 0, Constant.LOCAL.getA00239(), wcfF)); // 终端组名
		ws.addCell(new Label(6, 0, Constant.LOCAL.getD00004(), wcfF)); // 终端标识

		int j = 0;
		int l = 1;
		int y = 1;
		for (int i = 0; i < userList.size(); i++) {
			User uss = userList.get(i);
			uss.setCl((List<Client>) sm.queryForList("sel_client_user_all",
					uss.getId()));
			if (uss.getCl().size() != 0) {
				for (j = 0; j < uss.getCl().size(); j++) {

					ws.addCell(new Label(0, y, uss.getAccount(),zwF));
					ws.addCell(new Label(1, y, uss.getPassword(),zwF));
					ws.addCell(new Label(2, y, uss.getName(),zwF));
					ws.addCell(new Label(3, y, String.valueOf(uss.getPowerid()),zwF));
					ws.addCell(new Label(4, y, uss.getPowername(),zwF));
					ws.addCell(new Label(5, y, uss.getCl().get(j).getName(),zwF));
					ws.addCell(new Label(6, y, uss.getCl().get(j).getMark(),zwF));
					y = ++y;
				}
				//合并单元格
				ws.mergeCells(0, l, 0, uss.getCl().size() + l - 1);
				ws.mergeCells(1, l, 1, uss.getCl().size() + l - 1);
				ws.mergeCells(2, l, 2, uss.getCl().size() + l - 1);
				ws.mergeCells(3, l, 3, uss.getCl().size() + l - 1);
				ws.mergeCells(4, l, 4, uss.getCl().size() + l - 1);
				l = l + uss.getCl().size();
			} else {
				ws.addCell(new Label(0, y, uss.getAccount(),zwF));
				ws.addCell(new Label(1, y, uss.getPassword(),zwF));
				ws.addCell(new Label(2, y, uss.getName(),zwF));
				ws.addCell(new Label(3, y, String.valueOf(uss.getPowerid()),zwF));
				ws.addCell(new Label(4, y, uss.getPowername(),zwF));
				l = l + 1;
				y = ++y;
			}
		}
		wwb.write();
		wwb.close();

		return SUCCESS;
	}
}
