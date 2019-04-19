package com.vshow.control.data;

public class FactoryPlanItem extends PublicData{

	private int id; // id
	private int fid; // 主表id
	private int cid; // 终端id
	private String cName; //终端名称
	private String filenames; // 素材元素
	
	private String subfnames;

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}

	public String getSubfnames() {
		return subfnames;
	}

	public void setSubfnames(String subfnames) {
		this.subfnames = subfnames;
	}
	
}
