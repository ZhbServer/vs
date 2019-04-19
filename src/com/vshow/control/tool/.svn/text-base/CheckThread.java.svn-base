package com.vshow.control.tool;

public class CheckThread extends Thread {

	
	  private Thread threadZx;



	 public CheckThread(Thread thread)

	 {
	       this.threadZx = thread;

	 }
	   
	@Override
	public void run() {
		while (true) {
             
			//System.out.println(threadZx.getName()+" 存活:" +threadZx.isAlive()+" 状态:" + threadZx.getState() );
			
			
			if(threadZx.isAlive()==false){
				    
				 Listener listen = new Listener();
				 MainZxTimeStatics mainZxTimeStatics=new MainZxTimeStatics();
				// mainZxTimeStatics.addObserver(listen);
				 Thread thread=new Thread(mainZxTimeStatics); 
				 thread.start();
				 new CheckThread(thread).start();
				 break;
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
		}
	}

	public Thread getThreadZx() {
		return threadZx;
	}

	public void setThreadZx(Thread threadZx) {
		this.threadZx = threadZx;
	}
	
	
	 

}
