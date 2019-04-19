package com.vshow.control.api.test.treasure;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;


public class TreasureClientListAction extends ActionSupport{
	
private int	tids;
private User curruser;
private List<Client> clients;
private int totalpeople;
private int id; // 当前页数
private int total; // 数据总个数
private int totalpage; // 总页数
private int qian; // 上一页
private int hou; // 下一页
private String ser; // 查询条件
private int sel=0; // 查询编号     (0全部,1文件名,用户名) 
private Pages ps;     //分页
private Integer pagetype=10;   //页码类型(10,20,30)
private int type;          //类型(0默认 1一级分组 2二级分组 3 三级分组)
private int cgid;          //分组id
private int fbtype=2; //发布类型  1 普通节目  2 互动节目
private int jhid;    //发布计划,计划id
private int jhtype;  //计划类型 1轮播 2插播 3有效期发布


public String execute() throws Exception {
	ActionContext ctx = ActionContext.getContext();
	Map session = ctx.getSession();
	int uid = (Integer) session.get("urid");
	curruser = new User();
	curruser.setId(uid);
	
	//分页类型存入session
	if(pagetype==null){
		
		//查看session是否有分页类型 null择默认10条显示
		Integer publicPagetype=(Integer)session.get("publicPagetype");
		if(publicPagetype==null){
			session.put("publicPagetype", 10);
			pagetype=10;
		}else{
			pagetype=publicPagetype;
		}
	}else{
		session.put("publicPagetype", pagetype);
	}
	
//	totalpeople = cg1slist.size()+1;
	
	//当前页码
	if (id <= 0) {
    	id = 1;
	}
	
	
			
    
	//终端显示(默认用户下面所有终端)
	ClientGroupRelation cgr=new ClientGroupRelation();
	cgr.setGid(0);
	cgr.setGtype(0);
	cgr.setUid(uid);
	
	//搜索查询
	if (sel == 0) {//查询全部
		total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_all_page_count", cgr);		
	} else if (sel == 1) {//终端名
		String name=ser;	
		total = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_name_page_count", name);
	}else if (sel == 2) {//终端ip
		String ip=ser;									
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_client_ip_page_count", ip);
	}else if (sel == 3) {//标识码
		String mark=ser;						
		total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_client_mark_page_count", mark);
	}
	
	
	
	//获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
	if(pagetype==-1){
		pagetype=total;
	}
	cgr.setStartid((id - 1) * pagetype);
	cgr.setPagetype(pagetype);
	
	//搜索查询
	if (sel == 0) {//查询全部
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_all_page", cgr);
	} else if (sel == 1) {//终端名
		cgr.setSname(ser);			
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_name_page", cgr);
	}else if (sel == 2) {//终端ip		
		cgr.setIp(ser);
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_ip_page", cgr);
	}else if (sel == 3) {//标识码		
		cgr.setMark(ser);
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_mark_page", cgr);
	}
	
	
	
	if(pagetype==0){
	}else{
		if (total % pagetype > 0) { 
			totalpage = total / pagetype + 1;
		} else {
			totalpage = total / pagetype;
		}
		
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

public int getType() {
	return type;
}



public int getCgid() {
	return cgid;
}

public User getCurruser() {
	return curruser;
}

public void setCurruser(User curruser) {
	this.curruser = curruser;
}

public List<Client> getClients() {
	return clients;
}

public void setClients(List<Client> clients) {
	this.clients = clients;
}

public int getTotalpeople() {
	return totalpeople;
}

public void setTotalpeople(int totalpeople) {
	this.totalpeople = totalpeople;
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

public Integer getPagetype() {
	return pagetype;
}

public void setPagetype(Integer pagetype) {
	this.pagetype = pagetype;
}

public int getJhid() {
	return jhid;
}

public void setJhid(int jhid) {
	this.jhid = jhid;
}

public int getJhtype() {
	return jhtype;
}

public void setJhtype(int jhtype) {
	this.jhtype = jhtype;
}

public void setType(int type) {
	this.type = type;
}

public void setCgid(int cgid) {
	this.cgid = cgid;
}

public int getTids() {
	return tids;
}

public void setTids(int tids) {
	this.tids = tids;
}

public int getFbtype() {
	return fbtype;
}

public void setFbtype(int fbtype) {
	this.fbtype = fbtype;
}



}
