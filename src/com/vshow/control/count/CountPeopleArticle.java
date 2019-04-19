package com.vshow.control.count;

import java.util.List;

public class CountPeopleArticle {
	
	private String countDate;// 时间  
	private int countPeople;// 统计人数
	private List<CountPeopleDetails> countPeopleDetailsList;// 统计人数详情

	public String getCountDate() {
		return countDate;
	}

	public void setCountDate(String countDate) {
		this.countDate = countDate;
	}



	public int getCountPeople() {
		return countPeople;
	}

	public void setCountPeople(int countPeople) {
		this.countPeople = countPeople;
	}

	public List<CountPeopleDetails> getCountPeopleDetailsList() {
		return countPeopleDetailsList;
	}

	public void setCountPeopleDetailsList(
			List<CountPeopleDetails> countPeopleDetailsList) {
		this.countPeopleDetailsList = countPeopleDetailsList;
	}
}
