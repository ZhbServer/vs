package com.vshow.control.tool;

public class MainPoolMsg extends Thread {

	private final static int CORE_POOL_SIZE =2;

	@Override
	public void run() {
		for (int i = 0; i < CORE_POOL_SIZE; i++) {
             new MainReCeMsgHandle("t"+i).start();
		}
		new MainZxStateMsgHandle("zx1").start();
		
	}
}
