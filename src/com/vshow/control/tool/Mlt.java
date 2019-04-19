package com.vshow.control.tool;



import io.netty.channel.ChannelHandlerContext;

import java.util.Vector;



public class Mlt {
	public Vector<MyMsg> allmsg;
	
	public Vector<MyMsg> allmsgBuss;
	
	public String ip = "";
	public String downstate="";
	public String last="";
	public String sendkey="";
	public int playtime;
	public String playname="";
	public ChannelHandlerContext ctx;

	public Mlt() {
		allmsg = new Vector<MyMsg>();
		
		allmsgBuss=new Vector<MyMsg>();
	}
	
}
