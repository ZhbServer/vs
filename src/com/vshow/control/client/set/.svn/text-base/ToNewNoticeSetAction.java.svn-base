package com.vshow.control.client.set;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.ClientGroupTree;
import com.vshow.control.data.Pages;
import com.vshow.control.data.User;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToNewNoticeSetAction implements Action {
	

	private User curruser;
	private List<ClientGroupTree> cgslist;
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
    private String nid;   
    private String ztree;
    private int tbId;
    private int proId;

	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		String urname = (String) session.get("urname");
		curruser = new User();
		curruser.setId(uid);
		
		cgslist = new ArrayList<ClientGroupTree>();
		ClientGroupTree cgt=new ClientGroupTree();
		cgt.setId("0");
		cgt.setPid("0");
		cgt.setName(Constant.LOCAL.getA00815());
		cgt.setTarget("");
		cgt.setUrl("");
		cgt.setClick("showcg1list(0,'ajaxclientitem.vs',0)");
		ClientGroup cg = new ClientGroup();
		cg.setUid(uid);
		cg.setPid(Integer.parseInt(cgt.getPid()));
		List<ClientGroup> sonlist = (List<ClientGroup>) SqlConnect.getSqlMapInstance().queryForList("sel_cg_all_level_pid",cg);
		if(sonlist.size()>0){
			cgt.setIsParent("true");
		}else{
			cgt.setIsParent("fasle");
		}
		cgslist.add(cgt);
		
		JSONArray jsons=JSONArray.fromObject(cgslist);
		ztree = jsons.toString();
		
		
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
		
//		totalpeople = cg1slist.size()+1;
		
		//当前页码
		if (id <= 0) {
	    	id = 1;
		}
        
		//终端显示(默认用户下面所有终端)
		ClientGroupRelation cgr=new ClientGroupRelation();
		cgr.setGid(0);
		cgr.setGtype(0);
		cgr.setUid(uid);
		
		total=(Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_client_all_page_count", cgr);
		
		//获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if(pagetype==-1){
			pagetype=total;
		}
		cgr.setStartid((id - 1) * pagetype);
		cgr.setPagetype(pagetype);
		clients=SqlConnect.getSqlMapInstance().queryForList("sel_client_all_page", cgr);
		
		
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

	public List<ClientGroupTree> getCgslist() {
		return cgslist;
	}

	public void setCgslist(List<ClientGroupTree> cgslist) {
		this.cgslist = cgslist;
	}

	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
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

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setCgid(int cgid) {
		this.cgid = cgid;
	}
	public int getTbId() {
		return tbId;
	}

	public void setTbId(int tbId) {
		this.tbId = tbId;
	}
	
	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}
}

