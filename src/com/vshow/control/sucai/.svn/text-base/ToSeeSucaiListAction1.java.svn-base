package com.vshow.control.sucai;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.data.Pages;
import com.vshow.control.data.ScGroup;
import com.vshow.control.data.ScGroupRelation;
import com.vshow.control.data.Sucai;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.SqlConnect;

public class ToSeeSucaiListAction1 implements Action {

	private List<Sucai> listsc; // 素材集合

	private int id; // 当前页数
	private int total; // 数据总个数
	private int totalpage; // 总页数
	private int qian; // 上一页
	private int hou; // 下一页
	private String ser; // 查询条件
	private int sel = 0; // 查询编号 (0全部,1文件名,用户名)
	private Pages ps; // 分页
	private Integer pagetype; // 页码类型(10,20,30)

	private Sucai sucai;
	private ScGroupRelation gssi; // 分组

	private int showtype = 1; // 显示方式(1.列表 2.视图)
	private int isSelf;

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();

		int uid = (Integer) session.get("urid");
		String tkey = (String) session.get("urtkey");

		// 分页类型存入session
		if (pagetype == null) {

			// 查看session是否有分页类型 null择默认10条显示
			Integer publicPagetype = (Integer) session.get("publicPagetype");
			if (publicPagetype == null) {
				session.put("publicPagetype", 10);
				pagetype = 10;
			} else {
				pagetype = publicPagetype;
			}
		} else {
			session.put("publicPagetype", pagetype);
		}

		// 查看分组
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
			
			Object obj = SqlConnect.getSqlMapInstance().queryForObject("sc_group_uid", gssi.getSucaigroupid());
			
			if (obj != null) {
				int gsuid = (Integer) obj;
				session.put("gsuid", gsuid);
			} else {
				sucai.setGpid(0);
			}

		} else {
			session.remove("gsuid");
		}

		// 查询当前用户，下级用户的素材
		sucai.setTkey(tkey);
		sucai.setUrid(uid);
		// 起始页,页码类型,分组id
		// 当前页码
		if (id <= 0) {
			id = 1;
		}
		
		if(ser != null){
			ser = URLDecoder.decode(ser,"UTF-8");
		}

		// 获取查询条件总个数
		if (sel == 0) {
			if (gssi.getSucaigroupid() == -1) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_scshare_page_count", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_sc_page_count_self", sucai);
			} else {
				if (gssi.getSucaigroupid() == 0) {
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_sc_page_count_all", sucai);
				} else {
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_sc_page_count_other", sucai);
				}
			}
		} else if (sel == 1) {
			sucai.setName(ser);
			if (gssi.getSucaigroupid() == -1) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_scshare_name_page_count", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_page_count_self", sucai);
			} else {
				if (gssi.getSucaigroupid() == 0) {
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_page_count_all", sucai);
				} else {
					total = (Integer) SqlConnect.getSqlMapInstance().queryForObject("sel_sc_name_page_count_other",sucai);
				}
			}
		} else if (sel == 2) {
			sucai.setUser(ser);
			if (gssi.getSucaigroupid() == -1) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_scshare_user_page_count", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				total = (Integer) SqlConnect.getSqlMapInstance()
						.queryForObject("sel_sc_user_page_count_self", sucai);
			} else {
				if (gssi.getSucaigroupid() == 0) {
					total = (Integer) SqlConnect
							.getSqlMapInstance()
							.queryForObject("sel_sc_user_page_count_all", sucai);
				} else {
					total = (Integer) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_sc_user_page_count_other",
									sucai);
				}
			}
		}

		// 获取到 总个数 如果分页类型为-1表示全部 把total总个数 赋值给pagetype
		if (pagetype == -1) {
			pagetype = total;
		}

		sucai.setStartid((id - 1) * pagetype);
		sucai.setPagetype(pagetype);

		if (sel == 0) {
			if (gssi.getSucaigroupid() == -1) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_scshare_page", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_sc_page_self", sucai);
			} else {
				
				if (gssi.getSucaigroupid() == 0) {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_page_all", sucai);
				} else {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_page_other", sucai);
				}
				
			}
		} else if (sel == 1) {
			sucai.setName(ser);
			if (gssi.getSucaigroupid() == -1) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_scshare_name_page", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_sc_name_page_self", sucai);
			} else {
				if (gssi.getSucaigroupid() == 0) {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_name_page_all", sucai);
				} else {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_name_page_other", sucai);
				}
			}
		} else if (sel == 2) {
			sucai.setUser(ser);
			if (gssi.getSucaigroupid() == -1) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_scshare_user_page", sucai);
			} else if (gssi.getSucaigroupid() == -2) {
				listsc = SqlConnect.getSqlMapInstance().queryForList(
						"sel_sc_user_page_self", sucai);
			} else {
				if (gssi.getSucaigroupid() == 0) {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_user_page_all", sucai);
				} else {
					listsc = SqlConnect.getSqlMapInstance().queryForList(
							"sel_sc_user_page_other", sucai);
				}
			}
		}
		Constant.subStringSucaiName(listsc);
		Constant.subStringSucaiList(listsc);
		for (Sucai tempsucai : listsc) {
			tempsucai.setPagetype(pagetype);
			if (sucai.getType() == 3) {
				tempsucai.setVideo_img(tempsucai.getFilename().substring(0,
						tempsucai.getFilename().lastIndexOf('.'))
						+ "_.jpg");
			}
		}

		if (pagetype == 0) {
		} else {
			if (total % pagetype > 0) {
				totalpage = total / pagetype + 1;
			} else {
				totalpage = total / pagetype;
			}

		}

		qian = id - 1;
		hou = id + 1;
		if (hou >= totalpage) {
			hou = totalpage;
		}

		ps = Constant.getPages(totalpage, id);

		ScGroup gp = new ScGroup();
		gp.setType(sucai.getType());
		gp.setId(gssi.getSucaigroupid());
		gp.setUserid(uid);
		if(gssi.getSucaigroupid()==0 || gssi.getSucaigroupid()==-2){
			isSelf = 1;
		}else{
			if(gssi.getSucaigroupid()==-1){
				isSelf = 0;
			}else{
				isSelf = (Integer)SqlConnect.getSqlMapInstance().queryForObject("sel_scgroup_id_uid", gp);
			}
		}
		

		// 返回页面[type: 1 背景 2音频 3视频 4图片 5FLASH 6PPT 7Word 8Excel 9PDF 10文本]
		String return_v = "";
		if (showtype == 1) {
			return_v = "SUCCESS_LIST";
		} else if (showtype == 2) {
			return_v = "SUCCESS_VIEW";
		}
		return return_v;
	}

	public List getListsc() {
		return listsc;
	}

	public void setListsc(List listsc) {
		this.listsc = listsc;
	}

	public int getId() {
		return id;
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

	public int getPagetype() {
		return pagetype;
	}

	public void setPagetype(int pagetype) {
		this.pagetype = pagetype;
	}

	public ScGroupRelation getGssi() {
		return gssi;
	}

	public void setGssi(ScGroupRelation gssi) {
		this.gssi = gssi;
	}

	public int getShowtype() {
		return showtype;
	}

	public void setShowtype(int showtype) {
		this.showtype = showtype;
	}

	public int getIsSelf() {
		return isSelf;
	}

	public void setIsSelf(int isSelf) {
		this.isSelf = isSelf;
	}

}
