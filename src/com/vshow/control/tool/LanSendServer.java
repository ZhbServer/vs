package com.vshow.control.tool;



import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.DatagramSocketImpl;
import java.net.InetAddress;

import net.sf.json.JSONObject;

public class LanSendServer extends Thread {

	private DatagramPacket udpPacket = null;
    private boolean stop = false;
    private DatagramSocket udpSocket=null;
    private int port=2333;
    private String message = "ip,"+Constant.IP;//用于发送的字符串
    
	@Override
	public void run() {
	
		byte[] data = new byte[1024];
        udpPacket = new DatagramPacket(data, data.length);
        while (!stop) {
            try {
             if (udpSocket == null)
               
                udpSocket  = new DatagramSocket(port);  
             
                Thread.sleep(100);
                
                udpSocket.receive(udpPacket);
                
                InetAddress address = udpPacket.getAddress();
                
                if (null != address ) {
                	
                    byte[] byteMsg = new byte[udpPacket.getLength()];
                    
                    System.arraycopy(data, 0, byteMsg, 0, byteMsg.length);
                    
                    String getData = new String(byteMsg, "utf-8");
                    
                    
                    try {
                    	 //转换为json
            			JSONObject jsonObject = JSONObject.fromObject(getData);
            			
            			int lanType=jsonObject.getInt("code");
            			
            			if(lanType==1){
            				DatagramPacket out = new DatagramPacket(message.getBytes(),

                            message.length(), address, port);

                            udpSocket.send(out);
            			}
					} catch (Exception e) {
						//System.out.println("接收广播数据解析错误 :"+getData);
					}
                   
                    
            		
                    
                    
                   
                    
                }
            } catch (InterruptedException e) {
            	
                e.printStackTrace();
            
            } catch (Exception e) {
                e.printStackTrace();
                close();
            }
        }
        close();
		
	}
	
	private void close() {
        if (udpSocket != null) {
            udpSocket.disconnect();
            udpSocket.close();
            udpSocket = null;
        }
    }

}
