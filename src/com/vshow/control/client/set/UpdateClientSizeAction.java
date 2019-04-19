package com.vshow.control.client.set;



import java.text.DecimalFormat;

import java.util.Map;



import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;

import com.vshow.control.data.Client;

import com.vshow.control.tool.Constant;


import com.vshow.control.tool.SqlConnect;

public class UpdateClientSizeAction implements Action  {

	private String size;
	private String mark;
    private int  token=0;



	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
	
	
		
		
		//System.out.println(size);
		if (null != size && !"".equals(size)) {
			String sizes[] = size.split("\\/");
			if (sizes.length <= 5) {
				DecimalFormat dcmFmt = new DecimalFormat("0.00");
				float size1 = (float) (Long.parseLong(sizes[0])) / 1024 / 1024;
				float size2 = (float) (Long.parseLong(sizes[1])) / 1024 / 1024;
				String day = "";
				String days="";
				String oftype="";
				StringBuffer string;
				if (sizes.length == 5) {
									
					if(token==1){
						//获取多轮开关机
						String kjss[]=sizes[4].split("\\^");
						for (int i = 0; i < kjss.length; i++) {
							String[] kjs = kjss[i].split("\\_");
							if (kjs.length == 3) {
								day = "";
								
								string=new StringBuffer();
							
								if ((Integer.parseInt(kjs[0]) & Constant.WEEK_ALL) == Constant.WEEK_ALL) {
									string.append(Constant.LOCAL.getA00483());
								}else{
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK1) == Constant.WEEK1) {
										
										string.append(Constant.LOCAL.getA00475());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK2) == Constant.WEEK2) {
										string.append(Constant.LOCAL.getA00476());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK3) == Constant.WEEK3) {
										string.append(Constant.LOCAL.getA00478());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK4) == Constant.WEEK4) {
										string.append(Constant.LOCAL.getA00479());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK5) == Constant.WEEK5) {
										string.append(Constant.LOCAL.getA00480());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK6) == Constant.WEEK6) {
										string.append(Constant.LOCAL.getA00481());
									}
									if ((Integer.parseInt(kjs[0]) & Constant.WEEK7) == Constant.WEEK7) {
										string.append(Constant.LOCAL.getA00482());
									}
								}

								if(Integer.parseInt(kjs[1])==0){
									oftype=Constant.LOCAL.getA00485();
								}else{
									oftype=Constant.LOCAL.getA00484();
								}
								
								
								if(days.length()==0){
									days = string + "_" + oftype +"_"+kjs[2];
								}else{
									days = days+"|"+string + "_" + oftype +"_"+kjs[2];
								}
								
							}
						}
						
						
					}else{
							//获取多轮开关机
							String kjss[]=sizes[4].split("\\@");
							
							for (int i = 0; i < kjss.length; i++) {
								String[] kjs = kjss[i].split("\\_");
								if (kjs.length == 3) {
									day = "";
									if (Integer.parseInt(kjs[0]) == 8) {
										day = Constant.LOCAL.getA00483();
									} else if (Integer.parseInt(kjs[0]) == 1) {
										day = Constant.LOCAL.getA00475();
									} else if (Integer.parseInt(kjs[0]) == 2) {
										day = Constant.LOCAL.getA00476();
									} else if (Integer.parseInt(kjs[0]) == 3) {
										day = Constant.LOCAL.getA00478();
									} else if (Integer.parseInt(kjs[0]) == 4) {
										day = Constant.LOCAL.getA00479();
									} else if (Integer.parseInt(kjs[0]) == 5) {
										day = Constant.LOCAL.getA00480();
									} else if (Integer.parseInt(kjs[0]) == 6) {
										day = Constant.LOCAL.getA00481();
									} else if (Integer.parseInt(kjs[0]) == 7) {
										day = Constant.LOCAL.getA00482();
									}
									if(days.length()==0){
										days = day + "_" + kjs[1] +"_"+kjs[2];
									}else{
										days = days+"|"+day + "_" + kjs[1] +"_"+kjs[2];
									}
									
								}
							}
					
					
				   }
				

				}
				if ("".equals(days)) {
					size = dcmFmt.format(size1) + "/" + dcmFmt.format(size2)
							+ "/" + sizes[2] + "/" + sizes[3];
				}else{
					size = dcmFmt.format(size1) + "/" + dcmFmt.format(size2)
					+ "/" + sizes[2] + "/" + sizes[3]+"/"+days;
				}
				Client client = new Client();
				client.setMark(mark);
				client.setSize(size);
				SqlConnect.getSqlMapInstance().update("update_client_size",
						client);
				
				Constant.clientInfoMap.remove(mark);
			}
		}

		return SUCCESS;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}
	
	public int getToken() {
		return token;
	}

	public void setToken(int token) {
		this.token = token;
	}
}
