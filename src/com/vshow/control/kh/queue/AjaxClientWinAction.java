package com.vshow.control.kh.queue;

import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class AjaxClientWinAction extends ActionSupport {
	private int type;
	private int cgid;
	private List<Client> clients;
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1终端名,2ip,3标识mark) 
	private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
    private String orderv="id"; //排序方式
	

	@Override
	public String execute() throws Exception {
		//当前页码
		if (id <= 0) {
	    	id = 1;
		}
		
		//获取当前用户
		int urid = (Integer)  ActionContext.getContext().getSession().get("urid");
		ClientGroupRelation cgr = new ClientGroupRelation();
		
		cgr.setGid(cgid);
		cgr.setUid(urid);
		cgr.setGtype(type);
		cgr.setStartid((id - 1) * pagetype);
		cgr.setPagetype(pagetype);
		cgr.setOrderv(orderv);
		if(sel==0){
			clients = (List<Client>) SqlConnect.getSqlMapInstance().queryForList("sel_client_win_page", cgr);
			total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_win_page_count", cgr);
		}else{
			if(sel==1){
				cgr.setSname("name");
			}else if(sel==2){
				cgr.setSname("ip");
			}else if(sel==3){
				cgr.setSname("mark");
			}
			//转码
			ser = java.net.URLDecoder.decode(ser, "UTF-8"); 
			cgr.setSer(ser.trim());
			clients = (List<Client>) SqlConnect.getSqlMapInstance().queryForList("sel_client_ser_win_page", cgr);
			total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_ser_win_page_count", cgr);
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
		
		Constant.checkClientZx(clients);
		
		return SUCCESS;
	}
	
	public List<Client> getClients() {
		return clients;
	}

	public void setClients(List<Client> clients) {
		this.clients = clients;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Pages getPs() {
		return ps;
	}

	public void setPs(Pages ps) {
		this.ps = ps;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getCgid() {
		return cgid;
	}

	public void setCgid(int cgid) {
		this.cgid = cgid;
	}
	
	
	public String getOrderv() {
		return orderv;
	}

	public void setOrderv(String orderv) {
		this.orderv = orderv;
	}

	

}
