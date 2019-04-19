<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript">


    function busSubmit(){


    	
        //获取设备号
        var deviceIds=document.getElementById("deviceId").value;
        
        //获取到站时间
        var arrivalTimes=document.getElementById("arrivalTime").value;

        //获取车辆号码
        var lineNames=document.getElementById("lineName").value;


        var deviceIdsList=deviceIds.split(",");

        var arrivalTimesList=arrivalTimes.split(",");

        var lineNamesList=lineNames.split(","); 



        var busInfosObjectList= new Array();
        
        for(var i=0;i<deviceIdsList.length;i++){
        	 
        	var busInfosObject = new Object();

            busInfosObject.deviceId=deviceIdsList[i];

            busInfosObject.arrivalTime=arrivalTimesList[i];

            busInfosObject.lineName=lineNamesList[i];

            busInfosObjectList[i]=busInfosObject;
        }


        
        
        
        
        
        var json = JSON.stringify(busInfosObjectList);
        alert(json); 
        document.form.target = "_self";
    	document.form.action = 'busStopDataInteract.vs?busInfos='+json; 
    	document.form.submit();   
    
    }




</script>

</head> 
<body>
   <form  name="form" method="post" action="busStopDataInteract.vs">
   
           
      deviceId; // 设备号
      <input  type="text"  id="deviceId" />
      <br />
	  
	  arrivalTime; //到站时间
	  <input  type="text"  id="arrivalTime" />
	  <br />	  
	  
	  lineName;  //(车辆号码)
	  <input  type="text"  id="lineName" />
	  <br />
	  
	  
	  <input type="button"  onclick="busSubmit()"  value="提交"/>
	  
	  
       
   </form>
</body>
</html>
