package com.vshow.control.tool;

import java.util.Observable;
import java.util.Observer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



public class Listener implements Observer {
	
	Log logger = LogFactory.getLog(Listener.class);
	
	@Override
    public void update(Observable o, Object arg) {

        System.out.println("MainZxTimeStatics死机"+DateUtil.getTime());
        
        logger.info("MainZxTimeStatics死机");

        MainZxTimeStatics run = new MainZxTimeStatics();

        //run.addObserver(this);

        new Thread(run).start();

        System.out.println("MainZxTimeStatics重启"+DateUtil.getTime());
        
        logger.info("MainZxTimeStatics重启"+DateUtil.getTime());

    }
}
