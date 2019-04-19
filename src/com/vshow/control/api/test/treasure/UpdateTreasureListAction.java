package com.vshow.control.api.test.treasure;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.opensymphony.xwork.ActionContext;
import com.vshow.control.api.v1.base.BaseAction;
import com.vshow.control.data.Treasure;
import com.vshow.control.tool.Constant;

import com.vshow.control.tool.SqlConnect;

/*
 *修改
 */

public class UpdateTreasureListAction extends BaseAction {
	
	private int id;
	private String treasureName;//活动名
	private String onStatus;//上线状态   0表示未上线、1表示待上线、2表示活动中、3表示已下线 
	private String treasureType;//活动类型  0表示分宝箱、1表示二维码活动，2表示宝箱是否带特效
	private String onTime;//活动上线时间
	private String offTime;//活动下线时间			
	private String url;//跳转URL	
	private String sendtypes;
	
	private String[] codenametext;//二维码文本框
	private String styleImgnametext;//宝箱样式图片文本框
	private String imgnametext;//宝箱内容图片文本框
	
	private String item;
	private String lastModifier;//最近一次修改人		
	private String modifierTime;//最近一次修改时间		
					
		
	private File codeName;
	private String codeNameFileName;
		
	private File styleImgName;
	private String styleImgNameFileName;
	
	private File imgName;
	private String imgNameFileName;
	
	private String[] treasureHeight;
	private String[] treasureWidth;
	private int showTime;//宝箱显示时间
	private int itemId;//节目id
	private String[] imgHeight;//高度
	private String[] imgWidth;//宽度
	
