package com.vshow.control.data;

import java.util.ArrayList;
import java.util.List;

public class Pages {
	// 集合存储显示页码(前)
	private List<Integer> qs;
	// 集合存储显示页码(后)
	private List<Integer> hs;

	public List<Integer> getQs() {
		return qs;
	}

	public void setQs(List<Integer> qs) {
		this.qs = qs;
	}

	public List<Integer> getHs() {
		return hs;
	}

	public void setHs(List<Integer> hs) {
		this.hs = hs;
	}

}
