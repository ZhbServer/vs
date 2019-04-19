package com.vshow.control.time;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;


import java.util.List;


import javax.imageio.ImageIO;

import com.vshow.control.data.Screen;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;


public class TimeJp extends Thread {
	public void run() {

		boolean bian = false;
		List scl = null;
		try {
			scl = SqlConnect.getSqlMapInstance().queryForList("gt_scr_one");
		} catch (SQLException e) {

		}
		Screen sce;
		if (scl != null) {
			if (scl.size() > 0) {
				for (int i = 0; i < scl.size(); i++) {
					sce = (Screen) scl.get(i);
					try {
						if ((Constant.TT % sce.getStime()) == 1) {
							bian = true;
							BufferedImage screenshot = (new Robot())
									.createScreenCapture(new Rectangle(sce
											.getPosx(), sce.getPosy(), sce
											.getWidth(), sce.getHeight()));
							File f = new File(Constant.SCREEN + File.separator
									+ Constant.JIATOTAL + Constant.TT
									+ sce.getFilename());
							ImageIO.write(screenshot, sce.getType(), f);
							try {
								
								new File(Constant.SCREEN + File.separator
										+ Constant.JIATOTAL + Constant.TOTAL
										+ sce.getFilename()).delete();
								
							} catch (Exception e) {
                            }
						}
					} catch (Exception ex) {
					}
				}
				if (bian) {
					Constant.TOTAL = Constant.TT;
				}
			}
		}
	}
}
