package com.vshow.control.api.test.treasure;

import com.opensymphony.xwork.Action;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.SqlConnect;

public class SeeTreasureImg implements Action {
	
	private String preview;	
	
	private String code;	
	private String styleImg;
	private String skipImg;
	private int id;
	
	private String seewidth="360";
	private String seeheight="360";
	
	public String execute() throws Exception {
		
		Treasure tre=new Treasure();
		
		if (code!=null) {//判断二维码是否为空，不为空则显示二维码
			tre= (Treasure) SqlConnect.getSqlMapInstance().queryForObject("go_filename_code", code);
			preview =tre.getCode();
		}else if (styleImg!=null) {
			tre= (Treasure) SqlConnect.getSqlMapInstance().queryForObject("go_filename_styleImg", styleImg);
			preview =tre.getStyleImg();
		}else if (skipImg!=null) {
			tre= (Treasure) SqlConnect.getSqlMapInstance().queryForObject("go_filename_skipImg", skipImg);
			preview =tre.getSkipImg();
		}else {

			tre= (Treasure) SqlConnect.getSqlMapInstance().queryForObject("go_id_code", id);
			if (tre.getCode()!=null) {
				preview =tre.getCode();
			}
			if (tre.getSkipImg()!=null) {
				preview =tre.getSkipImg();
			}
			
		}
		
											
		
		return SUCCESS;
	}
	
	public String getSeewidth() {
		return seewidth;
	}

	public void setSeewidth(String seewidth) {
		this.seewidth = seewidth;
	}

	public String getSeeheight() {
		return seeheight;
	}

	public void setSeeheight(String seeheight) {
		this.seeheight = seeheight;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStyleImg() {
		return styleImg;
	}

	public void setStyleImg(String styleImg) {
		this.styleImg = styleImg;
	}

	public String getSkipImg() {
		return skipImg;
	}

	public void setSkipImg(String skipImg) {
		this.skipImg = skipImg;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}
	
	

}
