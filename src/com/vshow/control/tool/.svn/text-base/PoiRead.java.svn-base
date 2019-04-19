package com.vshow.control.tool;

import java.io.File;
import java.io.FileInputStream;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class PoiRead {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//需要解析的Excel文件
		File file=new  File("f:/2019_01_17_18_19_13.xls");
		try {
			//获取工作簿
			FileInputStream fs=FileUtils.openInputStream(file);
			HSSFWorkbook workbook=new HSSFWorkbook(fs);
		    //获取第一个工作表
			HSSFSheet hs=workbook.getSheetAt(0);
			//获取Sheet的第一个行号和最后一个行号
		   int last=hs.getLastRowNum();
		   int first=hs.getFirstRowNum();
		   //遍历获取单元格里的信息
		   for (int i = first; i <last; i++) {
			HSSFRow row=hs.getRow(i);
			int firstCellNum=row.getFirstCellNum();//获取所在行的第一个行号
			int lastCellNum=row.getLastCellNum();//获取所在行的最后一个行号
			for (int j = firstCellNum; j <lastCellNum; j++) {
				HSSFCell cell=row.getCell(j);
				String value=cell.getStringCellValue();
				System.out.print(value+" ");
			}
			System.out.println();
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

}
