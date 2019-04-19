package com.vshow.control.tool;
import java.io.Reader;
import java.util.Properties;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlConnect {
	private static SqlMapClient sqlMap;
	static {
		
		try {
			
			Reader reader = Resources.getResourceAsReader("sql.xml");
			
		    String password=PropertiesHandle.GetValueByKey(Resources.getResourceAsFile("jdbc.properties").getPath(), "password");
			
			password=DesUtil.decrypt(password,DesUtil.keyStatic);
			
			Properties properties = new Properties();
			
			properties.setProperty("password", password);
			
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader, properties);
			
			//sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println("数据库初始化失败");
		}
	}
	public static SqlMapClient getSqlMapInstance() {
		
		return sqlMap;
	
	}
}
