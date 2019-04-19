package com.vshow.control.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;


import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroup;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.ScShare;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class ToClientAjaxAction implements Action {

	private List<Client> listClient; // 素材集合
	
	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1文件名,用户名) 
	private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
    
    private int clientGroupId; //终端分组id 
   
    private int checkAjaxState=0; //(是否是ajax请求 0不是  1是)
	@Override
	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		
		String tkey = (String) session.get("urtkey");


		//查询当前用户，下级用户的素材
		
		Client client=new Client();
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		client.setUid(uid);
		client.setGid(clientGroupId);

		//获取查询条件总个数
		   
		if(sel==0){
				
			
			 total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_client_gid_uid_all_count", client);
				
				
		}else if(sel==1){
				client.setName(ser);			
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_client_gid_uid_sel_all_count", client);
		}
			
	
		//全部素材
	    client.setStartid(0);
	    client.setPagetype(total);
		if(sel==0){
			
			listClient =  SqlConnect.getSqlMapInstance().queryForList("sel_client_gid_uid_page", client);
				
		}else if(sel==1){
				
			listClient =  SqlConnect.getSqlMapInstance().queryForList("sel_client_gid_uid_sel_page", client);
		}
			
		
	    return GsonUtil.getGson(listClient);
			
		
	}
	public List<Client> getListClient() {
		return listClient;
	}
	public void setListClient(List<Client> listClient) {
		this.listClient = listClient;
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
	public int getClientGroupId() {
		return clientGroupId;
	}
	public void setClientGroupId(int clientGroupId) {
		this.clientGroupId = clientGroupId;
	}
	public int getCheckAjaxState() {
		return checkAjaxState;
	}
	public void setCheckAjaxState(int checkAjaxState) {
		this.checkAjaxState = checkAjaxState;
	}
	
	
	

	

}
