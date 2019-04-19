package com.vshow.control.item;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.data.program.ProgramComplexMediaManager;
import com.vshow.control.data.program.ProgramImageGroup;
import com.vshow.control.data.program.TouchInteractive;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class ToItemSeeSucaiAction implements Action {

	private List<Sucai> listsc; // 素材集合

	private List listsfgp; // 分组集合（自己）
	private List listfagp; // 分组集合(父辈)

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel=0; // 查询编号     (0全部,1文件名,用户名) 
	private Pages ps;     //分页
    private int pagetype=10;  //页码类型(10,20,30)
	
    private Sucai sucai;
	private ScGroupRelation gssi; // 分组

	private int xy_x=0;
	private int xy_y=0;

	
	private List listdefaultgp; // 分组集合（默认）
	
	private String filenames; // 获取已选素材id
	private List yxsclist; // 已选素材集合
	private float sf; // 缩放
	private String title;
	private int width;
	private int height;
	private int tx = 6; // 特效
	

	private int time;
	private int qie;
	private int type; // 素材是图片 还是图片加视频(1:表示图片加视频 2:表示流媒体)
	private String mfile;
	private String url;
	private String interacturl;

	private String uids;
	private String tids;
	private String sdate;
	private String edate;

	private String bl;
	private int volof=1; //视频 音量 开关   0.关     1.开

    private String appb;  //包名

	private String mtype; //视频类型 (1视频 2流媒体 3AV数据源 4实时显示)
	private String surl;  //流媒体地址

	
    private int fonttype=0;     //字体类型
    private int txtfontsize=36;  //字体大小
    private String lineH;        //字距
    private String gdtype;       //滚动方式
    private String gdspeed;      //滚动速度 
    private String fbackcolor="0";    //背景颜色
    private String txtfontcolor="000000";    //字体颜色  
    private String divHtml="";      //内容

	private String fonttypeStr="";
	
	private int fbold=0;
	private int fitallic=0;
	private int fsetline=0;
	private int fsetstrike=0;
	
	private String initSucaiListJson="";  //素材初始化数据
	private String yxSucaiListJson="";    //已选素材数据

	private int checkAjaxState=0; //(是否是ajax请求 0不是  1是)
	
	private String bgname="";
	private String bgnameUrl="";
	
	
	private int textDataSource=0; //数据来源
	
	private int advancedType=0;   //设置字体大小模式  0普通  1高级
	
	private List listsfgpimg; // 分组集合（图片）
	
    private int editType=0;  //弹出框 编辑类型  2图片组 
   
    private String yMb;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		if (id <= 0) {
			id = 1;
		}

		
		//查看分组
		if (gssi == null) {
			gssi = new ScGroupRelation();
			gssi.setSucaigroupid((Integer) session.get("gsid"));
			sucai.setGpid((Integer) session.get("gsid"));
		} else {
			sucai.setGpid(gssi.getSucaigroupid());
			session.put("gsid", gssi.getSucaigroupid());
			gssi.setSucaigroupid((Integer) session.get("gsid"));
		}
		
		
		if (gssi.getSucaigroupid() > 0) {
			Object obj = SqlConnect.getSqlMapInstance().queryForObject(
					"sc_group_uid", gssi.getSucaigroupid());
			if (obj != null) {
				int gsuid = (Integer) obj;
				session.put("gsuid", gsuid);
			} else {
				sucai.setGpid(0);
			}

		} else {
			session.remove("gsuid");
		}


		//查询当前用户，下级用户的素材
		sucai.setTkey(tkey);
		//起始页,页码类型,分组id
	    //当前页码
		if (id <= 0) {
	    	id = 1;
		}
		
		//获取查询条件总个数
		if(sel==0){
			if(gssi.getSucaigroupid() == -1){
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_scshare_page_count", sucai);
			}else{
				if(gssi.getSucaigroupid() == 0){
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_page_count_all", sucai);
				}else{
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_page_count_other", sucai);
				}
			}
		}else if(sel==1){
			sucai.setName(ser);
			if(gssi.getSucaigroupid() == -1){
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_scshare_name_page_count", sucai);
			}else{
				if(gssi.getSucaigroupid() == 0){
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_page_count_all", sucai);
				}else{
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_page_count_other", sucai);
				}
			}
		}
		
		
		//全部素材
        sucai.setStartid(0);
		sucai.setPagetype(total);
		
		if(sel==0){
			if(gssi.getSucaigroupid() == -1){
				listsc=SqlConnect.getSqlMapInstance().queryForList("sel_scshare_page", sucai);
			}else{
				if(gssi.getSucaigroupid() == 0){
					listsc=SqlConnect.getSqlMapInstance().queryForList("sel_sc_page_all", sucai);
				}else{
					listsc=SqlConnect.getSqlMapInstance().queryForList("sel_sc_page_other", sucai);
				}
			}
		}else if(sel==1){
			sucai.setName(ser);
			if(gssi.getSucaigroupid() == -1){
				listsc=SqlConnect.getSqlMapInstance().queryForList("sel_scshare_name_page", sucai);
			}else{
				if(gssi.getSucaigroupid() == 0){
					listsc=SqlConnect.getSqlMapInstance().queryForList("sel_sc_name_page_all", sucai);
				}else{
					listsc=SqlConnect.getSqlMapInstance().queryForList("sel_sc_name_page_other", sucai);
				}
			}
		}
		
		for (Sucai tempsucai :listsc ) {
			tempsucai.setPagetype(pagetype);
			if(sucai.getType()==3){
				tempsucai.setVideo_img(tempsucai.getFilename().substring(0, tempsucai.getFilename().lastIndexOf('.')) + "_.jpg");
			}
			if(tempsucai.getTxt_content()!=null){
				tempsucai.setTxt_content(tempsucai.getTxt_content().replaceAll("\r\n", "<br>"));
			}
			
		}
		//subStringList(listsc);
		
		//初始化数据源转换json
		JSONArray jsonArr = JSONArray.fromObject(listsc);
		
		initSucaiListJson=jsonArr.toString();
		

		if(!yxSucaiListJson.equals("null")){
			//播放列表数据源
			if(!yxSucaiListJson.equals("")){
				
				if(editType==2){
					ProgramImageGroup pcmms=(ProgramImageGroup)JSONObject.toBean(JSONObject.fromObject(yxSucaiListJson), ProgramImageGroup.class);
					
					jsonArr = JSONArray.fromObject(pcmms);
				}else{
					ProgramComplexMediaManager pcmms=(ProgramComplexMediaManager)JSONObject.toBean(JSONObject.fromObject(yxSucaiListJson), ProgramComplexMediaManager.class);
					
					jsonArr = JSONArray.fromObject(pcmms.getmMediaList());
				}
				
				
				
				yxSucaiListJson=jsonArr.toString();
				
				
				
			}
			
			
		}
		
		
		
		ScGroup gp = new ScGroup();
		gp.setType(sucai.getType());
		gp.setTkey(tkey);
		gp.setUserid(uid);
		
		//获取分组(自己，下级)
		listsfgp = SqlConnect.getSqlMapInstance().queryForList("sc_self_group_all", gp);
		
		
		if(sucai.getType()==3){
			//获取分组图片
			gp.setType(4);
			listsfgpimg = SqlConnect.getSqlMapInstance().queryForList("sc_self_group_all", gp);
		}
		
		
        // 获取分组(默认系统预置)
		
		listdefaultgp= SqlConnect.getSqlMapInstance().queryForList("sc_self_group_default", gp);
		
		

		if (filenames != null) {
			if (!"".equals(filenames)) {
				filenames = filenames.trim();
				List list = new ArrayList();
				String[] sids = filenames.split("\\|");
				Pattern pattern = Pattern.compile("[0-9]*");
				Matcher isNum = pattern.matcher(sids[0]);
				if (!isNum.matches()) {
					for (int i = 0; i < sids.length; i++) {

						Sucai s = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_filename", sids[i]);
						list.add(s);
					}
				} else {
					for (int i = 0; i < sids.length; i++) {

						Sucai s = (Sucai) SqlConnect.getSqlMapInstance().queryForObject("get_sc_all_id",Integer.parseInt((sids[i])));
						list.add(s);
					}
				}

				subStringList(list);
				yxsclist = list;
			}
		}
		if (title != null) {
			if (!"".equals(title)) {
				title = title.trim();
				List list = new ArrayList();
				if (sucai.getType() == 4 && type == 0) {
					tx = Integer.parseInt(title.split("\\|")[0]);
					time = Integer.parseInt(title.split("\\|")[1]);

					String[] sids = title.split("\\|");
					for (int i = 2; i < sids.length; i++) {

						Sucai s = (Sucai) SqlConnect.getSqlMapInstance()
								.queryForObject("sel_sc_filename", sids[i]);
						if (s != null) {
							list.add(s);
						}

					}
				} else if (sucai.getType() == 4 || sucai.getType() == 3) {
					title = title.trim();
					String titles[] = title.split("\\*");
					if (titles.length > 1) {
						String[] sids = titles[0].split("\\|");

						if (type == 1) {
							qie = Integer.parseInt(sids[0].substring(1));
							for (int i = 1; i < sids.length; i++) {

								Sucai s = (Sucai) SqlConnect
										.getSqlMapInstance().queryForObject(
												"sel_sc_filename", sids[i]);
								if (s != null) {
									list.add(s);
								}
							}
						} else if (type == 2) {
							qie = Integer.parseInt(sids[0].substring(1));
							url = sids[1];
						}
					}
				}
				subStringList(list);
				yxsclist = list;
			}

		}
		
		
		if(fonttypeStr.length()>0){
			if(fonttypeStr.equals(Constant.LOCAL.getA00377())){
				fonttype=0;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00374())){
				fonttype=1;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00379())){
				fonttype=2;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00380())){
				fonttype=3;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00381())){
				fonttype=4;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00375())){
				fonttype=5;
			}else if(fonttypeStr.equals(Constant.LOCAL.getA00378())){
				fonttype=6;
			}
		}
		
		if(divHtml.length()>0){
			//System.out.println(divHtml);
			divHtml=java.net.URLDecoder.decode(divHtml,"utf-8");
			divHtml=divHtml.replaceAll("6682", "<br>");
			//System.out.println(divHtml);
			
		}
	
		if(txtfontcolor!=null&&txtfontcolor.length()>0){
			txtfontcolor=txtfontcolor.replaceAll("\\#", "");
		}
		
		if(fbackcolor!=null&&fbackcolor.length()>0){
			fbackcolor=fbackcolor.replaceAll("\\#", "");
		}
		
		if(checkAjaxState==1){
			return GsonUtil.getGson(listsc);
		}else{
			return SUCCESS;
		}
			
	}

	public int getEditType() {
		return editType;
	}

	public void setEditType(int editType) {
		this.editType = editType;
	}

	public String getYxSucaiListJson() {
		return yxSucaiListJson;
	}

	public void setYxSucaiListJson(String yxSucaiListJson) {
		this.yxSucaiListJson = yxSucaiListJson;
	}

	// 显示截取名字(素材)
	public void subStringList(List<Sucai> list) {
		for (Sucai sc : list) {
			
			int sName = sc.getName().length();
			
			if (sName >= 20) {
				sc.setNamesub(sc.getName().substring(0, 19) + "...");
			} else {
				sc.setNamesub(sc.getName());
			}
		}
	}
	
	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getSurl() {
		return surl;
	}

	public void setSurl(String surl) {
		this.surl = surl;
	}
	// 显示截取名字(素材)
	/*public void subStringListGroup(List<Groups> list) {
		for (Groups gs : list) {
			int sName = gs.getName().length();
			if (sName >= 10) {
				gs.setNamesub(gs.getName().substring(0, 8) + "...");
			} else {
				gs.setNamesub(gs.getName());
			}
		}
	}*/

	public int getId() {
		return id;
	}

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	

	public void setGssi(ScGroupRelation gssi) {
		this.gssi = gssi;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getQian() {
		return qian;
	}

	public void setQian(int qian) {
		this.qian = qian;
	}

	public int getHou() {
		return hou;
	}

	public void setHou(int hou) {
		this.hou = hou;
	}

	public String getSer() {
		return ser;
	}

	public void setSer(String ser) {
		this.ser = ser;
	}

	public int getSel() {
		return sel;
	}

	public void setSel(int sel) {
		this.sel = sel;
	}

	public List getListsc() {
		return listsc;
	}

	

	public Sucai getSucai() {
		return sucai;
	}

	public void setSucai(Sucai sucai) {
		this.sucai = sucai;
	}

	public Pages getPs() {
		return ps;
	}

	public void setPs(Pages ps) {
		this.ps = ps;
	}

	

	public List getListsfgp() {
		return listsfgp;
	}

	public void setListsfgp(List listsfgp) {
		this.listsfgp = listsfgp;
	}

	public List getListfagp() {
		return listfagp;
	}

	public void setListfagp(List listfagp) {
		this.listfagp = listfagp;
	}

	public String getFilenames() {
		return filenames;
	}

	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}

	public List getYxsclist() {
		return yxsclist;
	}

	public void setYxsclist(List yxsclist) {
		this.yxsclist = yxsclist;
	}

	public float getSf() {
		return sf;
	}

	public void setSf(float sf) {
		this.sf = sf;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTx() {
		return tx;
	}

	public void setTx(int tx) {
		this.tx = tx;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getQie() {
		return qie;
	}

	public void setQie(int qie) {
		this.qie = qie;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public String getInteracturl() {
		return interacturl;
	}

	public void setInteracturl(String interacturl) {
		this.interacturl = interacturl;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getBl() {
		return bl;
	}

	public void setBl(String bl) {
		this.bl = bl;
	}

	public int getVolof() {
		return volof;
	}

	public void setVolof(int volof) {
		this.volof = volof;
	}
	
	public String getAppb() {
		return appb;
	}

	public void setAppb(String appb) {
		this.appb = appb;
	}
	public ScGroupRelation getGssi() {
		return gssi;
	}
	
	public int getXy_x() {
		return xy_x;
	}

	public void setXy_x(int xy_x) {
		this.xy_x = xy_x;
	}


	public int getXy_y() {
		return xy_y;
	}

	public void setXy_y(int xy_y) {
		this.xy_y = xy_y;
	}

	public void setListsc(List<Sucai> listsc) {
		this.listsc = listsc;
	}
	
	public List getListdefaultgp() {
		return listdefaultgp;
	}

	public void setListdefaultgp(List listdefaultgp) {
		this.listdefaultgp = listdefaultgp;
	}
	
	
	public int getFonttype() {
		return fonttype;
	}

	public void setFonttype(int fonttype) {
		this.fonttype = fonttype;
	}

	public int getTxtfontsize() {
		return txtfontsize;
	}

	public void setTxtfontsize(int txtfontsize) {
		this.txtfontsize = txtfontsize;
	}

	public String getLineH() {
		return lineH;
	}

	public void setLineH(String lineH) {
		this.lineH = lineH;
	}

	public String getGdtype() {
		return gdtype;
	}

	public void setGdtype(String gdtype) {
		this.gdtype = gdtype;
	}

	public String getGdspeed() {
		return gdspeed;
	}

	public void setGdspeed(String gdspeed) {
		this.gdspeed = gdspeed;
	}

	public String getFbackcolor() {
		return fbackcolor;
	}

	public void setFbackcolor(String fbackcolor) {
		this.fbackcolor = fbackcolor;
	}


	public String getTxtfontcolor() {
		return txtfontcolor;
	}

	public void setTxtfontcolor(String txtfontcolor) {
		this.txtfontcolor = txtfontcolor;
	}

	public String getDivHtml() {
		return divHtml;
	}

	public void setDivHtml(String divHtml) {
		this.divHtml = divHtml;
	}

	public String getFonttypeStr() {
		return fonttypeStr;
	}

	public void setFonttypeStr(String fonttypeStr) {
		this.fonttypeStr = fonttypeStr;
	}

	public String getInitSucaiListJson() {
		return initSucaiListJson;
	}

	public void setInitSucaiListJson(String initSucaiListJson) {
		this.initSucaiListJson = initSucaiListJson;
	}

	public int getFbold() {
		return fbold;
	}

	public void setFbold(int fbold) {
		this.fbold = fbold;
	}

	public int getFitallic() {
		return fitallic;
	}

	public void setFitallic(int fitallic) {
		this.fitallic = fitallic;
	}

	public int getFsetline() {
		return fsetline;
	}

	public void setFsetline(int fsetline) {
		this.fsetline = fsetline;
	}

	public int getFsetstrike() {
		return fsetstrike;
	}

	public void setFsetstrike(int fsetstrike) {
		this.fsetstrike = fsetstrike;
	}

	public int getCheckAjaxState() {
		return checkAjaxState;
	}

	public void setCheckAjaxState(int checkAjaxState) {
		this.checkAjaxState = checkAjaxState;
	}
	
	


	public String getBgname() {
		return bgname;
	}

	public void setBgname(String bgname) {
		this.bgname = bgname;
	}

	public String getBgnameUrl() {
		return bgnameUrl;
	}

	public void setBgnameUrl(String bgnameUrl) {
		this.bgnameUrl = bgnameUrl;
	}
	
	public int getTextDataSource() {
		return textDataSource;
	}

	public void setTextDataSource(int textDataSource) {
		this.textDataSource = textDataSource;
	}

	public int getAdvancedType() {
		return advancedType;
	}

	public void setAdvancedType(int advancedType) {
		this.advancedType = advancedType;
	
	}
	
	public String getyMb() {
		return yMb;
	}

	public void setyMb(String yMb) {
		this.yMb = yMb;
	}

	public List getListsfgpimg() {
		return listsfgpimg;
	}

	public void setListsfgpimg(List listsfgpimg) {
		this.listsfgpimg = listsfgpimg;
	}
}
