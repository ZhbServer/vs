package com.vshow.control.index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.Item;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToOffClientAction extends ActionSupport {
	private List clients;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
    private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
    
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1终端名,2ip,3标识mark) 
	private String orderv="id"; //排序方式
	private List<String> clientNumber;
	public String execute() throws Exception {
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int urid = (Integer) session.get("urid");
		// 判断当前页数
		if (id <= 0) {
			id = 1;
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		User u=new User();
		u.setId(urid);
		u.setStartid((id - 1) * pagetype);
		u.setPagetype(pagetype);
		u.setDqdate(sf.format(new Date()));
        u.setOuttime(Constant.OUT/1000);
        u.setOrderv(orderv);
        u.setZxstate(0);
        if(sel==0){
        	clients=SqlConnect.getSqlMapInstance().queryForList(
    				"sel_onclient_zxstate", u);
    		Constant.subStringClientList(clients);
    		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
    				"sel_onclient_zxstate_count",u);
    			
        }else{
        	
        	if(sel==1){
				u.setSname("t_client.name");
			}else if(sel==2){
				u.setSname("t_client.ip");
			}else if(sel==3){
				u.setSname("t_client.mark");
			}
			//转码
			//ser = java.net.URLDecoder.decode(ser, "UTF-8"); 
			u.setSer(ser.trim());
			clients=SqlConnect.getSqlMapInstance().queryForList(
    				"sel_onclient_ser_zxstate", u);
    		Constant.subStringClientList(clients);
    		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject(
    				"sel_onclient_ser_zxstate_count",u);
    		
        }
        Client client;
        clientNumber=new ArrayList<String>();
		for (int i = 0; i < clients.size(); i++) {
		    client =(Client)clients.get(i);
			int clientid=client.getId();
			String number=(String)SqlConnect.getSqlMapInstance().queryForObject("select_clientid_number",clientid);
			clientNumber.add(number);
			/*clientNumber.*/
		}
        if(pagetype==0){
		}else{
			if (total % pagetype > 0) { 
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}
		}
		if (totalpage == 0) {
			totalpage = 1;
		}
		qian = id - 1;
		hou = id + 1;
		if (hou >= totalpage) {
			hou = totalpage;
		}
		ps = Constant.getPages(totalpage, id);
		
		return SUCCESS;
	}

	

	public int getId() {
		return id;
	}

	
	public List<String> getClientNumber() {
		return clientNumber;
	}



	public void setClientNumber(List<String> clientNumber) {
		this.clientNumber = clientNumber;
	}



	public void setId(int id) {
		this.id = id;
	}

	public List getClients() {
		return clients;
	}



	public void setClients(List clients) {
		this.clients = clients;
	}



	public int getPagetype() {
		return pagetype;
	}



	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}



	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getQian() {
		return qian;
	}

	public void setQian(int qian) {
		this.qian = qian;
	}

	public int getHou() {
		return hou;
	}

	public void setHou(int hou) {
		this.hou = hou;
	}

	public Pages getPs() {
		return ps;
	}

	public void setPs(Pages ps) {
		this.ps = ps;
	}
	
	 public String getSer() {
			return ser;
		}



		public void setSer(String ser) {
			this.ser = ser;
		}



		public int getSel() {
			return sel;
		}



		public void setSel(int sel) {
			this.sel = sel;
		}



		public String getOrderv() {
			return orderv;
		}



		public void setOrderv(String orderv) {
			this.orderv = orderv;
		}
}