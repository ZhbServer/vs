package com.vshow.control.sucai;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import com.aspose.cells.License;
import com.aspose.cells.Workbook;
import com.aspose.slides.Presentation;
import com.aspose.words.Document;

public class AsposeUtil {
	 public static boolean ExcelASPdf(String excelFile,String pdfFile) {
	        boolean result = false;
	        try {
	        	//进行破解读取
	            InputStream is = AsposeUtil.class.getClassLoader().getResourceAsStream("\\Pptlicense.xml");
	            License aposeLic = new License();
	            aposeLic.setLicense(is);
	            Workbook wb = new Workbook(excelFile);// 原始excel路径                   
	            FileOutputStream fileOS = new FileOutputStream( new File(pdfFile));// 输出pdf路径
	            wb.save(fileOS, 13); 
	            fileOS.close();
	            result = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	 public static boolean PptASPdf(String pptFile,String pdfFile) {
	        boolean result = false;
	        try {
	        	//进行破解读取
	            InputStream is = AsposeUtil.class.getClassLoader().getResourceAsStream("\\license.xml");
	            com.aspose.slides.License aposeLic = new com.aspose.slides.License();
	            aposeLic.setLicense(is);
	            Presentation ppt = new Presentation(pptFile);  // 原始ppt路径               
	            FileOutputStream fileOS = new FileOutputStream( new File(pdfFile));// 输出pdf路径
	            ppt.save(fileOS, 1); 
	            fileOS.close();
	            result = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	    
	 public static boolean WordASPdf(String wordFile,String pdfFile) 
		{
			boolean flay=false;
			try {
				FileInputStream in=new FileInputStream(new File(wordFile));//原始word路径
				FileOutputStream out = new FileOutputStream(new File(pdfFile));//生成pdf的路径       
				Document doc = new Document(in);  
				doc.save(out, 40);
				flay=true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			return flay;
		}
		/**
		 * 
		 * @param inputFile 源文件路劲
		 * @param pdfFile   生成pdf路径
		 * @param imgfile   生成图片路径
		 * @return
		 */
		public static boolean word2Img(String inputFile, String pdfFile,String imgfile) {
			try {
				boolean openPdf=WordASPdf(inputFile,pdfFile);
				if (openPdf) {
					File file = new File(inputFile);
					// 路径为文件且不为空则进行删除
					if (file.isFile() && file.exists()) {
						file.delete();
					}
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
				boolean asPdf =ExcelASPdf(inputFile, pdfFile);
				
				if (asPdf) {
					File file = new File(inputFile);
					// 路径为文件且不为空则进行删除
					if (file.isFile() && file.exists()) {
						file.delete();
					}
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
				boolean asPdf =PptASPdf(inputFile, pdfFile);
				

				if (asPdf) {
					File file = new File(inputFile);
					// 路径为文件且不为空则进行删除
					if (file.isFile() && file.exists()) {
						file.delete();
					}
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

}
