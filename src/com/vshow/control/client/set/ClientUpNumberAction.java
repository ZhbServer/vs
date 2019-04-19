package com.vshow.control.client.set;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ClientNumber;
import com.vshow.control.data.Log;
import com.vshow.control.data.Pages;
import com.vshow.control.data.Result;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VVersion;


public class ClientUpNumberAction implements Action {
	
	private Integer id;
	private String number;
	private int cid;
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ClientNumber clientNumber=new ClientNumber();
		clientNumber.setNumber(number);
		clientNumber.setClientid(cid);
		//如果id为null 那么表示此终端无终端编号
		if(id==null)
		{
			//进行新增	
			sm.insert("insert_client_number", clientNumber);
		}else
		{
			clientNumber.setId(id);
			sm.update("update_client_number", clientNumber);
		}
		
		
		return SUCCESS;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}



	

}
