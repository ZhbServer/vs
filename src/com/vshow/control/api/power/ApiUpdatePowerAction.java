package com.vshow.control.api.power;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Power;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;

import com.vshow.control.tool.SqlConnect;


/**
 * 修改权限
 * @param account 账号
 * @param password 密码 
 * @param name     	        权限名
 * @param seesucai     查看素材
 * @param addsucai     新增素材
 * @param delsucai     删除素材
 * @param seeitem      查看节目
 * @param additem      新增节目
 * @param delitem      删除节目 
 * @param itemsend     发布节目 
 * @param dpsend       发布垫片
 * @param listsend     发布轮播 
 * @param insertsend   发布插播
 * @param jhset        计划管理 
 * @param clientset    终端设置
 * @param groupmanager 分组设置
 * @param parameterset 终端控制
 * @param clearclient  清理终端
 * @param noticesend   发布通知 
 * @param onoffset     开关设置
 * @param clientdisabled  禁用 终端
 * @param usermanager  用户管理
 * @param powermanager 权限管理
 * @param khmanager    客户管理
 * @param sysset       系统参数设置
 * @param userlog      用户日志
 * @param clientlog    终端日志
 * @param statistical  统计
 * @param checkitem    审核节目 
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiUpdatePowerAction implements Action {
	
	private String password;
	private String account;
	private String content;
	
	private String name;         //权限名
	private int seesucai;        //预览素材
	private int addsucai;        //新增素材
	private int delsucai;        //删除素材
	private int seeitem;         //预览节目
	private int additem;         //新增节目
	private int delitem;         //删除节目 
	private int itemsend;        //发布节目 
	private int listsend;        //发布轮播 
	private int insertsend;      //发布插播
	private int dpsend;          //发布垫片
	private int clientset;       //终端管理
	private int clearclient;     //清理终端
	private int noticesend;      //发布通知 
	private int onoffset;        //开关设置
	private int groupmanager;    //分组管理
	private int parameterset;    //参数设置
	private int usermanager;     //用户管理
	private int powermanager;    //权限管理
	private int sysset;          //系统参数设置
	private int userlog;         //用户日志
	private int clientlog;       //终端日志
	private int statistical;     //统计
	private int checkitem;       //审核节目 
	private int jhset;           //计划管理 
	private int khmanager;       //客户管理(针对于二次开发) 
	private int clientdisabled;  //禁用 终端

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				Power power = new Power();
				power.setName(name);
				power.setSeesucai(seesucai);
				power.setAddsucai(addsucai);
				power.setDelsucai(delsucai);
				power.setSeeitem(seeitem);
				
				power.setAdditem(additem);
				power.setDelitem(delitem);
				power.setItemsend(itemsend);
				power.setListsend(listsend);
				power.setDpsend(dpsend);
				
				power.setInsertsend(insertsend);
				power.setClientset(clientset);
				power.setClearclient(clearclient);
				power.setNoticesend(noticesend);
				power.setOnoffset(onoffset);
				
				power.setGroupmanager(groupmanager);
				power.setParameterset(parameterset);
				power.setUsermanager(usermanager);
				power.setPowermanager(powermanager);
				power.setSysset(sysset);
				
				power.setUserlog(userlog);
				power.setClientlog(clientlog);
				power.setStatistical(statistical);
				power.setCheckitem(checkitem);
				power.setJhset(jhset);
				
				power.setKhmanager(khmanager);
				power.setClientdisabled(clientdisabled);
				
				try {
					SqlConnect.getSqlMapInstance().update("update_power", power);
					LogHandle.insertTheLog(LogType.type57, user.getId(),Constant.LOCAL.getA00172()+":" + power.getName(), 1,1);
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code="3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons1 = JSONArray.fromObject(map);

		content = jsons1.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeesucai() {
		return seesucai;
	}

	public void setSeesucai(int seesucai) {
		this.seesucai = seesucai;
	}

	public int getAddsucai() {
		return addsucai;
	}

	public void setAddsucai(int addsucai) {
		this.addsucai = addsucai;
	}

	public int getDelsucai() {
		return delsucai;
	}

	public void setDelsucai(int delsucai) {
		this.delsucai = delsucai;
	}

	public int getSeeitem() {
		return seeitem;
	}

	public void setSeeitem(int seeitem) {
		this.seeitem = seeitem;
	}

	public int getAdditem() {
		return additem;
	}

	public void setAdditem(int additem) {
		this.additem = additem;
	}

	public int getDelitem() {
		return delitem;
	}

	public void setDelitem(int delitem) {
		this.delitem = delitem;
	}

	public int getItemsend() {
		return itemsend;
	}

	public void setItemsend(int itemsend) {
		this.itemsend = itemsend;
	}

	public int getListsend() {
		return listsend;
	}

	public void setListsend(int listsend) {
		this.listsend = listsend;
	}

	public int getInsertsend() {
		return insertsend;
	}

	public void setInsertsend(int insertsend) {
		this.insertsend = insertsend;
	}

	public int getDpsend() {
		return dpsend;
	}

	public void setDpsend(int dpsend) {
		this.dpsend = dpsend;
	}

	public int getClientset() {
		return clientset;
	}

	public void setClientset(int clientset) {
		this.clientset = clientset;
	}

	public int getClearclient() {
		return clearclient;
	}

	public void setClearclient(int clearclient) {
		this.clearclient = clearclient;
	}

	public int getNoticesend() {
		return noticesend;
	}

	public void setNoticesend(int noticesend) {
		this.noticesend = noticesend;
	}

	public int getOnoffset() {
		return onoffset;
	}

	public void setOnoffset(int onoffset) {
		this.onoffset = onoffset;
	}

	public int getGroupmanager() {
		return groupmanager;
	}

	public void setGroupmanager(int groupmanager) {
		this.groupmanager = groupmanager;
	}

	public int getParameterset() {
		return parameterset;
	}

	public void setParameterset(int parameterset) {
		this.parameterset = parameterset;
	}

	public int getUsermanager() {
		return usermanager;
	}

	public void setUsermanager(int usermanager) {
		this.usermanager = usermanager;
	}

	public int getPowermanager() {
		return powermanager;
	}

	public void setPowermanager(int powermanager) {
		this.powermanager = powermanager;
	}

	public int getSysset() {
		return sysset;
	}

	public void setSysset(int sysset) {
		this.sysset = sysset;
	}

	public int getUserlog() {
		return userlog;
	}

	public void setUserlog(int userlog) {
		this.userlog = userlog;
	}

	public int getClientlog() {
		return clientlog;
	}

	public void setClientlog(int clientlog) {
		this.clientlog = clientlog;
	}

	public int getStatistical() {
		return statistical;
	}

	public void setStatistical(int statistical) {
		this.statistical = statistical;
	}

	public int getCheckitem() {
		return checkitem;
	}

	public void setCheckitem(int checkitem) {
		this.checkitem = checkitem;
	}

	public int getJhset() {
		return jhset;
	}

	public void setJhset(int jhset) {
		this.jhset = jhset;
	}

	public int getKhmanager() {
		return khmanager;
	}

	public void setKhmanager(int khmanager) {
		this.khmanager = khmanager;
	}

	public int getClientdisabled() {
		return clientdisabled;
	}

	public void setClientdisabled(int clientdisabled) {
		this.clientdisabled = clientdisabled;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
