package com.vshow.control.tool;




import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.opensymphony.webwork.ServletActionContext;


public class GsonUtil 
{
	@SuppressWarnings("rawtypes")
	public static String getGson(List list)
	{

		//创建Gson对象
		Gson gson = new Gson();
		//把对象或字符串转换成Json对象
		String a = gson.toJson(list);
		//System.out.println(a);
		HttpServletResponse response  = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("application/json,charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		try 
		{
			out = ServletActionContext.getResponse().getWriter();
			out.print(a);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public static String getGson(Object object)
	{

		//创建Gson对象
		Gson gson = new Gson();
		//把对象或字符串转换成Json对象
		
		String a = gson.toJson(object);
        //System.out.println(a);
		HttpServletResponse response  = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("application/json,charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		try 
		{
			out = ServletActionContext.getResponse().getWriter();
			out.print(a);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
