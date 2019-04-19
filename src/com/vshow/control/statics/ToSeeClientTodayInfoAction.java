package com.vshow.control.statics;


import net.sf.json.JSONArray;
import com.opensymphony.xwork.Action;
import com.vshow.control.data.CountClientTime;
import com.vshow.control.tool.SqlConnect;

public class ToSeeClientTodayInfoAction implements Action {

	private int id;
	private String cClientTime;

	@Override
	public String execute() throws Exception {

		CountClientTime cct = (CountClientTime) SqlConnect.getSqlMapInstance()
				.queryForObject("sel_cct_byid", id);

		checkCountResult(cct);

		JSONArray jsons = JSONArray.fromObject(cct);
		cClientTime = jsons.toString();

		return SUCCESS;
	}

	public static void checkCountResult(CountClientTime cct) {
		cct.setLongtime(formatTime(cct.getBcount()));
	}

	/*
	 * 毫秒转化时分秒
	 */
	public static String formatTime(Integer time) {
		Integer ss = 1;
		Integer mi = ss * 60;
		Integer hh = mi * 60;

		Long ms = Long.parseLong(String.valueOf(time));

		Long hour = ms / hh;
		Long minute = (ms - hour * hh) / mi;
		Long second = (ms - hour * hh - minute * mi) / ss;

		StringBuffer sb = new StringBuffer();
		// if(day > 0) {
		// sb.append(day+"天");
		// }
		if (hour > 0 && hour <= 9) {
			sb.append("0" + hour + ":");
		} else if (hour > 9) {
			sb.append(hour + ":");
		} else {
			sb.append("00:");
		}
		if (minute > 0 && minute <= 9) {
			sb.append("0" + minute + ":");
		} else if (minute > 9) {
			sb.append(minute + ":");
		} else {
			sb.append("00:");
		}
		if (second > 0 && second <= 9) {
			sb.append("0" + second);
		} else if (second > 9) {
			sb.append(second);
		} else {
			sb.append("00");
		}
		// if(milliSecond > 0) {
		// sb.append(milliSecond+"毫秒");
		// }
		return sb.toString();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getcClientTime() {
		return cClientTime;
	}

	public void setcClientTime(String cClientTime) {
		this.cClientTime = cClientTime;
	}

}
