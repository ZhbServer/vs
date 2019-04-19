package com.vshow.control.user;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.tool.SqlConnect;

public class ToImportUserAction extends ActionSupport {
	private File file;
	private String fileFileName;


	public File getFile() {
		return file;
	}


	public void setFile(File file) {
		this.file = file;
	}


	public String getFileFileName() {
		return fileFileName;
	}


	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}


	@Override
	public String execute() throws Exception{
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		
	try {
		// 获取当前登录的用户
		User user = (User) sm.queryForObject("sel_user_all_id", ActionContext.getContext().getSession().get("urid"));
		//获取工作簿
		FileInputStream fs=FileUtils.openInputStream(file);
		HSSFWorkbook workbook=new HSSFWorkbook(fs);
	    //获取第一个工作表
		HSSFSheet hs=workbook.getSheetAt(0);
		//获取Sheet的第一个行号和最后一个行号
	    int last=hs.getLastRowNum();
	    int first=hs.getFirstRowNum()+1;
	    //遍历获取单元格里的信息
	   for (int i = first; i <last; i++) {
		   HSSFRow row=hs.getRow(i);
		   HSSFCell cell=row.getCell(i);
		   String account=row.getCell(0).getStringCellValue();
		   List<User> us=sm.queryForList("sel_user_all_account",account);//查看用户是否已经存在
		   if(us.size()==0)
		   {
			   User uu=new User();
			   uu.setAccount(account);
			   uu.setPassword(row.getCell(1).getStringCellValue());
			   uu.setName(row.getCell(2).getStringCellValue());
			   uu.setPowerid(Integer.parseInt(row.getCell(3).getStringCellValue()));
			   uu.setBan(0);
			   uu.setOcheck(1);
			   uu.setJhocheck(1);
			   uu.setFatherid(user.getId());
			   sm.insert("adduserimprot",uu);
			   uu.setTkey(user.getTkey()+ uu.getId() + "_");
			   sm.update("up_user_tkey", uu);
			  
		   }
	}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return SUCCESS;
	}
}
