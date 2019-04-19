package com.vshow.control.jiankong;



import java.util.Map;




import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Client;
import com.vshow.control.data.JianKong;

import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;

import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;

import com.vshow.control.tool.SqlConnect;

public class SeeBatchAction extends ActionSupport {
	
	
	private int qx[];
	
	private float show=0.8f;   //缩放比 

	public String execute() throws Exception {
		
		ActionContext ctx = ActionContext.getContext();
		
		Map session = ctx.getSession();
		
		int uid = (Integer) session.get("urid");
		
		Client cl;
	
		String filename;
		String currentData=DateUtil.getTime();
		//生成sendkey 
		String sendkey=Constant.createSendkey(uid, currentData);
		
		for (int i = 0; i < qx.length; i++) {
			
			 cl = (Client) SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", qx[i]);
			
		     filename = Long.toString(System.currentTimeMillis())+i+ ".png";
			
		     String msg = "";
		     if(show==0.8f){
		    	msg = "03+" + filename;
		     }else{
		    	msg = "03+" + filename+"%"+show; 
		     }
			 
			 MyMsg mymsg;
				
			 // 发送给终端
			if (cl.getServerid() == 0) {
				
					Mlt mt = Constant.messageMap.get(cl.getMark());
					
					if (mt != null) {
						
						mymsg = new MyMsg();
						
						mymsg.msg = msg;
						
						mymsg.sendkey = "";
						
						mt.allmsg.add(mymsg);
						
					}
					
			 }
			
			//存入数据库
			JianKong jk=new JianKong();
			jk.setCdate(currentData);
			jk.setFilename(filename);
			jk.setMark(cl.getMark());
			jk.setUid(uid);
			jk.setSendkey(sendkey);
			SqlConnect.getSqlMapInstance().insert("add_jk", jk);
			
				
		}
		
		session.put("url", "onclient.vs");
		
		return SUCCESS;
	}

	public int[] getQx() {
		return qx;
	}

	public void setQx(int[] qx) {
		this.qx = qx;
	}

	public float getShow() {
		return show;
	}

	public void setShow(float show) {
		this.show = show;
	}
	
	

	
}
