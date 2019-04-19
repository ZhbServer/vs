package com.vshow.control.item.fb;

import io.netty.channel.ChannelHandlerContext;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionContext;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.DpSend;
import com.vshow.control.data.InsertSend;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Send;
import com.vshow.control.data.SendDate;
import com.vshow.control.data.SendInteract;
import com.vshow.control.data.SendTime;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.MD5Util;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.NettyChannel;
import com.vshow.control.tool.NettyChannelUtil;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.VSNettyChannelMap;

public class ClearDownloadAction implements Action {

	
	private String qx[];
	
	
    @Override
	public String execute() throws Exception {
		
        for (int i = 0; i < qx.length; i++) {
        	
        	Constant.downloadQueue.remove(qx[i]);
        	
	    }
			
		return SUCCESS;
		
	}


	public String[] getQx() {
		return qx;
	}


	public void setQx(String[] qx) {
		this.qx = qx;
	}
	
	
	


}
