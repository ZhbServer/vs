package com.vshow.control.data;

/**  权限   * */
public class Power extends PublicData {
	private int id;
	
	private int userid;        
	private String username;
	private String account;     
	private int ocheck;
	private String usertkey;
	private int jhocheck;     //计划审核状态
	
	
	private String name;         //权限名
	private int seesucai;        //预览素材
	private int addsucai;        //新增素材
	private int delsucai;        //删除素材
	private int publicsucai;     //共享素材
	private int publicitem;      //共享节目
	private int seeitem;         //预览节目
	private int additem;         //新增节目
	private int delitem;         //删除节目 
	private int itemsend;        //发布节目 
	private int listsend;        //发布轮播 
	private int insertsend;      //发布插播
	private int dpsend;          //发布垫片
	private int downmanager;     //下载管理
	private int clientset;       //终端管理
	private int clearclient;     //清理终端
	private int noticesend;      //发布通知 
	private int onoffset;        //开关设置
	private int groupmanager;    //分组管理
	private int parameterset;    //参数设置
	private int serverip;        //二级服务器设置   
	private int usermanager;     //用户管理
	private int powermanager;    //权限管理
	private int sysset;          //系统参数设置
	private int userlog;         //用户日志
	private int clientlog;       //终端日志
	private int statistical;     //统计
	private int checksend;       //审核发布	
	private int checkitem;       //审核节目 
	private int jhset;           //计划管理 
	private int khmanager;       //客户管理(针对于二次开发) 
	private int clientdisabled;  //禁用 终端
	
	private int size;            //权限大小
	private int uid;             //创建权限用户
	private int ban;             //用户账户是否禁用
	
	private int dllItemSend;        //发布控件节目
	
	private int itemsendAdd;       //发布节目追加
	private int itemsendReplace;   //发布节目替换
	
	private int itemsendInduction;//发布感应 
	private int itemsendPrecise;//发布精准
	private int itemsendInteractive;//发布互动
	
	private int itemsendWarning; //发布预警
	
	
	public int getItemsendWarning() {
		return itemsendWarning;
	}
	public void setItemsendWarning(int itemsendWarning) {
		this.itemsendWarning = itemsendWarning;
	}
	public int getItemsendInduction() {
		return itemsendInduction;
	}
	public void setItemsendInduction(int itemsendInduction) {
		this.itemsendInduction = itemsendInduction;
	}
	public int getItemsendPrecise() {
		return itemsendPrecise;
	}
	public int getJhocheck() {
		return jhocheck;
	}
	public void setJhocheck(int jhocheck) {
		this.jhocheck = jhocheck;
	}
	public void setItemsendPrecise(int itemsendPrecise) {
		this.itemsendPrecise = itemsendPrecise;
	}
	public int getItemsendInteractive() {
		return itemsendInteractive;
	}
	public void setItemsendInteractive(int itemsendInteractive) {
		this.itemsendInteractive = itemsendInteractive;
	}
	public int getItemsendAdd() {
		return itemsendAdd;
	}
	public void setItemsendAdd(int itemsendAdd) {
		this.itemsendAdd = itemsendAdd;
	}
	public int getItemsendReplace() {
		return itemsendReplace;
	}
	public void setItemsendReplace(int itemsendReplace) {
		this.itemsendReplace = itemsendReplace;
	}
	public int getDllItemSend() {
		return dllItemSend;
	}
	public void setDllItemSend(int dllItemSend) {
		this.dllItemSend = dllItemSend;
	}
	public int getClientdisabled() {
		return clientdisabled;
	}
	public void setClientdisabled(int clientdisabled) {
		this.clientdisabled = clientdisabled;
	}
	
	
	public int getKhmanager() {
		return khmanager;
	}
	public void setKhmanager(int khmanager) {
		this.khmanager = khmanager;
	}
	
	public int getJhset() {
		return jhset;
	}
	public void setJhset(int jhset) {
		this.jhset = jhset;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getOcheck() {
		return ocheck;
	}
	public void setOcheck(int ocheck) {
		this.ocheck = ocheck;
	}
	public String getUsertkey() {
		return usertkey;
	}
	public void setUsertkey(String usertkey) {
		this.usertkey = usertkey;
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
	public int getPublicitem() {
		return publicitem;
	}
	public void setPublicitem(int publicitem) {
		this.publicitem = publicitem;
	}
	public int getPublicsucai() {
		return publicsucai;
	}
	public void setPublicsucai(int publicsucai) {
		this.publicsucai = publicsucai;
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
	public int getDownmanager() {
		return downmanager;
	}
	public void setDownmanager(int downmanager) {
		this.downmanager = downmanager;
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
	public int getServerip() {
		return serverip;
	}
	public void setServerip(int serverip) {
		this.serverip = serverip;
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
	public int getChecksend() {
		return checksend;
	}
	public void setChecksend(int checksend) {
		this.checksend = checksend;
	}
	public int getCheckitem() {
		return checkitem;
	}
	public void setCheckitem(int checkitem) {
		this.checkitem = checkitem;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}

}
