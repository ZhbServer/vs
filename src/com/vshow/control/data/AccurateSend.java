package com.vshow.control.data;

public class AccurateSend {
	
    private Integer id;
    private Integer resultid;  
    private String itemids;  //节目id 多个用 ,分割
    private int type;        //节目类型 1普通节目 2互动节目
    private int sex;         //性别   0男女  1男  2女 
	private String generation;  //年龄范围  0,100

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getResultid() {
		return resultid;
	}

	public void setResultid(Integer resultid) {
		this.resultid = resultid;
	}

	public String getItemids() {
		return itemids;
	}

	public void setItemids(String itemids) {
		this.itemids = itemids;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getGeneration() {
		return generation;
	}

	public void setGeneration(String generation) {
		this.generation = generation;
	}
}