	public String execute() throws Exception {
		
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		int uid = (Integer) session.get("urid");
		
		String lastModifier=(String) SqlConnect.getSqlMapInstance().queryForObject("go_treasure_user", uid);
		
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		modifierTime=df.format(new Date());// new Date()为获取当前系统时间
		String code=null;
		String img=null;
		String styleImg=null;
		String codenametexts=null;
		for (int k = 0; k < codenametext.length; k++) {
			if (codenametext[k]!=null&&!codenametext[k].equals("")) {
				
				codenametexts=codenametext[k];
			}
		}
		
		if (codenametexts!=null&&!codenametexts.equals("")) {
			
			code=codenametexts;
		}else {
			code=uploadCodeFile();//二维码
		}
		if (styleImgnametext!=null&&!styleImgnametext.equals("")) {
			styleImg=styleImgnametext;
		} else {
			styleImg=uploadStyleImgFile();//宝箱样式图片	
		}
		if (imgnametext!=null&&!imgnametext.equals("")) {
			img=imgnametext;
		} else {
			img=uploadImgFile();//图片	
		}
		
		
		int types = 0;//宝箱内容类型，1 二维码、2 url、 3 图片、 4 节目
		if (code!=null&&!code.equals("")) {
			if (styleImg!=null&&!styleImg.equals("")) {
				types=1;
			}else {
				types=0;
			}						
		} 
		
		String https=null;
		if (url!=null&&!url.equals("")) {
			types=2;					
			boolean status = url.contains("http://");
			if(status){
				https=url;//url
			}else{
				https="http://"+url;//url
			}
		} 
		if (img!=null&&!img.equals("")) {
			types=3;
		} 
		
		String itemFileName="";//节目包
		if (item!=null&&!item.equals("")) {
			types=4;		
			if (itemId>0) {
				itemFileName=(String)SqlConnect.getSqlMapInstance().queryForObject("sel_item_id_scene_filename", itemId);					
			}
		} 
		
		int imgHeights=0;
		for (int i = 0; i < imgHeight.length; i++) {
			
			if (imgHeight[i]!=null&&!imgHeight[i].equals("")&&!imgHeight[i].equals("0")) {//判断图片高度是否为空，不为空则赋值给imgHeights
				imgHeights=Integer.parseInt(imgHeight[i]);
			}
		}		
		int imgWidths=0;
		for (int j = 0; j < imgWidth.length; j++) {
			
			if (imgWidth[j]!=null&&!imgWidth[j].equals("")&&!imgWidth[j].equals("0")) {
				imgWidths=Integer.parseInt(imgWidth[j]);
			}
		}
		int codeHeights=0;
		for (int f = 0; f < treasureHeight.length; f++) {
			
			if (treasureHeight[f]!=null&&!treasureHeight[f].equals("")&&!treasureHeight[f].equals("0")) {//判断图片高度是否为空，不为空则赋值给imgHeights
				codeHeights=Integer.parseInt(treasureHeight[f]);
			}
		}
		
		int codeWidths=0;
		for (int h = 0; h < treasureWidth.length; h++) {
			
			if (treasureWidth[h]!=null&&!treasureWidth[h].equals("")&&!treasureWidth[h].equals("0")) {
				codeWidths=Integer.parseInt(treasureWidth[h]);
			}
		}
																			
		String ban="已启用"; //默认启用
						
		Treasure Tre=new Treasure();	
		Tre.setId(id);
		Tre.setTreasureName(treasureName);
		Tre.setItemName(item);	
		Tre.setOnStatus(onStatus);
		Tre.setTreasureType(treasureType);	
		Tre.setOnTime(onTime);
		Tre.setOffTime(offTime);
		Tre.setUrl(https);
		Tre.setCode(code);
		Tre.setStyleImg(styleImg);		
		Tre.setSkipImg(img);						
		Tre.setLastModifier(lastModifier);
		Tre.setModifierTime(modifierTime);	
		Tre.setTreasureHeight(codeHeights);
		Tre.setTreasureWidth(codeWidths);
		Tre.setTreasureInsideType(types);
		Tre.setShowTime(showTime);				
		Tre.setItemFileName(itemFileName);
		Tre.setItemId(itemId);
		Tre.setImgHeight(imgHeights);
		Tre.setImgWidth(imgWidths);
		int num=(Integer) SqlConnect.getSqlMapInstance().update("update_treasure", Tre);
		if (num>0) {
			return SUCCESS;
		}else {
			return ERROR;
		}
								
	}
	
	
	public String uploadCodeFile() {
		if (codeNameFileName!=null) {
			codeNameFileName=codeNameFileName.replaceAll("\\'", "").replaceAll("\\@", "").replaceAll("\\#", "").replaceAll("\\$", "").replaceAll("\\%", "").replaceAll("\\^", "").replaceAll("\\*", "").replaceAll("\\'", "").replaceAll("\\[", "")
	        .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");;
	        //获取图片类型
	        String type = codeNameFileName.substring(codeNameFileName.lastIndexOf('.') + 1,	codeNameFileName.length()).trim().toLowerCase();
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);//随机生成图片名
			String tempf=null;
			if (styleImgNameFileName!=null&&!styleImgNameFileName.equals("")||!styleImgnametext.equals("")&&styleImgnametext!=null) {
				 tempf = "c"+tempname + "." + type;//新图片名
			}else {
				 tempf = "s"+tempname + "." + type;//新图片名
			}
			
	      
			File temfs = new File(Constant.FILES + File.separator + tempf);//新图片路径
			//System.out.println("SRC:"+temfs);
			codeName.renameTo(temfs);//替换旧路径
			//返回文件名
			return tempf;	
		}else {
			codeNameFileName=null;
			String tempf =codeNameFileName;
			return tempf;
		}
		
	}
	
	public String uploadStyleImgFile() {
		if (styleImgNameFileName!=null) {
			styleImgNameFileName=styleImgNameFileName.replaceAll("\\'", "").replaceAll("\\@", "").replaceAll("\\#", "").replaceAll("\\$", "").replaceAll("\\%", "").replaceAll("\\^", "").replaceAll("\\*", "").replaceAll("\\'", "").replaceAll("\\[", "")
	        .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");;
	        
	        String type = styleImgNameFileName.substring(styleImgNameFileName.lastIndexOf('.') + 1,	styleImgNameFileName.length()).trim().toLowerCase();
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			String tempf = "s"+tempname + "." + type;
			
			File temfs = new File(Constant.FILES + File.separator + tempf);
			styleImgName.renameTo(temfs);
			return tempf;	
		}else {
			styleImgNameFileName=null;
			String tempf =styleImgNameFileName;
			return tempf;
		}
				
	}
	
	
	public String uploadImgFile() {
		if (imgNameFileName!=null) {
			imgNameFileName=imgNameFileName.replaceAll("\\'", "").replaceAll("\\@", "").replaceAll("\\#", "").replaceAll("\\$", "").replaceAll("\\%", "").replaceAll("\\^", "").replaceAll("\\*", "").replaceAll("\\'", "").replaceAll("\\[", "")
	        .replaceAll("\\]", "").replaceAll("\\{", "").replaceAll("\\}", "").replaceAll("\\(", "").replaceAll("\\)", "");;
	        
	        String type = imgNameFileName.substring(imgNameFileName.lastIndexOf('.') + 1,	imgNameFileName.length()).trim().toLowerCase();
			String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
			String tempf = "i"+tempname + "." + type;
			
			File temfs = new File(Constant.FILES + File.separator + tempf);
			imgName.renameTo(temfs);
			return tempf;	
		}else {
			imgNameFileName=null;
			String tempf =imgNameFileName;
			return tempf;
		}
			
	}


	
	
	public String[] getImgHeight() {
		return imgHeight;
	}


	public void setImgHeight(String[] imgHeight) {
		this.imgHeight = imgHeight;
	}


	public String[] getImgWidth() {
		return imgWidth;
	}


	public void setImgWidth(String[] imgWidth) {
		this.imgWidth = imgWidth;
	}


	public int getItemId() {
		return itemId;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public int getShowTime() {
		return showTime;
	}


	public void setShowTime(int showTime) {
		this.showTime = showTime;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTreasureName() {
		return treasureName;
	}


	public void setTreasureName(String treasureName) {
		this.treasureName = treasureName;
	}


	public String getOnStatus() {
		return onStatus;
	}


	public void setOnStatus(String onStatus) {
		this.onStatus = onStatus;
	}


	public String getTreasureType() {
		return treasureType;
	}


	public void setTreasureType(String treasureType) {
		this.treasureType = treasureType;
	}


	public String getOnTime() {
		return onTime;
	}


	public void setOnTime(String onTime) {
		this.onTime = onTime;
	}


	public String getOffTime() {
		return offTime;
	}


	public void setOffTime(String offTime) {
		this.offTime = offTime;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getSendtypes() {
		return sendtypes;
	}


	public void setSendtypes(String sendtypes) {
		this.sendtypes = sendtypes;
	}


	


	public String[] getCodenametext() {
		return codenametext;
	}


	public void setCodenametext(String[] codenametext) {
		this.codenametext = codenametext;
	}


	public String getStyleImgnametext() {
		return styleImgnametext;
	}


	public void setStyleImgnametext(String styleImgnametext) {
		this.styleImgnametext = styleImgnametext;
	}


	public String getImgnametext() {
		return imgnametext;
	}


	public void setImgnametext(String imgnametext) {
		this.imgnametext = imgnametext;
	}


	public String getItem() {
		return item;
	}


	public void setItem(String item) {
		this.item = item;
	}


	public String getLastModifier() {
		return lastModifier;
	}


	public void setLastModifier(String lastModifier) {
		this.lastModifier = lastModifier;
	}


	public String getModifierTime() {
		return modifierTime;
	}


	public void setModifierTime(String modifierTime) {
		this.modifierTime = modifierTime;
	}
	
	public File getStyleImgName() {
		return styleImgName;
	}


	public void setStyleImgName(File styleImgName) {
		this.styleImgName = styleImgName;
	}


	public String getStyleImgNameFileName() {
		return styleImgNameFileName;
	}


	public void setStyleImgNameFileName(String styleImgNameFileName) {
		this.styleImgNameFileName = styleImgNameFileName;
	}


	public File getImgName() {
		return imgName;
	}


	public void setImgName(File imgName) {
		this.imgName = imgName;
	}

	public String getImgNameFileName() {
		return imgNameFileName;
	}


	public void setImgNameFileName(String imgNameFileName) {
		this.imgNameFileName = imgNameFileName;
	}


	public File getCodeName() {
		return codeName;
	}


	public void setCodeName(File codeName) {
		this.codeName = codeName;
	}


	public String getCodeNameFileName() {
		return codeNameFileName;
	}


	public void setCodeNameFileName(String codeNameFileName) {
		this.codeNameFileName = codeNameFileName;
	}


	public String[] getTreasureHeight() {
		return treasureHeight;
	}


	public void setTreasureHeight(String[] treasureHeight) {
		this.treasureHeight = treasureHeight;
	}


	public String[] getTreasureWidth() {
		return treasureWidth;
	}


	public void setTreasureWidth(String[] treasureWidth) {
		this.treasureWidth = treasureWidth;
	}


	


				
}
