package com.vshow.control.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;

public class MD5Util {
	public static String getMd5ByFile(File file) throws FileNotFoundException {
		String value = null;
		FileInputStream in = new FileInputStream(file);
		try {
			MappedByteBuffer byteBuffer = in.getChannel().map(
					FileChannel.MapMode.READ_ONLY, 0, file.length());
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(byteBuffer);
			BigInteger bi = new BigInteger(1, md5.digest());
			value = bi.toString(16);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return value;
	}
	
	
	 /*** 
     * MD5加码 生成32位md5码 
     */ 
    public static String string2MD5(String inStr){  
        
    	MessageDigest md5 = null;  
        
    	try{ 
    		
            md5 = MessageDigest.getInstance("MD5");  
        
    	}catch (Exception e){  
            System.out.println(e.toString());  
            e.printStackTrace();  
            return "";  
        }  
        char[] charArray = inStr.toCharArray();  
        byte[] byteArray = new byte[charArray.length];  
  
        for (int i = 0; i < charArray.length; i++)  
            byteArray[i] = (byte) charArray[i];  
        byte[] md5Bytes = md5.digest(byteArray);  
        StringBuffer hexValue = new StringBuffer();  
        for (int i = 0; i < md5Bytes.length; i++){  
            int val = ((int) md5Bytes[i]) & 0xff;  
            if (val < 16)  
                hexValue.append("0");  
            hexValue.append(Integer.toHexString(val)+1);  
        }  
        return hexValue.toString();        		
    }  
  
    
    public static String string2password(String inStr){  
        MessageDigest md5 = null;  
        try{  
            md5 = MessageDigest.getInstance("MD5");  
        }catch (Exception e){
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }  
        char[] charArray = inStr.toCharArray();  
        byte[] byteArray = new byte[charArray.length];  
  
        for (int i = 0; i < charArray.length; i++)  
            byteArray[i] = (byte) charArray[i];  
            byte[] md5Bytes = md5.digest(byteArray);  
            StringBuffer hexValue = new StringBuffer();  
            for (int i = 0; i <md5Bytes.length; i++){  
            int val = ((int) md5Bytes[i]) & 0xff;  
            if (val < 16)  
                hexValue.append("0");  
                hexValue.append(Integer.toHexString(val+1));  
            }  
            return hexValue.toString();        		
    }
    /** 
     * 加密解密算法 执行一次加密，两次解密 
     */    
    public static String convertMD5(String inStr){  
  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        String s = new String(a);          
        return s; 
  
    }  
  
    // 测试
    public static void main(String args[]) {  
        String s = new String("admin");  
        System.out.println("原始：" + s);  
        //System.out.println("MD5后：" + string2MD5(s));  
        System.out.println("32位加密:" + string2password(s));
       // System.out.println("32位加密:" + string2password(s));
        //System.out.println("加密的：" + convertMD5(s));  
        //System.out.println("解密的：" + convertMD5(convertMD5(s))); 
  
    }  
}
