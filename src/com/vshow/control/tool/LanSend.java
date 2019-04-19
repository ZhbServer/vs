package com.vshow.control.tool;


import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;


public class LanSend {
	
   
	public static  String BROADCAST_IP="255.255.255.255";
	public static  int BROADCAST_PORT=2333;
	
	public static void sendIpMsg(String ip){
		
		String message = "ip,"+ip.trim();//用于发送的字符串
		System.out.println("发送广播:"+message);
		try {
			InetAddress address = InetAddress.getByName(BROADCAST_IP);
	        DatagramPacket packet = new DatagramPacket(message.getBytes(),message.length(), address, BROADCAST_PORT);
	        DatagramSocket socket = new DatagramSocket();
	        socket.send(packet);
	        socket.close();
		 } catch (Exception e) {
		 }
	      
	}
   
}
