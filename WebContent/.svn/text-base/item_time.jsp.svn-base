<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />

<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 
<base target="_self" />
<style type="text/css">
body,ul,li,p,h1,h2,input,form,h3,h4,h5,h6{
	padding:0;
	margin:0;
	list-style:none;
	font-size: 13px;
	color: #666;
}

a{text-decoration: none;}

a{color: #333;}
a:visited {color:#1581BF;}  /* 已访问的链接 */



.bigone{width:95%;height:400px;border:1px solid #eee;overflow:hidden;margin: 10px 10px;}

.bigone .titleone{width:100%;height:29px;border-bottom:1px solid #eee;}

.bigone .titleone a{ font-size:14px;line-height:29px;float:left;width:77px;height:30px;text-align:center;border-right:1px solid #eee;color:#000;}

.bigone .titleone a:hover{color:#000;text-decoration:underline;}

.bigone .con{width:100%;height:400px;}

.bigone .con .list1{width:100%;height:400px;}

.bigone .con .list2{width:100%;height:400px;}

.bigone .con .list3{width:100%;height:400px;}




</style>


<script type="text/javascript">

	//节目制作导引
	var a00309="<ww:property value='#session.local.a00309' />";
	var a00303="<ww:property value='#session.local.a00303' />";
	var a00304="<ww:property value='#session.local.a00304' />"; 
	var a00305="<ww:property value='#session.local.a00305' />";
	var a00306="<ww:property value='#session.local.a00306' />";
	var a00307="<ww:property value='#session.local.a00307' />";
	var a00308="<ww:property value='#session.local.a00308' />";
	var a00297="<ww:property value='#session.local.a00297' />";
	var a00298="<ww:property value='#session.local.a00298' />"; 
	var a00299="<ww:property value='#session.local.a00299' />";
	var a00494="<ww:property value='#session.local.a00494' />";
	var a00495="<ww:property value='#session.local.a00495' />";
	var a00106="<ww:property value='#session.local.a00106' />";
	var a00300="<ww:property value='#session.local.a00300' />";
	var a00301="<ww:property value='#session.local.a00301' />";
	var a00302="<ww:property value='#session.local.a00302' />";
	var a00093="<ww:property value='#session.local.a00093' />";
	var b00046="<ww:property value='#session.local.b00046' />";
	var a00732="<ww:property value='#session.local.a00732' />";

	$(function(){

		var tType="<ww:property value='tType' />";

        var advancedType="<ww:property value='advancedType' />";
         	   
        if(tType==1){

       	     if(advancedType==1){
      	    	     document.getElementById("txtFontSizeAdvancedCheckBox").checked=true;
      	    	     //获取字体大小
        	         var fonsize=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
        	        
          	 }else{
          		     //获取字体大小
        	         var fonsize=document.getElementById("fs1").options[document.getElementById("fs1").options.selectedIndex].value;
        	         
        	       
          		     document.getElementById("txtFontSizeAdvancedCheckBox").checked=false;

             }
      	     setCheckBoxChange(); 
 
        }else{

       	    if(advancedType==1){
  	    	     document.getElementById("txtFontSizeAdvancedCheckBox2").checked=true;
  	    	     //获取字体大小
    	         var fonsize=document.getElementById("txtFontSizeAdvancedSelect2").options[document.getElementById("txtFontSizeAdvancedSelect2").options.selectedIndex].value;
    	        
      	     }else{
          	     
      		     //获取字体大小
    	         var fonsize=document.getElementById("fs2").options[document.getElementById("fs2").options.selectedIndex].value;
    	       
      		     document.getElementById("txtFontSizeAdvancedCheckBox2").checked=false;

             }

 	         setCheckBoxChange2(); 

  	       

  	         

  	        

        }
        timeShowtsType();
        timeShowtsType2();
	});
  
	

	//保存
	function gosubmit(tType)  {

		    

		   //tType 1.当前时间显示 2.正计时 3倒计时
		   
          //时间类型/计时类型@显示类型@字体大小@字体颜色@天@时@分@秒@计时时间点@x@y@w@h
          var  advancedType;
		  if(tType==1){
              //获取显示类型
              var tsType=document.getElementById("tsType").value; 

              //字体大小 
            
              var fs1;
              if($("#txtFontSizeAdvancedCheckBox").is(':checked')){

              	fs1=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
              	advancedType=1;
              }else{
                  
              	fs1=document.getElementById("fs1").options[document.getElementById("fs1").options.selectedIndex].value;
              	
              	advancedType=0;

              }

              //字体颜色 
              var fcolor1=document.getElementById("fcolor1").value;
			  //坐标 宽高
			  var xy_x = document.getElementById("xy_x1").value;
			  var xy_y = document.getElementById("xy_y1").value;   
		      var width = document.getElementById("width1").value;
			  var height = document.getElementById("height1").value;
			 
			  if(xy_x<0){
					layer.msg("<ww:property value='#session.local.a00283' />");
			        return;
			   }
			  if(xy_y<0){
					layer.msg("<ww:property value='#session.local.a00284' />");
			        return;
			  }
			  if(width<=0){
				layer.msg("<ww:property value='#session.local.a00285' />");
		        return;
			  }
			  if(height<=0)
			  {
				  layer.msg("<ww:property value='#session.local.a00286' />");
		          return;
			  } 
			  var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
			  
			  //window.parent.returnValue=""; 
			  //时间类型/计时类型@显示类型@字体大小@字体颜色@天@时@分@秒@计时时间点@x@y@w@h
		      //window.parent.returnValue="1@"+tsType+"@"+fs1+"@"+fcolor1+"@0@0@0@0@0"+"@"+xy_x+"@"+xy_y+"@"+width+"@"+height; 

              var programTime=new Object();
              programTime.tType=1;
              programTime.tsType=tsType;
              programTime.fs=fs1;
              programTime.fcolor=fcolor1;
              programTime.ttDa=0;   //计时显示  天	(0不显示 1显示)
              programTime.ttHo=0;   //计时显示  时	(0不显示 1显示)
              programTime.ttMi=0;   //计时显示  分	(0不显示 1显示)
              programTime.ttSs=0;             //计时显示  秒	(0不显示 1显示)
              programTime.ttTimePoint="0";   // 计时时间点  yyyy-MM-dd HH:mm:ss
              programTime.advancedType=advancedType;  //字体大小 高级选项  1 高级
              programTime.unitShow=1;

              var json = JSON.stringify(programTime);

              window.parent.returnValue=json;

    		  window.parent.layer.close(index);
			  
		  }else if(tType==2){

			  //获取计时类型
              var tKtype=document.getElementById("tKtype").value; 
              
			  //字体大小 
              var fs2;
              if($("#txtFontSizeAdvancedCheckBox2").is(':checked')){

              	fs2=document.getElementById("txtFontSizeAdvancedSelect2").options[document.getElementById("txtFontSizeAdvancedSelect2").options.selectedIndex].value;
              	advancedType=1;
              }else{
                  
              	fs2=document.getElementById("fs2").options[document.getElementById("fs2").options.selectedIndex].value;
              	advancedType=0
              }

              
              
              //字体颜色 
              var fcolor2=document.getElementById("fcolor2").value;


              
              //获取计算时间点
              var ttTimePoint=document.getElementById("ttTimePoint").value;



              //计时显示  天	(0不显示 1显示)
              var ttDa="0";
              var obj = document.getElementsByName("ttDa");
              var check_val = "";
              for(k in obj){
                  if(obj[k].checked)
                	  ttDa=obj[k].value;
              }
             
              
              //计时显示  时	(0不显示 1显示)
              var ttHo="0";
              obj = document.getElementsByName("ttHo");
              check_val = "";
              for(k in obj){
                  if(obj[k].checked)
                	  ttHo=obj[k].value;
              }
              
              
              //计时显示  分	(0不显示 1显示)
              var ttMi="0";
              obj = document.getElementsByName("ttMi");
              check_val = "";
              for(k in obj){
                  if(obj[k].checked)
                	  ttMi=obj[k].value;
              }
              

              //计时显示  秒	(0不显示 1显示)
              var ttSs="0";

              obj = document.getElementsByName("ttSs");
              check_val = "";
              for(k in obj){
                  if(obj[k].checked)
                	  ttSs=obj[k].value;
              }
              

              //获取显示样式
              var unitShow =$("input[name='unitShow']:checked").val();

             
              
          
              //坐标 宽高
			  var xy_x = document.getElementById("xy_x2").value;
			  var xy_y = document.getElementById("xy_y2").value;   
		      var width = document.getElementById("width2").value;
			  var height = document.getElementById("height2").value;
			 
			  if(xy_x<0){
					layer.msg("<ww:property value='#session.local.a00283' />");
			        return;
			   }
			  if(xy_y<0){
					layer.msg("<ww:property value='#session.local.a00284' />");
			        return;
			  }
			  if(width<=0){
				layer.msg("<ww:property value='#session.local.a00285' />");
		        return;
			  }
			  if(height<=0)
			  {
				  layer.msg("<ww:property value='#session.local.a00286' />");
		          return;
			  }
			  var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
			  window.parent.returnValue="";
			   
			  //时间类型/计时类型@显示类型@字体大小@字体颜色@天@时@分@秒@计时时间点@x@y@w@h
		      //window.parent.returnValue=tKtype+"@0@"+fs2+"@"+fcolor2+"@"+ttDa+"@"+ttHo+"@"+ttMi+"@"+ttSs+"@"+ttTimePoint+"@"+xy_x+"@"+xy_y+"@"+width+"@"+height; 

		      var programTime=new Object();
              programTime.tType=tKtype;
              programTime.tsType=0;
              programTime.fs=fs2;
              programTime.fcolor=fcolor2;
              programTime.ttDa=ttDa;   //计时显示  天	(0不显示 1显示)
              programTime.ttHo=ttHo;   //计时显示  时	(0不显示 1显示)
              programTime.ttMi=ttMi;   //计时显示  分	(0不显示 1显示)
              programTime.ttSs=ttSs;    //计时显示  秒	(0不显示 1显示)
              programTime.ttTimePoint=ttTimePoint;   // 计时时间点  yyyy-MM-dd HH:mm:ss
              programTime.unitShow=unitShow;

              programTime.advancedType=advancedType;

              var json = JSON.stringify(programTime);
              
              window.parent.returnValue=json;

			  window.parent.layer.close(index);

	      } 
		 
		 
	}

	//获取显示样式
	function getTimeShowType(tsTypeV){
		 var now = new Date();
 		 var year = now.getFullYear();
 	
 		 var month = now.getMonth() + 1;
 		 month=month>9?month:"0"+month; //如果月份小于10,则在前面加0补充为两位数字
 		 var date = now.getDate();
 		 date=date>9?date:"0"+date;
 		 var hours = now.getHours();
 		 hours=hours>9?hours:"0"+hours;
 		 var minutes = now.getMinutes();
 		 minutes=minutes>9?minutes:"0"+minutes;
 		 var seconds = now.getSeconds();
 		 seconds=seconds>9?seconds:"0"+seconds;
         
	  	    var day = now.getDay();
     		Day = new MakeArray(7);
    		Day[0] = "<ww:property value='#session.local.a00309' />";  //星期日
    		Day[1] = "<ww:property value='#session.local.a00303' />";  //星期一
    		Day[2] = "<ww:property value='#session.local.a00304' />";  //星期二 
    		Day[3] = "<ww:property value='#session.local.a00305' />";  //星期三
    		Day[4] = "<ww:property value='#session.local.a00306' />";  //星期四
    		Day[5] = "<ww:property value='#session.local.a00307' />";  //星期五
    		Day[6] = "<ww:property value='#session.local.a00308' />";  //星期六
 		
          //显示类型
          var mytimShowType=tsTypeV;
          if(mytimShowType==1){
        	  //mytimContent="yyyy-MM-dd";
        	  mytimContent=year+"-"+month+"-"+date;
          }else if(mytimShowType==2){
        	  //mytimContent="yyyy年MM月dd日";
        	  mytimContent=year+"<ww:property value='#session.local.a00297' />"+month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />";
          }else if(mytimShowType==3){
        	  //mytimContent="MM-dd-yyyy";
        	  mytimContent=month+"-"+date+"-"+year;
          }else if(mytimShowType==4){
        	  //mytimContent="HH:mm:ss";
        	  mytimContent=hours+":"+minutes+":"+seconds;
          }else if(mytimShowType==5){
        	  //mytimContent="HH:mm";
        	  mytimContent=hours+":"+minutes;
          }else if(mytimShowType==6){
        	  //mytimContent="HH时mm分ss秒";
        	  mytimContent=hours+"<ww:property value='#session.local.a00494' />"+minutes+"<ww:property value='#session.local.a00495' />"+seconds+"<ww:property value='#session.local.a00106' />";
          }else if(mytimShowType==7){
        	  mytimContent=Day[day];
          }else if(mytimShowType==8){
        	  //mytimContent="yyyy年MM月dd日  EEEE HH:mm:ss";
        	  mytimContent=year+"<ww:property value='#session.local.a00297' />"+month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
          }else if(mytimShowType==9){
        	  //mytimContent="MM月dd日yyyy年 EEEE HH:mm:ss";
        	  mytimContent=month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />"+year+"<ww:property value='#session.local.a00297' />  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
          }else if(mytimShowType==10){
        	  //mytimContent="yyyy.MM.dd";
        	  mytimContent=year+"."+month+"."+date;
          }else if(mytimShowType==11){
        	    //mytimContent="";
        	    var enDay = new MakeArray(7);
        	    enDay[0] = "Sunday";
        	    enDay[1] = "Monday";
        	    enDay[2] = "Tuesday";
        	    enDay[3] = "Wednesday";
        	    enDay[4] = "Thursday";
        	    enDay[5] = "Friday";
        	    enDay[6] = "Saturday";
        	    mytimContent=enDay[day];
          }


        return mytimContent;
    }

	//显示样式	
	function timeShowtsType(){

		  if("<ww:property value='tType'/>==1"){

			  var timeShow=document.getElementById("timeShow");

		      //字体样式
		       
	          var tsTypeV=document.getElementById("tsType").value;
	        
	          timeShow.innerHTML=getTimeShowType(tsTypeV);

	          //字体大小 
	          var fs1;
              if($("#txtFontSizeAdvancedCheckBox").is(':checked')){

              	fs1=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
              	advancedType=1;
              }else{
                  
              	fs1=document.getElementById("fs1").options[document.getElementById("fs1").options.selectedIndex].value;
              	advancedType=0;
              }

              timeShow.style.fontSize=(fs1*"<ww:property value='sf'  />")+"px";
				
	          //字体颜色 
	          var fcolor1=document.getElementById("fcolor1").value;
	          timeShow.style.color="#"+fcolor1;

	      }
		  

    }


	function timeShowtsType2(){
		//获取计时类型
        var tKtype=document.getElementById("tKtype").value; 
        
		  //字体大小 
        var fs2;
        if($("#txtFontSizeAdvancedCheckBox2").is(':checked')){

        	fs2=document.getElementById("txtFontSizeAdvancedSelect2").options[document.getElementById("txtFontSizeAdvancedSelect2").options.selectedIndex].value;
        	
        }else{
            
        	fs2=document.getElementById("fs2").options[document.getElementById("fs2").options.selectedIndex].value;
        	
        }

        
        
        //字体颜色 
        var fcolor2=document.getElementById("fcolor2").value;


        
        //获取计算时间点
        var ttTimePoint=document.getElementById("ttTimePoint").value;



        //计时显示  天	(0不显示 1显示)
        var ttDa="0";
        var obj = document.getElementsByName("ttDa");
        var check_val = "";
        for(k in obj){
            if(obj[k].checked)
          	  ttDa=obj[k].value;
        }
       
        
        //计时显示  时	(0不显示 1显示)
        var ttHo="0";
        obj = document.getElementsByName("ttHo");
        check_val = "";
        for(k in obj){
            if(obj[k].checked)
          	  ttHo=obj[k].value;
        }
        
        
        //计时显示  分	(0不显示 1显示)
        var ttMi="0";
        obj = document.getElementsByName("ttMi");
        check_val = "";
        for(k in obj){
            if(obj[k].checked)
          	  ttMi=obj[k].value;
        }
        

        //计时显示  秒	(0不显示 1显示)
        var ttSs="0";

        obj = document.getElementsByName("ttSs");
        check_val = "";
        for(k in obj){
            if(obj[k].checked)
          	  ttSs=obj[k].value;
        }
        

        //获取显示样式
        var unitShow =$("input[name='unitShow']:checked").val();
        
  	    var timeShowContent=getTimeShowStyle(tKtype,0,ttDa,ttHo,ttMi,ttSs,unitShow);

  	    var timeShow2=document.getElementById("timeShow2");

        timeShow2.innerHTML=timeShowContent;

        timeShow2.style.fontSize=(fs2*"<ww:property value='sf'  />")+"px";
			
      
        timeShow2.style.color="#"+fcolor2;


	}

	 function  setCheckBoxChange(){

	    	if($("#txtFontSizeAdvancedCheckBox").is(':checked')){

	    		$("#txtFontSizeAdvancedSelect").show(); 
	    		
	    		$("#fs1").attr("disabled","disabled");  
	    		
	        }else{
	        	$("#fs1").removeAttr("disabled");  
	        	
	        	$("#txtFontSizeAdvancedSelect").hide(); 
	        }
	    }



	 function  setCheckBoxChange2(){

	    	if($("#txtFontSizeAdvancedCheckBox2").is(':checked')){

	    		$("#txtFontSizeAdvancedSelect2").show(); 
	    		
	    		$("#fs2").attr("disabled","disabled");  
	    		
	        }else{
	        	$("#fs2").removeAttr("disabled");  
	        	
	        	$("#txtFontSizeAdvancedSelect2").hide(); 
	        }
	  }


	  
	    

  
</script>
</head>
<body >
<form action="adtimeto.vs" method="post" name="form1" >

 <div class="panel panel-primary" style="margin: 3px 3px;">
           
    <div class="panel-heading">
             <ww:property value="#session.local.a00248"/> <!-- 时间 -->
    </div>
           
           
  <!-- 代码部分begin -->
  <div class="bigone" style="position:relative;overflow:hidden">
    <div style="position:relative;">
       <div class="titleone">
            
			<a <ww:if test="tType==1"> style="display: block;color: #fff;background-color: #1581BF;" </ww:if> style="cursor:pointer; ">
			  <ww:property value="#session.local.a00248" /><!-- 时间 -->
			</a>
			
			<a <ww:if test="tType==2||tType==3"> style="display: block;color: #fff;background-color: #1581BF;" </ww:if> style="cursor:pointer;">
			  <ww:property value="#session.local.a00727" /><!-- 计时 -->
			</a>
			
			
	   </div>
	   <div class="con">
		  <div class="listone list1"   <ww:if test="tType==1">  style="display: block;"  </ww:if><ww:else>style="display: none;" </ww:else>   >
		       <div class="container clearfix" style="margin: 10px 10px;">
		           <div class="main-wrap">
					    <div class="result-wrap">
				            <div class="result-content">
				                  <table class="insert-tab" width="100%" onclick="timeShowtsType()">
				                      <tr>
				                         
				                         <td style="overflow-x: auto;text-align: center;height: 100px;" colspan="2">
						                       <span id="timeShow"></span>
						                 </td> 
						                 
				                      </tr>
									  <tr>
									        <td style="text-align: right;" width="280"><ww:property value='#session.local.a00368' />:</td>
								            <td >
								                <select id="tsType"  style="width:250px;" >
									                 <option  <ww:if test="tsType==1"> selected="selected"  </ww:if> value="1">yyyy-MM-dd</option>
									                 <option  <ww:if test="tsType==2"> selected="selected"  </ww:if> value="2">yyyy年MM月dd日</option>
									                 <option  <ww:if test="tsType==3"> selected="selected"  </ww:if> value="3">MM-dd-yyyy</option>
									                 <option  <ww:if test="tsType==4"> selected="selected"  </ww:if> value="4">HH:mm:ss</option>
									                 <option  <ww:if test="tsType==5"> selected="selected"  </ww:if> value="5">HH:mm</option>
									                 <option  <ww:if test="tsType==6"> selected="selected"  </ww:if> value="6">HH时mm分ss秒</option>
									                 <option  <ww:if test="tsType==7"> selected="selected"  </ww:if> value="7"><ww:property value="#session.local.a00726" /></option><!-- 星期 -->
									                 <option  <ww:if test="tsType==8"> selected="selected"  </ww:if> value="8">yyyy年MM月dd日  EEEE HH:mm:ss</option>
									                 <option  <ww:if test="tsType==9"> selected="selected"  </ww:if> value="9">MM月dd日yyyy年 EEEE HH:mm:ss</option>
									                 <option  <ww:if test="tsType==10"> selected="selected"  </ww:if> value="10">yyyy.MM.dd</option> 
									                 <option  <ww:if test="tsType==11"> selected="selected"  </ww:if> value="11">星期(英文)</option>
									              
									             </select>
								            </td>
									  </tr>
									 
									 
								      <tr>
								            <!-- 字体大小 -->
								            <td style="text-align: right;"><ww:property value='#session.local.a00324' />:</td>
								            <td>
								                 <select  id="fs1" style="width:50px;" >
								               
								                    	  <option   <ww:if test='fs==24'>selected="selected"</ww:if>   value="24"><ww:property value="#session.local.b00038" /></option>
											              <option   <ww:if test='fs==36'>selected="selected"</ww:if>   value="36"><ww:property value="#session.local.b00039" /></option>
											              <option   <ww:if test='fs==48'>selected="selected"</ww:if>   value="48"><ww:property value="#session.local.b00040" /></option>
											              <option   <ww:if test='fs==60'>selected="selected"</ww:if>   value="60"><ww:property value="#session.local.b00041" /></option>
											              <option   <ww:if test='fs==72'>selected="selected"</ww:if>   value="72"><ww:property value="#session.local.b00042" /></option>
								              
								                  </select>
								                  
								                  <!-- 高级  -->
							                       &nbsp;&nbsp;
							                      <ww:property value="#session.local.b00051"/>:&nbsp; 
							                      <input type="checkbox" id="txtFontSizeAdvancedCheckBox"  onchange="setCheckBoxChange()" value="1" style="margin-top: -5px;"/>
							                      <select id="txtFontSizeAdvancedSelect"  style="width: 60px;display:none;">
							 
														  
											              <option   <ww:if test='fs==12'>selected="selected"</ww:if>   value="12">12</option>
											              <option   <ww:if test='fs==13'>selected="selected"</ww:if>   value="13">13</option>
											              <option   <ww:if test='fs==14'>selected="selected"</ww:if>   value="14">14</option>
											              <option   <ww:if test='fs==15'>selected="selected"</ww:if>   value="15">15</option>
											              <option   <ww:if test='fs==16'>selected="selected"</ww:if>   value="16">16</option>
											              <option   <ww:if test='fs==17'>selected="selected"</ww:if>   value="17">17</option>
											              <option   <ww:if test='fs==18'>selected="selected"</ww:if>   value="18">18</option>
											              <option   <ww:if test='fs==19'>selected="selected"</ww:if>   value="19">19</option>
											              <option   <ww:if test='fs==20'>selected="selected"</ww:if>   value="20">20</option>
											              <option   <ww:if test='fs==21'>selected="selected"</ww:if>   value="21">21</option>
											              <option   <ww:if test='fs==22'>selected="selected"</ww:if>   value="22">22</option>
											              <option   <ww:if test='fs==23'>selected="selected"</ww:if>   value="23">23</option>
											              <option   <ww:if test='fs==24'>selected="selected"</ww:if>   value="24">24</option>
											              <option   <ww:if test='fs==25'>selected="selected"</ww:if>   value="25">25</option>
											              <option   <ww:if test='fs==26'>selected="selected"</ww:if>   value="26">26</option>
											              <option   <ww:if test='fs==27'>selected="selected"</ww:if>   value="27">27</option>
											              <option   <ww:if test='fs==28'>selected="selected"</ww:if>   value="28">28</option>
											              <option   <ww:if test='fs==29'>selected="selected"</ww:if>   value="29">29</option>
											              <option   <ww:if test='fs==30'>selected="selected"</ww:if>   value="30">30</option>
											              <option   <ww:if test='fs==31'>selected="selected"</ww:if>   value="31">31</option>
											              <option   <ww:if test='fs==32'>selected="selected"</ww:if>    value="32">32</option>
											              <option   <ww:if test='fs==33'>selected="selected"</ww:if>   value="33">33</option>
											              <option   <ww:if test='fs==34'>selected="selected"</ww:if>   value="34">34</option>
											              <option   <ww:if test='fs==35'>selected="selected"</ww:if>   value="35">35</option>
											              <option   <ww:if test='fs==36'>selected="selected"</ww:if>   value="36">36</option>
											              <option   <ww:if test='fs==37'>selected="selected"</ww:if>   value="37">37</option>
											              <option   <ww:if test='fs==38'>selected="selected"</ww:if>   value="38">38</option>
											              <option   <ww:if test='fs==39'>selected="selected"</ww:if>   value="39">39</option>
											              <option   <ww:if test='fs==40'>selected="selected"</ww:if>   value="40">40</option>
											              <option   <ww:if test='fs==41'>selected="selected"</ww:if>   value="41">41</option>
											              <option   <ww:if test='fs==42'>selected="selected"</ww:if>   value="42">42</option>
											              <option   <ww:if test='fs==43'>selected="selected"</ww:if>   value="43">43</option>
											              <option   <ww:if test='fs==44'>selected="selected"</ww:if>   value="44">44</option>
											              <option   <ww:if test='fs==45'>selected="selected"</ww:if>   value="45">45</option>
											              <option   <ww:if test='fs==46'>selected="selected"</ww:if>   value="46">46</option>
											              <option   <ww:if test='fs==47'>selected="selected"</ww:if>   value="47">47</option>
											              <option   <ww:if test='fs==48'>selected="selected"</ww:if>   value="48">48</option>
											              <option   <ww:if test='fs==49'>selected="selected"</ww:if>   value="49">49</option>
											              <option   <ww:if test='fs==50'>selected="selected"</ww:if>   value="50">50</option>
											              <option   <ww:if test='fs==55'>selected="selected"</ww:if>   value="55">55</option>
											              <option   <ww:if test='fs==60'>selected="selected"</ww:if>   value="60">60</option>
											              <option   <ww:if test='fs==65'>selected="selected"</ww:if>   value="65">65</option>
											              <option   <ww:if test='fs==70'>selected="selected"</ww:if>   value="70">70</option>
											              <option   <ww:if test='fs==75'>selected="selected"</ww:if>   value="75">75</option>
											              <option   <ww:if test='fs==80'>selected="selected"</ww:if>   value="80">80</option>
											              <option   <ww:if test='fs==85'>selected="selected"</ww:if>   value="85">85</option>
											              <option   <ww:if test='fs==90'>selected="selected"</ww:if>   value="90">90</option>
											              <option   <ww:if test='fs==95'>selected="selected"</ww:if>   value="95">95</option>
											              <option   <ww:if test='fs==100'>selected="selected"</ww:if>  value="100">100</option>
											              <option   <ww:if test='fs==110'>selected="selected"</ww:if>  value="110">110</option>
											              <option   <ww:if test='fs==120'>selected="selected"</ww:if>  value="120">120</option>
											              <option   <ww:if test='fs==130'>selected="selected"</ww:if>  value="130">130</option>
											              <option   <ww:if test='fs==140'>selected="selected"</ww:if>  value="140">140</option>
											              <option   <ww:if test='fs==150'>selected="selected"</ww:if>  value="150">150</option>
											              <option   <ww:if test='fs==160'>selected="selected"</ww:if>  value="160">160</option>
											              <option   <ww:if test='fs==170'>selected="selected"</ww:if>  value="170">170</option>
											              <option   <ww:if test='fs==180'>selected="selected"</ww:if>  value="180">180</option>
											              <option   <ww:if test='fs==190'>selected="selected"</ww:if>  value="190">190</option>
											              <option   <ww:if test='fs==200'>selected="selected"</ww:if>  value="200">200</option>
							                      </select>  
							                   
								             </td>
								  </tr>
								 <tr>
								      <td style="text-align: right;"><ww:property value='#session.local.a00325' />:</td>
								      <td>
								            <input onclick="timeShowtsType()" style="height: 25px;line-height: 25px;" class="jscolor" name="fcolor1" id="fcolor1" value="<ww:property value='fcolor'/>" /> 
								      </td>
						         </tr>
						       
						       <tr style="display: none;"> 
						            <td style="text-align: right;" width="200"></td>
						            <td>
						            
						               X: <input id="xy_x1"  type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									   Y: <input id="xy_y1"  type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									   <ww:property value='#session.local.a00032' />:
								          <input  id="width1" type="text" style="width:40px;height:20px;" <ww:if test="width==0">value="400"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								       <ww:property value='#session.local.a00033' />:
								          <input  id="height1" type="text" style="width:40px;height:20px;"  <ww:if test="height==0">value="100"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
						            </td>
							   </tr>		
							   <tr>
					            <td>&nbsp;</td>
					            <td>&nbsp;
					                   
					                   <button class="btn btn-primary" onclick='gosubmit(1)' type="button"><ww:property value='#session.local.a00080' /></button>
				                       <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
		        
					              </td>
							   </tr>
		                   </table>
		
		            </div>
				  </div>
				</div>
            </div>	            
		</div>

		<!-- 第二个内容 -->
		<div class="listone list2" <ww:if test="tType==2||tType==3">  style="display: block;"  </ww:if><ww:else>style="display: none;" </ww:else> >
			 <div class="container clearfix" style="margin: 10px 10px;">
		          <div class="main-wrap">
				      <div class="result-wrap">
				            <div class="result-content">
				            
					             <table class="insert-tab" width="100%" onclick="timeShowtsType2()">
					             
					                  <tr>
				                         
				                         <td style="overflow-x: auto;text-align: center;height: 100px;" colspan="4">
						                       <span id="timeShow2"></span>
						                 </td>
						                  
				                      </tr>
				                      
					                  <tr>
									      
									        <!-- 计时类型 -->
								            <td style="text-align: right;" width="100"><ww:property value='#session.local.a00728' />:</td>
								            <td >
								               <select id="tKtype">  <!-- 计时类型 -->
								                   <option <ww:if test="tKtype==2"> selected="selected"  </ww:if>  value="2"><ww:property value="#session.local.a00312"/></option> 正计时 
								                   <option <ww:if test="tKtype==3"> selected="selected"  </ww:if>  value="3"><ww:property value="#session.local.a00311"/></option><!-- 倒计时 -->
								               </select>
								            </td>
								            <!-- 时间点-->
								            <td style="text-align: right;" width="100"><ww:property value='#session.local.a00292' />:</td>
								            <td><input  style="width:200px;height: 25px;line-height: 25px;" value="<ww:property value='ttTimePoint'/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="ttTimePoint" /></td>
								            
									  </tr>
									  
									  
									  <tr>
									      
								            <td style="text-align: right;" width="q00"><ww:property value='#session.local.a00368' />:</td>
								            <td>
								               <input id="ttDa" name="ttDa" value="1"  <ww:if test="ttDa==1">  checked="checked" </ww:if>  type="checkbox"/><ww:property value="#session.local.a00300"/>&nbsp;  <!-- 天 -->
								               <input id="ttHo" name="ttHo" value="1"  <ww:if test="ttHo==1">  checked="checked" </ww:if>  type="checkbox"/><ww:property value="#session.local.a00301"/>&nbsp;<!-- 小时 -->
								               <input id="ttMi" name="ttMi" value="1"  <ww:if test="ttMi==1">  checked="checked" </ww:if>  type="checkbox"/><ww:property value="#session.local.a00302"/>&nbsp;<!-- 分钟 -->
								               <input id="ttSs" name="ttSs" value="1"  <ww:if test="ttSs==1">  checked="checked" </ww:if>  type="checkbox"/><ww:property value="#session.local.a00106"/>&nbsp;  <!-- 秒 -->
								            </td>
								            
								             <td style="text-align: right;" width="100"><ww:property value='#session.local.b00138' />:</td>
								            <td>
								            
								                <input id="unitShow" name="unitShow" value="0"  <ww:if test="unitShow==0">  checked="checked" </ww:if>  type="radio"/><ww:property value="#session.local.a00232"/>&nbsp;<!-- 是 -->
								               
								                <input id="unitShow" name="unitShow" value="1"  <ww:if test="unitShow==1">  checked="checked" </ww:if>   type="radio"/><ww:property value="#session.local.a00233"/>&nbsp;  <!-- 否 -->
								               
								            </td>
								            
									  </tr>
									  
									  
									 
									  
									  
									 
									 
								      <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00324' />:</td>
								            <td>
								               <select id="fs2" style="width:50px;">
								              
								                     <option   <ww:if test='fs==16'>selected="selected"</ww:if>   value="16"><ww:property value="#session.local.b00038" /></option>
											         <option   <ww:if test='fs==24'>selected="selected"</ww:if>   value="24"><ww:property value="#session.local.b00039" /></option>
											         <option   <ww:if test='fs==36'>selected="selected"</ww:if>   value="36"><ww:property value="#session.local.b00040" /></option>
											         <option   <ww:if test='fs==48'>selected="selected"</ww:if>   value="48"><ww:property value="#session.local.b00041" /></option>
											         <option   <ww:if test='fs==72'>selected="selected"</ww:if>   value="72"><ww:property value="#session.local.b00042" /></option>
											           
								               </select>
								               
								                <!-- 高级  -->
								                 
							                       &nbsp;&nbsp;
							                       <ww:property value="#session.local.b00051"/>:&nbsp; 
							                       <input type="checkbox" id="txtFontSizeAdvancedCheckBox2"  onchange="setCheckBoxChange2()" value="1" style="margin-top: -5px;"/>
							                       <select id="txtFontSizeAdvancedSelect2"  style="width: 60px;display:none;">
							 
														 
											              <option   <ww:if test='fs==12'>selected="selected"</ww:if>   value="12">12</option>
											              <option   <ww:if test='fs==13'>selected="selected"</ww:if>   value="13">13</option>
											              <option   <ww:if test='fs==14'>selected="selected"</ww:if>   value="14">14</option>
											              <option   <ww:if test='fs==15'>selected="selected"</ww:if>   value="15">15</option>
											              <option   <ww:if test='fs==16'>selected="selected"</ww:if>   value="16">16</option>
											              <option   <ww:if test='fs==17'>selected="selected"</ww:if>   value="17">17</option>
											              <option   <ww:if test='fs==18'>selected="selected"</ww:if>   value="18">18</option>
											              <option   <ww:if test='fs==19'>selected="selected"</ww:if>   value="19">19</option>
											              <option   <ww:if test='fs==20'>selected="selected"</ww:if>   value="20">20</option>
											              <option   <ww:if test='fs==21'>selected="selected"</ww:if>   value="21">21</option>
											              <option   <ww:if test='fs==22'>selected="selected"</ww:if>   value="22">22</option>
											              <option   <ww:if test='fs==23'>selected="selected"</ww:if>   value="23">23</option>
											              <option   <ww:if test='fs==24'>selected="selected"</ww:if>   value="24">24</option>
											              <option   <ww:if test='fs==25'>selected="selected"</ww:if>   value="25">25</option>
											              <option   <ww:if test='fs==26'>selected="selected"</ww:if>   value="26">26</option>
											              <option   <ww:if test='fs==27'>selected="selected"</ww:if>   value="27">27</option>
											              <option   <ww:if test='fs==28'>selected="selected"</ww:if>   value="28">28</option>
											              <option   <ww:if test='fs==29'>selected="selected"</ww:if>   value="29">29</option>
											              <option   <ww:if test='fs==30'>selected="selected"</ww:if>   value="30">30</option>
											              <option   <ww:if test='fs==31'>selected="selected"</ww:if>   value="31">31</option>
											              <option   <ww:if test='fs==32'>selected="selected"</ww:if>    value="32">32</option>
											              <option   <ww:if test='fs==33'>selected="selected"</ww:if>   value="33">33</option>
											              <option   <ww:if test='fs==34'>selected="selected"</ww:if>   value="34">34</option>
											              <option   <ww:if test='fs==35'>selected="selected"</ww:if>   value="35">35</option>
											              <option   <ww:if test='fs==36'>selected="selected"</ww:if>   value="36">36</option>
											              <option   <ww:if test='fs==37'>selected="selected"</ww:if>   value="37">37</option>
											              <option   <ww:if test='fs==38'>selected="selected"</ww:if>   value="38">38</option>
											              <option   <ww:if test='fs==39'>selected="selected"</ww:if>   value="39">39</option>
											              <option   <ww:if test='fs==40'>selected="selected"</ww:if>   value="40">40</option>
											              <option   <ww:if test='fs==41'>selected="selected"</ww:if>   value="41">41</option>
											              <option   <ww:if test='fs==42'>selected="selected"</ww:if>   value="42">42</option>
											              <option   <ww:if test='fs==43'>selected="selected"</ww:if>   value="43">43</option>
											              <option   <ww:if test='fs==44'>selected="selected"</ww:if>   value="44">44</option>
											              <option   <ww:if test='fs==45'>selected="selected"</ww:if>   value="45">45</option>
											              <option   <ww:if test='fs==46'>selected="selected"</ww:if>   value="46">46</option>
											              <option   <ww:if test='fs==47'>selected="selected"</ww:if>   value="47">47</option>
											              <option   <ww:if test='fs==48'>selected="selected"</ww:if>   value="48">48</option>
											              <option   <ww:if test='fs==49'>selected="selected"</ww:if>   value="49">49</option>
											              <option   <ww:if test='fs==50'>selected="selected"</ww:if>   value="50">50</option>
											              <option   <ww:if test='fs==55'>selected="selected"</ww:if>   value="55">55</option>
											              <option   <ww:if test='fs==60'>selected="selected"</ww:if>   value="60">60</option>
											              <option   <ww:if test='fs==65'>selected="selected"</ww:if>   value="65">65</option>
											              <option   <ww:if test='fs==70'>selected="selected"</ww:if>   value="70">70</option>
											              <option   <ww:if test='fs==75'>selected="selected"</ww:if>   value="75">75</option>
											              <option   <ww:if test='fs==80'>selected="selected"</ww:if>   value="80">80</option>
											              <option   <ww:if test='fs==85'>selected="selected"</ww:if>   value="85">85</option>
											              <option   <ww:if test='fs==90'>selected="selected"</ww:if>   value="90">90</option>
											              <option   <ww:if test='fs==95'>selected="selected"</ww:if>   value="95">95</option>
											              <option   <ww:if test='fs==100'>selected="selected"</ww:if>  value="100">100</option>
											              <option   <ww:if test='fs==110'>selected="selected"</ww:if>  value="110">110</option>
											              <option   <ww:if test='fs==120'>selected="selected"</ww:if>  value="120">120</option>
											              <option   <ww:if test='fs==130'>selected="selected"</ww:if>  value="130">130</option>
											              <option   <ww:if test='fs==140'>selected="selected"</ww:if>  value="140">140</option>
											              <option   <ww:if test='fs==150'>selected="selected"</ww:if>  value="150">150</option>
											              <option   <ww:if test='fs==160'>selected="selected"</ww:if>  value="160">160</option>
											              <option   <ww:if test='fs==170'>selected="selected"</ww:if>  value="170">170</option>
											              <option   <ww:if test='fs==180'>selected="selected"</ww:if>  value="180">180</option>
											              <option   <ww:if test='fs==190'>selected="selected"</ww:if>  value="190">190</option>
											              <option   <ww:if test='fs==200'>selected="selected"</ww:if>  value="200">200</option>
							                      </select>  
							                   
								            </td>
								            
								            <td style="text-align: right;"><ww:property value='#session.local.a00325' />:</td>
								            <td>
								                 <input class="jscolor"  style="height:25px;line-height: 25px;" id="fcolor2" value="<ww:property value='fcolor'/>" /> 
								            </td>
								            
								            
								          </tr>
										 
						       <tr style="display: none;"> 
						            <td style="text-align: right;" width="200"></td>
						            <td >
						            
						                  X:	  
										  <input id="xy_x2" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									      Y:
									      <input id="xy_y2" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else>  style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									     
									      <ww:property value='#session.local.a00032' />:
								        
								          <input  id="width2" type="text" style="width:40px;height:20px;" <ww:if test="width==0">value="600"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								          
								          <ww:property value='#session.local.a00033' />:
								          
								          <input  id="height2" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="300"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									     
						            </td>
							   </tr>		
							   			  
							   <tr>
					            
					              <td colspan="4" >
				                 
					                      <button style="margin-left: 260px;" class="btn btn-primary" onclick='gosubmit(2)' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                          <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
		                
					              </td>
							   </tr>
		                   </table>
		
		
		
		
		            </div>
				  </div>
				</div>
            </div>	            
		</div>
    </div>
</div>
</div>
</div>
<script src="js/functions.js"></script>
<script src="js/lanren.js"></script>
<!-- 代码部分end -->

  
   
</form>

</body>
</html>
