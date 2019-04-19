package com.vshow.control.sucai;

import java.io.File;
import java.io.FileFilter;
import java.util.Arrays;
import java.util.Comparator;

import com.opensymphony.xwork.Action;
import com.vshow.control.tool.Constant;

public class SeepicsBi implements Action {

	private String fname;
	private String names;
	private String first;

	public String getFirst() {
		return first;
	}

	public String getNames() {
		return names;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String execute() throws Exception {
		String tpdir = Constant.FILES + File.separator + fname;
		File f = new File(tpdir);
		File[] files = f.listFiles(new FileFilter() {
			public boolean accept(File file) {
				return file.getName().toLowerCase().endsWith(".png");
			}
		});
		Arrays.sort(files, new Comparator<File>() {
			public int compare(File f1, File f2) {
				return Long.valueOf(f1.lastModified()).compareTo(
						f2.lastModified());
			}
		});
		names = "";
		for (int i = 0; i < files.length; i++) {
			if (i == 0) {
				first = fname + "/" + files[i].getName();
			} else if (i == 1) {
				names = fname + "/" + files[i].getName();
			} else {
				names += " " + fname + "/" + files[i].getName();
			}
		}
		return SUCCESS;
	}
}
