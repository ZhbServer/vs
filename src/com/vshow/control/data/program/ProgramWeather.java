package com.vshow.control.data.program;

/**
 * 
 * @author w 天气
 * 
 */
public class ProgramWeather {
	private String weatherCity;  //城市
	private int weatherQtime;    //切换时间(分)

	public String getWeatherCity() {
		return weatherCity;
	}

	public void setWeatherCity(String weatherCity) {
		this.weatherCity = weatherCity;
	}

	public int getWeatherQtime() {
		return weatherQtime;
	}

	public void setWeatherQtime(int weatherQtime) {
		this.weatherQtime = weatherQtime;
	}

}
