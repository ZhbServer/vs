package com.vshow.control.data;

public class Tq extends PublicData {
	private int id;
	private String day;
	private String city;
	private String citykey;
	
	private String code;
	private String gif;
	private String content;
	private String wdata;
	private int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getWdata() {
		return wdata;
	}

	public void setWdata(String wdata) {
		this.wdata = wdata;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getGif() {
		return gif;
	}

	public void setGif(String gif) {
		this.gif = gif;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCitykey() {
		return citykey;
	}

	public void setCitykey(String citykey) {
		this.citykey = citykey;
	}
	@Override
	public String toString() {
		return id+"*"+day+"*"+city+"*"+citykey+"*"+code+"*"+gif+"*"+content;
		
	}

}
