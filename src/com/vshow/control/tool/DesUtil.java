package com.vshow.control.tool;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import java.security.SecureRandom;

public class DesUtil {

	
	private final static String DES = "DES";
	
	//key
	public static String keyStatic="11123331";
	/**
	 * @param args
	 * @throws Exception 
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException, Exception {
		
		// TODO Auto-generated method stub
		//String key="w!(*^!@";
		//String encStr=encryptExe("MYp0A9xp1WA=");
		//System.out.println("加密:"+encStr.trim());
		//System.out.println("字符串长度:"+encStr.length());
		//System.out.println("解密:"+decryptExe(encStr.trim()));
		//System.out.println(decrypt("MYp0A9xp1WA=","jP0yaKGupQ177eGUrOPyOmgRclF5UJokx/Lzy5S9SQTpyZZOQotMRA=="));
		//System.out.println(encrypt("10","jP0yaKGupQ177eGUrOPyOmgRclF5UJokx/Lzy5S9SQTpyZZOQotMRA=="));
		
		String encStr=encrypt("ywfisj",keyStatic);
		System.out.println("加密:"+encStr);
		System.out.println("解密:"+decrypt(encStr,keyStatic));
		
		//String data="{'code':'100000','dPassword':'212dba63ad5a085c974c08162e244c71','netCount':'0','surCount':'0'}";
		
		//String key="11123331";
		
		//String enData=encrypt(data,key);
		
		//System.out.println(enData);
		
		//String deData=decrypt("6Bqzt9v/KxfUcypNm9e5a4l4QIVlkydWzbNiIZMZKJau4Qoze44USnJHdO8SXD5tPgvhRwIOMgntITNk86vTM6m/HBb3hXaV/Hvehl9tUGk=","17453261");
		
		//System.out.println(deData);
		
	 } 
	  
	    
    /***
     * 加密exe
     * @param key  
     * @return  
     * @throws InterruptedException
     */
	public static String encryptExe(String key) throws InterruptedException{
		String cmdd ="cmd /c "+ Constant.EXE + File.separator+"e.exe "+key;
		BufferedInputStream br =null;
		BufferedOutputStream br2 =null;
		try{
			
	         Process p = Runtime.getRuntime().exec(cmdd);
	         
	         br = new BufferedInputStream(p.getInputStream());
	         
	         br2 = new BufferedOutputStream(p.getOutputStream());
	         
	         int ch;
	         
	         StringBuffer text = new StringBuffer();

	         while ((ch = br.read()) != -1) {
	             text.append((char) ch);
	         }
	        
	         br.close();
	         
	         return text.toString();
	         
	     } catch (IOException e) { 
	         e.printStackTrace(); 
	     }
	     return "";
	}

	/***
	 * 解密
	 */
	public static String decryptExe(String data){
		
		String cmdd ="cmd /c "+ Constant.EXE + File.separator+"d.exe "+data;
		BufferedInputStream br =null;
		BufferedOutputStream br2 =null;
	
		try{
			
	         Process p = Runtime.getRuntime().exec(cmdd);
	         br = new BufferedInputStream(p.getInputStream());
	         br2 = new BufferedOutputStream(p.getOutputStream());
	         int ch;
	         StringBuffer text = new StringBuffer();

	         while ((ch = br.read()) != -1) {
	             text.append((char) ch);
	         }
	        
	         br.close();
	         br2.close();
	         return text.toString();
	   
	         
	         
	     } catch (IOException e) { 
	         e.printStackTrace(); 
	     }
	     return "";
	     
		
	}
	 /**
	    *  根据键值进行加密
	    */
	    public static String encrypt(String data, String key) throws Exception {
	        byte[] bt = encrypt(data.getBytes("utf-8"), key.getBytes());
	        String strs = new BASE64Encoder().encode(bt);
	        return strs;
	    }
	    /**
	    *  根据键值进行解密
	    */
	    public static String decrypt(String data, String key) throws IOException,
	        Exception {
	    if (data == null)
	        return null;
	        BASE64Decoder decoder = new BASE64Decoder();
	        byte[] buf = decoder.decodeBuffer(data);
	        byte[] bt = decrypt(buf, key.getBytes());
	        return new String(bt,"utf-8");
	    }
	    /**
	    *  根据键值进行加密
	    */
	    private static byte[] encrypt(byte[] data, byte[] key) throws Exception {
	        Cipher cipher = cipherInit(data, key, Cipher.ENCRYPT_MODE);
	        return cipher.doFinal(data);
	    }
	    /**
	    *  根据键值进行解密
	    */
	    private static byte[] decrypt(byte[] data, byte[] key) throws Exception {
	        Cipher cipher = cipherInit(data, key, Cipher.DECRYPT_MODE);
	        return cipher.doFinal(data);
	    }
	    private static Cipher cipherInit(byte[] data, byte[] key,int cipherValue)   throws Exception {
	       
	    	/** 生成一个可信任的随机数源**/
	        SecureRandom sr = new SecureRandom();
	        /** 从原始密钥数据创建DESKeySpec对象**/
	        DESKeySpec dks = new DESKeySpec(key);
	        /** 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象**/
	        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
	        
	        SecretKey securekey = keyFactory.generateSecret(dks);
	        /** Cipher对象实际完成加密或解密操作**/
	        Cipher cipher = Cipher.getInstance(DES);
	        /**用密钥初始化Cipher对象**/
	        cipher.init(cipherValue, securekey, sr);
	        return cipher;
	    }
	
}
