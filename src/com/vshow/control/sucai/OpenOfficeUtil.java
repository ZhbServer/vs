package com.vshow.control.sucai;

import java.io.File;
import java.io.IOException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

public class OpenOfficeUtil {
	private static final int wdFormatPDF = 17;
	private static final int xlTypePDF = 0;
	private static final int ppSaveAsPDF = 32;

	/**
	 * 
	 * @param inputFile 源文件路劲
	 * @param pdfFile   生成pdf路径
	 * @param imgfile   生成图片路径
	 * @return
	 */
	public static boolean word2Img(String inputFile, String pdfFile,String imgfile) {
		try {
			boolean openPdf=word2Pdf(inputFile,pdfFile);
			if (openPdf) {
				File file = new File(inputFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}else
			{
					word2Pdf(inputFile,pdfFile);
			}
		
			boolean flag = OfficeUtil.pdf2Img(pdfFile, imgfile);

			if (flag) {
				File file = new File(pdfFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * @param inputFile 源文件路劲
	 * @param pdfFile   生成pdf路径
	 * @param imgfile   生成图片路径
	 * @return
	 */
	public static boolean excel2Img(String inputFile, String pdfFile,String imgfile) {
		try {
			boolean asPdf =word2Pdf(inputFile, pdfFile);
			
			if (asPdf) {
				File file = new File(inputFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}else
			{
				word2Pdf(inputFile,pdfFile);
			}
	

			
			boolean flag = OfficeUtil.pdf2Img(pdfFile, imgfile);

			if (flag) {
				File file = new File(pdfFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param inputFile 源文件路劲
	 * @param pdfFile   生成pdf路径
	 * @param imgfile   生成图片路径
	 * @throws Exception 
	 */
	public static boolean ppt2Img(String inputFile, String pdfFile,String imgfile) throws Exception {

		try {
			boolean asPdf =word2Pdf(inputFile, pdfFile);
			

			if (asPdf) {
				File file = new File(inputFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}else
			{
				word2Pdf(inputFile,pdfFile);
			}
			

			
			boolean flag = OfficeUtil.pdf2Img(pdfFile, imgfile);

			if (flag) {
				File file = new File(pdfFile);
				// 路径为文件且不为空则进行删除
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}
			
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return false;
		}  
	}

	/**
	 * 
	 * @param word路径
	 * @param pdf路径
	 * @return
	 * @throws IOException 
	 */
	public static boolean word2Pdf(String wordFile,String pdfFile) throws IOException
	{
		boolean flag = false;
     
			// 源文件目录
			File inputFile = new File(wordFile);
			if (!inputFile.exists()) {
			    System.out.println("源文件不存在！");
			    flag=false;
			    return flag;
			}
			
			// 输出文件目录
			File outputFile = new File(pdfFile);
			if (!outputFile.getParentFile().exists()) {
			    outputFile.getParentFile().exists();
			}
			
			// 调用openoffice服务线程
			/** 我把openOffice下载到了 C:/Program Files (x86)/下  ,下面的写法自己修改编辑就可以**/
			String command = "C:/Program Files (x86)/OpenOffice 4/program/soffice.exe -headless -accept=\"socket,host=127.0.0.1,port=8333;urp;\"";
			Process p = Runtime.getRuntime().exec(command);
 
			// 连接openoffice服务
			OpenOfficeConnection connection = new SocketOpenOfficeConnection("127.0.0.1", 8333);
			connection.connect();
 
			// 转换
			DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
			converter.convert(inputFile, outputFile);
 
			// 关闭连接
			connection.disconnect();
 
			// 关闭进程
			p.destroy();
			flag=true;
		
		return flag;
	}

	

}
