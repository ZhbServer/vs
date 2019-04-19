package com.vshow.control.tool;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class MainServer extends Thread {

	private static final long serialVersionUID = 1L;

	

	public void run() {
		try {
			new VSEchoServer(VCommon.port2).do_startServer();
			//serverSocket = new ServerSocket(VCommon.port2);
		} catch (Exception e) {
			
		}
	
	}
	

}