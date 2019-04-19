package com.vshow.control.tool;

import io.netty.channel.socket.SocketChannel;



public class VSEchoServer {
	private int port;
	public VSEchoServer(int port){
	  this.port = port;
	}
	
	public void do_startServer(){
	    //System.out.println("do_startServer");
		new Thread(){
		  @Override
		  public void run(){
			  //System.out.println("start..");
			  VSEchoServerCls esc = new VSEchoServerCls();
			  //System.out.println("start..2");
			  try{
			     esc.do_start(port);
			     //System.out.println("start..3");
			  }catch(Exception e){
				  
			  }
			  //System.out.println("end..");
		  }
		}.start();
	}
	
	public static void main(String[] args) throws InterruptedException {
		
		new VSEchoServer(8511).do_startServer();
		
		 /**while (true){
	            SocketChannel channel=(SocketChannel)NettyChannelMap.get("CA_BC_DP_AA_CC");
	            if(channel!=null){
	            	 //channel.writeAndFlush("测试发布");
	            	 System.out.println(("send channel no null"));
	                 
	            }else{
	            	 System.out.println(("send channel  null"));
	            }
	            Thread.sleep(10000);
	           
	       }
	       **/
	}

}
