package com.vshow.control.data;

public class InteractItem extends PublicData {
	
	private int id;
	private String name;
	private int userid;
	private String user;
	private String sdate;
	private int ocheck;
	private int fblid;
	private long len;
    private String size;
    private String mfile;
    private String tkey;
    private String filename;
    private long alllen;
    private String allsize;
    private int isgx = 0;  //是否是共享节目
    private int playNumber=1;//播放次数
    private int gpid;
    private Scene scene;  //场景 
    private int itemState;   //1节目原制作人修改  2节目非原制作人修改  
    private String lable;

	
	public int getItemState() {
		return itemState;
	}
	public String getLable() {
		return lable;
	}
	public void setLable(String lable) {
		this.lable = lable;
	}
	public void setItemState(int itemState) {
		this.itemState = itemState;
	}
	public Scene getScene() {
		return scene;
	}
	public void setScene(Scene scene) {
		this.scene = scene;
	}
	public int getGpid() {
		return gpid;
	}
	public void setGpid(int gpid) {
		this.gpid = gpid;
	}
	public int getPlayNumber() {
		return playNumber;
	}
	public void setPlayNumber(int playNumber) {
		this.playNumber = playNumber;
	}
	public String getAllsize() {
		return allsize;
	}
	public void setAllsize(String allsize) {
		this.allsize = allsize;
	}
	public long getAlllen() {
		return alllen;
	}
	public void setAlllen(long alllen) {
		this.alllen = alllen;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTkey() {
		return tkey;
	}
	public void setTkey(String tkey) {
		this.tkey = tkey;
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

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}



	public int getFblid() {
		return fblid;
	}

	public void setFblid(int fblid) {
		this.fblid = fblid;
	}

	
	public int getOcheck() {
		return ocheck;
	}

	public void setOcheck(int ocheck) {
		this.ocheck = ocheck;
	}


	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public long getLen() {
		return len;
	}

	public void setLen(long len) {
		this.len = len;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}
	public int getIsgx() {
		return isgx;
	}
	public void setIsgx(int isgx) {
		this.isgx = isgx;
	}
	
}
