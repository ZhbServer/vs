package com.vshow.control.kh.queue;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup1;
import com.vshow.control.data.ClientGroup2;
import com.vshow.control.data.ClientGroup3;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToQueueBindWinAction implements Action {



	private User curruser;
	private List<ClientGroup1> cg1slist;
	private List<ClientGroup2> cg2slistall;
	private List<ClientGroup3> cg3slistall;
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
    private int pagetype=10;   //页码类型(10,20,30)
    private int type;          //类型(0默认 1一级分组 2二级分组 3 三级分组)
	private int cgid;          //分组id
    
	private String itemsids;
    
    private int fbtype=1; //发布类型  1 普通节目  2 互动节目
		
    private int jhid;    //发布计划,计划id
    private int jhtype;  //计划类型 1轮播 2插播 3有效期发布
	
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String urname = (String) session.get("urname");
		curruser = new User();
		curruser.setId(uid);
		curruser.setName(urname);
		cg1slist = (List<ClientGroup1>) SqlConnect.getSqlMapInstance().queryForList("sel_cg1_all", uid);
		for (int i = 0; i < cg1slist.size(); i++) {
			cg1slist.get(i).setCgtype(1);
		}
		int g1id = 0;
		int g2id = 0;
		cg2slistall = new ArrayList<ClientGroup2>();
		for (int i = 0; i < cg1slist.size(); i++) {
			g1id = cg1slist.get(i).getId();
			List<ClientGroup2> cg2slist = (List<ClientGroup2>)SqlConnect.getSqlMapInstance().queryForList("sel_cg2_all_g1id",g1id);
			for (int j = 0; j < cg2slist.size(); j++) {
				ClientGroup2 cg2 = new ClientGroup2();
				cg2.setId(cg2slist.get(j).getId());
				cg2.setG2name(cg2slist.get(j).getG2name());
				cg2.setG1id(cg2slist.get(j).getG1id());
				cg2.setCgtype(2);
				cg2slistall.add(cg2);
			}
		}
		cg3slistall = new ArrayList<ClientGroup3>();
		for (int i = 0; i < cg2slistall.size(); i++) {
			g2id = cg2slistall.get(i).getId();
			List<ClientGroup3> cg3slist = (List<ClientGroup3>)SqlConnect.getSqlMapInstance().queryForList("sel_cg3_all_g2id",g2id);
			for (int j = 0; j < cg3slist.size(); j++) {
				ClientGroup3 cg3 = new ClientGroup3();
				cg3.setId(cg3slist.get(j).getId());
				cg3.setG3name(cg3slist.get(j).getG3name());
				cg3.setG2id(cg3slist.get(j).getG2id());
				cg3.setCgtype(3);
				cg3slistall.add(cg3);
			}
		}
        //totalpeople = cg1slist.size()+1;
		
		//当前页码
		if (id <= 0) {
	    	id = 1;
		}
        
		//终端显示(默认用户下面所有终端)
		ClientGroupRelation cgr=new ClientGroupRelation();
		cgr.setGid(0);
		cgr.setGtype(0);
		cgr.setUid(uid);
		cgr.setStartid((id - 1) * pagetype);
		cgr.setPagetype(pagetype);
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_win_page", cgr);
		total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_win_page_count", cgr);
		
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
	
	public int getType() {
		return type;
	}



	public int getCgid() {
		return cgid;
	}


	

	public List<ClientGroup1> getCg1slist() {
		return cg1slist;
	}

	public void setCg1slist(List<ClientGroup1> cg1slist) {
		this.cg1slist = cg1slist;
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

	public User getCurruser() {
		return curruser;
	}
	public void setCurruser(User curruser) {
		this.curruser = curruser;
	}


	public int getTotalpeople() {
		return totalpeople;
	}
	public void setTotalpeople(int totalpeople) {
		this.totalpeople = totalpeople;
	}

	public List<ClientGroup2> getCg2slistall() {
		return cg2slistall;
	}

	public void setCg2slistall(List<ClientGroup2> cg2slistall) {
		this.cg2slistall = cg2slistall;
	}

	public List<ClientGroup3> getCg3slistall() {
		return cg3slistall;
	}

	public void setCg3slistall(List<ClientGroup3> cg3slistall) {
		this.cg3slistall = cg3slistall;
	}

	public String getItemsids() {
		return itemsids;
	}

	public void setItemsids(String itemsids) {
		this.itemsids = itemsids;
	}
	
	
	public int getFbtype() {
		return fbtype;
	}

	public void setFbtype(int fbtype) {
		this.fbtype = fbtype;
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
}
