package com.vshow.control.sucai;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class PDFUtil {

	private static final int wdFormatPDF = 17;  
    private static final int xlTypePDF = 0;  
    private static final int ppSaveAsPDF = 32;  
  
    public static void main(String[] args) throws Exception {  
//    	PDFUtil.Pdf2Jpg("D:\\pdfchageimg.pdf" ,"D:/123.jpg");
//    	PDFUtil.Pdf2img("D:\\pdfchageimg.pdf" ,"D:\\123.jpg");
    	//System.out.println(System.getProperty("java.library.path"));
        //PDFUtil.word2Img("D:\\11.docx", "D:/11.pdf","123456");
    	PDFUtil.pptToImg("D:\\足球.pptx","D:\\333.png","D:\\333");
        System.out.println("转换完成！");  
    }  
 
    public static String getFileSufix(String fileName) {  
        int splitIndex = fileName.lastIndexOf(".");  
        return fileName.substring(splitIndex + 1);  
    }  
    // word转换为pdf  
    public static boolean word2Img(String inputFile, String pdfFile,String imgfile) {  
        try {  
            // 打开word应用程序  
            ActiveXComponent app = new ActiveXComponent("Word.Application");  
            // 设置word不可见  
            app.setProperty("Visible", false);  
            // 获得word中所有打开的文档,返回Documents对象  
            Dispatch docs = app.getProperty("Documents").toDispatch();  
            // 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document  
            Dispatch doc = Dispatch.call(docs, "Open", inputFile, false, true)  
                    .toDispatch();  
            // 调用Document对象的SaveAs方法，将文档保存为pdf格式  
            /* 
             * Dispatch.call(doc, "SaveAs", pdfFile, wdFormatPDF 
             * //word保存为pdf格式宏，值为17 ); 
             */  
            Dispatch.call(doc, "ExportAsFixedFormat", pdfFile, wdFormatPDF);// word保存为pdf格式宏，值为17  
            
            boolean flag = Pdf2img(pdfFile,imgfile);
            
            if(flag){
            	File file = new File(pdfFile);  
                // 路径为文件且不为空则进行删除  
                if (file.isFile() && file.exists()) {  
                   
                    file.deleteOnExit();
                }
            }
            
            // 关闭文档  
            Dispatch.call(doc, "Close", false);  
            // 关闭word应用程序  
            app.invoke("Quit", 0);  
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  
    // excel转换为pdf  
    public static boolean excel2PDF(String inputFile, String pdfFile) {  
        try {  
            ActiveXComponent app = new ActiveXComponent("Excel.Application");  
            app.setProperty("Visible", false);  
            Dispatch excels = app.getProperty("Workbooks").toDispatch();  
            Dispatch excel = Dispatch.call(excels, "Open", inputFile, false,  
                    true).toDispatch();  
            Dispatch.call(excel, "ExportAsFixedFormat", xlTypePDF, pdfFile);  
            Dispatch.call(excel, "Close", false);  
            app.invoke("Quit");  
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  
    // ppt转换为pdf  
    public static boolean ppt2PDF(String inputFile, String pdfFile) {  
        try {  
            ActiveXComponent app = new ActiveXComponent(  
                    "PowerPoint.Application");  
            // app.setProperty("Visible", msofalse);  
            Dispatch ppts = app.getProperty("Presentations").toDispatch();  
  
            Dispatch ppt = Dispatch.call(ppts, "Open", inputFile, true,// ReadOnly  
                    true,// Untitled指定文件是否有标题  
                    false// WithWindow指定文件是否可见  
                    ).toDispatch();  
  
            Dispatch.call(ppt, "SaveAs", pdfFile, ppSaveAsPDF);  
  
            Dispatch.call(ppt, "Close");  
  
            app.invoke("Quit");  
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }  
    
    
    public static boolean Pdf2img (String pdfFile,String imgfile){
    boolean flag = false;
    File file = new File(pdfFile);
    try {
	 	 PDDocument doc = PDDocument.load(file);
	 	 PDFRenderer renderer = new PDFRenderer(doc);
	 	 int pageCount = doc.getNumberOfPages();
	 	 imgfile="D:\\"+imgfile;
	 	 File file2=new File(imgfile);
	 	 file2.mkdirs();
	 	 for(int i=0;i<pageCount;i++){
	 	 	BufferedImage image = renderer.renderImageWithDPI(i, 296);
	 	 	ImageIO.write(image, "png", new File(file2.getPath()+"\\"+(i+1)+".png"));
	  	 }
	 	 
	 	 doc.close();
	 	 flag = true;
    } catch (IOException e) {
    	e.printStackTrace();
    }
    return flag;
  }
    
    
    public static boolean pptToImg(String inputFile, String imgFile,String imgFiles) throws Exception {  
        // 打开word应用程序  
        ActiveXComponent app = new ActiveXComponent("PowerPoint.Application");  
        // 设置word不可见，office可能有限制  
        // app.setProperty("Visible", false);  
        // 获取word中国所打开的文档，返回Documents对象  
        Dispatch files = app.getProperty("Presentations").toDispatch();  
        // 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document  
        Dispatch file = Dispatch.call(files, "open", inputFile, true, true, false).toDispatch();  
        // 调用Document对象的SaveAs方法，将文档保存为pdf格式  
        // Dispatch.call(doc, "ExportAsFixedFormat", outputFile,  
        // PPT_TO_PDF);  
        Dispatch.call(file, "SaveAs", imgFile, 17);  
        // 关闭文档  
        // Dispatch.call(file, "Close", false);  
        Dispatch.call(file, "Close");  
        // 关闭word应用程序  
        // app.invoke("Quit", 0);  
        app.invoke("Quit"); 
        
        File file3=new File(imgFiles);
        renameFile(file3);
        
        return true;  
    } 
    
    
    final static void renameFile(File dir) throws Exception {  
        File[] fs = dir.listFiles();  
        for (int i = 0; i < fs.length; i++) {  
            //打印全路径名称  
            System.out.println(fs[i].getAbsolutePath());   
              
            //判断文件是否存在  
            if(!fs[i].exists())  
              {  
                fs[i].createNewFile();  
              }  
              System.out.println("修改前文件名称是："+fs[i].getName());  
              String rootPath = fs[i].getParent();  
              System.out.println("根路径是："+rootPath);  
              File newFile = new File(rootPath + File.separator +(i+1)+ ".png");  
              System.out.println("修改后文件名称是："+newFile.getName());  
              if (fs[i].renameTo(newFile))   
              {  
               System.out.println("修改成功!");  
              }   
              else   
              {  
               System.out.println("修改失败");  
              }  
              
        }  
          
            
    }  
          

}
