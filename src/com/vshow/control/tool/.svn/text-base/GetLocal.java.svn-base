package com.vshow.control.tool;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.util.ResourceBundle;



public class GetLocal {

	
	ResourceBundle bundel ;

	public Local getLocal(String localdie) {
		       bundel = ResourceBundle.getBundle(localdie+ File.separator + "local");
		
		Local local = new Local();
		Class c = local.getClass();
		
		Field[] fields = c.getDeclaredFields();
		Field.setAccessible(fields, true);
		
		try {
			for (Field field : fields) {
				
				field = local.getClass().getDeclaredField(field.getName());
				
				field.setAccessible(true);
				
				field.set(local, getFormat(field.getName()));
			
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}
		return local;
	}

	public String getFormat(String bname) {
		
		String objstr = "";
		
		try {
			
			objstr = new String(bundel.getString(bname).getBytes("ISO8859-1"),
					"UTF-8");
			
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			
		}
		
		return objstr;
	}
}
