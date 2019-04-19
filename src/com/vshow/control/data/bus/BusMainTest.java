package com.vshow.control.data.bus;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class BusMainTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		BusDevice bd= new BusDevice();
		bd.setDeviceId("A1");
		
	    List<BusData> busDatas = new ArrayList<BusData>();
	    
	    
	    BusData bdata=new BusData();
	    bdata.setArrivalTime("5");
	    bdata.setVehiclesNum("粤B11111");
	    
	    
	    BusData bdata2=new BusData();
	    bdata2.setArrivalTime("15");
	    bdata2.setVehiclesNum("粤B2222");
	    
	    busDatas.add(bdata);
	    busDatas.add(bdata2);
	    
	   
	    
	    
	    
	    
	    
	    BusDevice bd2= new BusDevice();
		bd2.setDeviceId("B1");
		
	    List<BusData> busDatas2 = new ArrayList<BusData>();
	    
	    
	    BusData bdata3=new BusData();
	    bdata3.setArrivalTime("5");
	    bdata3.setVehiclesNum("粤B3333");
	    
	    
	    BusData bdata4=new BusData();
	    bdata4.setArrivalTime("15");
	    bdata4.setVehiclesNum("粤B4444");
	    
	    busDatas2.add(bdata3);
	    busDatas2.add(bdata4);
	    
	    List<BusDevice> bsDevices = new ArrayList<BusDevice>();
	    
	    bsDevices.add(bd);
	    
	    bsDevices.add(bd2);
	    
	   
	    //打印json
		JSONArray jsonArray = JSONArray.fromObject(bsDevices);
		System.out.println(jsonArray.toString());
	    
	    
	}

}
