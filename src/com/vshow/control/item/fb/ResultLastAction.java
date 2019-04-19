package com.vshow.control.item.fb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ResultLastAction implements Action {

	List<Client> clients;
	private int rlid;
	private String resultDownloadSizeState;
	private List<String> clientNumber;
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
        int uid = (Integer) session.get("urid");
        clients=SqlConnect.getSqlMapInstance().queryForList("sel_last_result",uid);
        
        clientNumber=new ArrayList<String>();
		for (int i = 0; i < clients.size(); i++) {
			int clientid=clients.get(i).getId();
			String number=(String)SqlConnect.getSqlMapInstance().queryForObject("select_clientid_number",clientid);
			clientNumber.add(number);
			/*clientNumber.*/
		}
        
        if(clients.size()>0){
        	rlid=clients.get(0).getLid();
        }
         // 判断终端在不在线
		Client cl;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < clients.size(); i++) {

			Long lo = 0L;
			cl = (Client) clients.get(i);
			int loglen = cl.getLcontent().length();
			if (loglen >= 10) {
				cl.setLcontentsub((cl.getLcontent().substring(0, 9) + "..."));
			} else {
				cl.setLcontentsub(cl.getLcontent());
			}
			int sName = cl.getName().length();
			if (sName >= 8) {
				cl.setNamesub(cl.getName().substring(0, 7) + "...");
			} else {
				cl.setNamesub(cl.getName());
			}
			/*
			try {
				if (cl.getLast() == null || "".equals(cl.getLast())) {
					lo = 0L;
				} else {
					Date dd = df.parse(cl.getLast());
					long oDate = dd.getTime();
					long nDate = new Date().getTime();
					lo = nDate - oDate;
				}
			} catch (ParseException e) {
				lo = 0L;
				e.printStackTrace();
			}
			if (lo == 0) {
				clients.get(i).setZxstate(0);
			} else if (lo < Constant.OUT) {
				clients.get(i).setZxstate(1);
			} else {
				clients.get(i).setZxstate(0);
			}
			*/

		}
        
		resultDownloadSizeState=Constant.downloadQueue.size()+"/"+Constant.downloadQueueSize;
		
		return SUCCESS;
	}
	
	public List<String> getClientNumber() {
		return clientNumber;
	}

	public void setClientNumber(List<String> clientNumber) {
		this.clientNumber = clientNumber;
	}

	public String getResultDownloadSizeState() {
		return resultDownloadSizeState;
	}
	public void setResultDownloadSizeState(String resultDownloadSizeState) {
		this.resultDownloadSizeState = resultDownloadSizeState;
	}
	public int getRlid() {
		return rlid;
	}
	public void setRlid(int rlid) {
		this.rlid = rlid;
	}
	public List<Client> getClients() {
		return clients;
	}
	public void setClients(List<Client> clients) {
		this.clients = clients;
	}

}
