package com.vshow.control.count;

import java.util.List;

public class CountPeople {

	private String clientMark;// 终端标识
	private List<CountPeopleArticle> countPeopleArticleList;// 统计条数

	public String getClientMark() {
		return clientMark;
	}

	public void setClientMark(String clientMark) {
		this.clientMark = clientMark;
	}

	public List<CountPeopleArticle> getCountPeopleArticleList() {
		return countPeopleArticleList;
	}

	public void setCountPeopleArticleList(
			List<CountPeopleArticle> countPeopleArticleList) {
		this.countPeopleArticleList = countPeopleArticleList;
	}

}
