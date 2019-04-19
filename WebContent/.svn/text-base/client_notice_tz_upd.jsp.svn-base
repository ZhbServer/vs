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
<link href="<ww:url value="/webwork/jscalendar/calendar-blue.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="css/base2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/vs/webwork/jscalendar/calendar.js"></script>
<script type="text/javascript" src="/vs/webwork/jscalendar/lang/calendar-zh.js"></script>
<script type="text/javascript" src="/vs/webwork/jscalendar/calendar-setup.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">



   //设置滚动位置
   //var positionValue = $(this).attr("value");
   //setMessagePosition(positionValue);
	$(function(){
			//初始化显示位置
			setMessagePosition("<ww:property value='up2' />");
			
			$(":radio").click(function(){
			 //alert("您是..." + $(this).val());
			    setMessagePosition($(this).val());
			});
	});






//判断开始日期和结束日期
function comptime(beginTime,endTime){
         var beginTimes=beginTime.substring(0,10).split('-');
         var endTimes=endTime.substring(0,10).split('-');
         beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
         endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
         var a =Date.parse(endTime)-Date.parse(beginTime);
         
         if(a<=0){
             return false;
             }
         else
         {
          return true;
          }
 }
function getdqDate(){
	   var now = new Date();
    
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
   
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
    var ss = now.getSeconds();          //秒  
    var clock = year + "-";
   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
       
    clock += day + " ";
   
    if(hh < 10)
        clock += "0";
       
    clock += hh + ":";
    if (mm < 10) clock += '0'; 

    clock += mm+":"; 

    if (ss < 10) clock += '0'; 
    clock += ss; 
	   
   document.getElementById("sdate").value=clock;
}

function save() {
	var fonttitle=document.getElementById("fonttitle").value;
    var fontcontent = document.getElementById("fontcontent").value;
	var fontspeed = document.getElementById("fontspeed").value;
	var fontsizes = document.getElementById("fontsize").value;
	var fontcolors = document.getElementById("fontcolor").value;
	var backcolor = document.getElementById("backcolor").value;
	var up = document.getElementById("up").value;
	var fonttype = document.getElementById("fonttype").value;


	var sdate=document.getElementById("sdate").value;
	var edate=document.getElementById("edate").value;

	if(sdate.length!=19)
	 {
	   alert("<ww:property value='#session.local.a00542' />");
	  return;
	 } 
	 if(edate.length!=19)
	 {
	   alert("<ww:property value='#session.local.a00543' />");
	   return;
	 } 
    //判断下载时间和开始播放时间
	 if(!comptime(sdate,edate)){
		 alert("<ww:property value='#session.local.a00544' />");
		   return;
	 
    }
	
	if(fonttitle==""){
		 alert("<ww:property value='#session.local.a00545' />");
		  return;
    }
	if(fontcontent.length<1&&fontspeed==-1&&fontsizes==-1&&fontcolors==-1&&backcolor==-1&&fonttype==-1&&up==-1)
	{
	  alert("<ww:property value='#session.local.a00546' />");
	  return;
	}
    document.form1.action="updnotice.vs";
	document.form1.submit();
}

function closeDig(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}

</script>

</head> 
<body>

   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <td rowspan="4" height="300px;">
		                                    <!-- 消息展示的内容区 -->
							                <div class="display-area" id="display-area" style="padding-top: 165.278px;">
							                    <!-- 滚动条 -->
							                    <div id="marquee" style="height: 26px; font-size: 20px; background-color: rgb(214, 203, 75);"><div style="width: 100000px; margin-left: 636px; animation: marqueeAnimation-6358660 32.5s linear 1s infinite;" class="js-marquee-wrapper"><div class="js-marquee" style="margin-right: 0px; float: left;">asdas</div></div></div>
							                </div>
							                <!-- 电视机图像的底座   -->
							                <div class="handle-top"></div>
							                <div class="handle-bottom"></div>  
		                            </td> 
		                             
		                            <!-- 标题 -->
		                            <th width="80"><i class="require-red">*</i><ww:property value='#session.local.a00536' />:</th>
		                            <td>
		                               <input  name="fonttitle" id="fonttitle" type="text" value="<ww:property value='fonttitle' />"/>
		                            </td>
		                          </tr>
		                          
		                         <tr>
		                            <th width="80"></th>
		                            <td>
		                                <!-- 开始时间,结束时间 -->
		                                <ww:property value='#session.local.a00540' />:
									   	<input id="sdate" type="text" name="sdate"  style="width: 210px;"  value="<ww:property value='sdate' />"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/> 
	                                    <br/>
	                                    <ww:property value='#session.local.a00541' />:
									    <input id="edate" type="text" name="edate"  style="width: 210px;"  value="<ww:property value='edate' />"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
		                            </td>
		                          </tr>
		                            <!-- 内容 -->
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00206' />:</th>
		                                <td>
		                                     <textarea name="fontcontent" id="fontcontent"  rows="4"  cols="40"><ww:property value='fontcontent' /></textarea>
		                                </td>
		                            </tr>
		                            <!-- 样式 -->
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00537' />:</th>
		                                <td>
		                                    <div >
		                                      <!-- 背景颜色 -->
									          <ww:property value='#session.local.a00358' />
											  <select name="backcolor" id="backcolor">
												 
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option> 
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <option value="0" selected="selected"><ww:property value='#session.local.a00366' /></option> 
												  <ww:if test="backcolor != 0">
											  	  	  <script>
												  	  	$("#backcolor option[value='0']").removeAttr("selected");
												  	    $("#backcolor option[value='"+"<ww:property value='backcolor' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
											  </select>
											  <!-- 字体颜色 -->
										      <ww:property value='#session.local.a00325' />
											  <select name="fontcolor" id="fontcolor">
												  
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option>
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216" selected="selected"><ww:property value='#session.local.a00337' /></option>
												  <ww:if test="fontcolor != -16777216">
											  	  	  <script>
												  	  	$("#fontcolor option[value='-16777216']").removeAttr("selected");
												  	    $("#fontcolor option[value='"+"<ww:property value='fontcolor' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
											  </select>
											  <!-- 字体类型 -->
										      <ww:property value='#session.local.a00538' />
										      <select name="fonttype" id="fonttype">
												
												  <option value="0" selected="selected"><ww:property value='#session.local.a00377' /></option>
												  <option value="1"><ww:property value='#session.local.a00374' /></option>
												  <option value="2"><ww:property value='#session.local.a00379' /></option>
												  <option value="3"><ww:property value='#session.local.a00380' /></option>
												  <option value="4"><ww:property value='#session.local.a00381' /></option>
												  <option value="5"><ww:property value='#session.local.a00375' /></option>
												  <option value="6"><ww:property value='#session.local.a00376' /></option>
												  
												  <option value="7"><ww:property value='#session.local.b00135' /></option>
												  <option value="8"><ww:property value='#session.local.b00136' /></option>
												  <option value="9"><ww:property value='#session.local.b00137' /></option>
												  
												  
												  <ww:if test="fonttype != 0">
											  	  	  <script>
												  	  	$("#fonttype option[value='0']").removeAttr("selected");
												  	    $("#fonttype option[value='"+"<ww:property value='fonttype' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
													<!--<option value="7"><ww:property value='#session.local.font_family_show_fsgb2312' /></option>
												   <option value="8"><ww:property value='#session.local.font_family_show_ktgb2312' /></option>
												    <option value="9"><ww:property value='#session.local.font_family_show_hwls' /></option>
												     <option value="10"><ww:property value='#session.local.font_family_show_fzwb' /></option>
												      <option value="11"><ww:property value='#session.local.font_family_show_hwxk' /></option>
												       <option value="12"><ww:property value='#session.local.font_family_show_fzhcjt' /></option>
												        <option value="13"><ww:property value='#session.local.font_family_show_fzxzs' /></option>
												         <option value="14"><ww:property value='#session.local.font_family_show_fzsjsjt' /></option>
												          <option value="15"><ww:property value='#session.local.font_family_show_fzhjjt' /></option>
												           <option value="16"><ww:property value='#session.local.font_family_show_fzxstjt' /></option>
												            <option value="17"><ww:property value='#session.local.font_family_show_fzlxtjt' /></option>
												             <option value="18"><ww:property value='#session.local.font_family_show_fzjzjt' /></option>
												              <option value="19"><ww:property value='#session.local.font_family_show_fzktjt' /></option>
												               <option value="20"><ww:property value='#session.local.font_family_show_fzxtly' /></option> -->	
										     </select>
                                          </div>
		                                </td>
		                            </tr>
		                            
		                            <tr>
		                                 <td style="text-align: center;"> <!-- 向上移动像素(-1为默认值) -->
<!--										     <ww:property value='#session.local.a00539' />-->
                                             <span>
                                                <!--通知位置  -->
                                                <ww:property value="#session.local.b00201"/>
                                                :&nbsp;&nbsp;
										        <input name="up"    id="up"  value="-1" size="2" maxlength="4" style="display: none;" />
										     
										        <input type="radio"  value="1" name="noticePostion" <ww:if test="up2==1">checked="checked"  </ww:if> />
										        <ww:property value="#session.local.b00202"/>        
										        <!-- 顶部 -->           
										        &nbsp;&nbsp;        
										        <input type="radio"  value="0.5"  name="noticePostion" <ww:if test="up2==0.5">checked="checked"  </ww:if>  />
										        <ww:property value="#session.local.b00203"/>      
										        <!-- 中部 -->        
										        &nbsp;&nbsp;        
										        <input type="radio"  value="0"   name="noticePostion"   <ww:if test="up2==0||up2==-1">checked="checked"  </ww:if>  />
										        <ww:property value="#session.local.b00204"/>       
										        <!-- 底部 -->     
										        
										        &nbsp;       
										        <input type="radio"   value="-1"   name="noticePostion" <ww:if test="up2==-1"> checked="checked" </ww:if> />
										         <ww:property value="#session.local.b00322"/>       
										         <!--左边 --> 
										     
										        &nbsp;        
										        <input type="radio"  value="-2"   name="noticePostion"  <ww:if test="up2==-2"> checked="checked" </ww:if> />
										        <ww:property value="#session.local.b00323"/>       
										        <!-- 右边 -->   
										     </span>       
										     
										             
										             
										     
										 </td>
										 
		                                <th></th>
		                                <td>
		                                     <!-- 字体大小 --> 
		                                     <ww:property value='#session.local.a00324' /> 
											 <select name="fontsize"  id="fontsize">
<!--												      <option value="36"><ww:property value="#session.local.b00002" /></option>-->
													  <option value="16"><ww:property value="#session.local.b00038" /></option>
												      <option value="24"><ww:property value="#session.local.b00039" /></option>
												      <option selected="selected"   value="36"><ww:property value="#session.local.b00040" /></option>
												      <option value="48"><ww:property value="#session.local.b00041" /></option>
												      <option value="72"><ww:property value="#session.local.b00042" /></option>
										              <ww:if test="fontsize != 36">
												  	  	  <script>
													  	  	$("#fontsize option[value='36']").removeAttr("selected");
													  	    $("#fontsize option[value='"+"<ww:property value='fontsize' />"+"']").attr("selected","selected");
												  	  	  </script>
												  	  </ww:if>
											 </select>
											 <!-- 滚动速度 -->
										     <ww:property value='#session.local.a00336' />
											 <select name="fontspeed"  id="fontspeed">
											 
												  <option value="3"><ww:property value="#session.local.b00002" /></option>
												  <option  value="5" ><ww:property value="#session.local.b00037" /></option><!-- 超快 -->
									              <option  value="4"><ww:property value="#session.local.b00036" /></option><!-- 快 -->
									              <option  selected="selected" value="3"><ww:property value="#session.local.b00035" /></option><!-- 正常 -->
									              <option  value="2"><ww:property value="#session.local.b00034" /></option><!--慢 -->
									              <option  value="1"><ww:property value="#session.local.b00033" /></option><!-- 超慢 -->
												  
												  <option value="0"><ww:property value="#session.local.b00043" /></option>
												  <ww:if test="fontspeed != 3">
											  	  	  <script>
												  	  	$("#fontspeed option[value='3']").removeAttr("selected");
												  	    $("#fontspeed option[value='"+"<ww:property value='fontspeed' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
											 </select>
											
		                                </td>
		                            </tr>
		                            
		                           
		                             <!-- 内容 2-->
		                            <tr style="display: none;">
		                                <th><ww:property value='#session.local.a00206' />2:</th>
		                                <td>
		                                     <textarea name="fontcontent2" id="fontcontent2"  rows="4"  cols="60"><ww:property value='fontcontent2' /></textarea>
		                                </td>
		                            </tr>
		                            <!-- 样式 -->
		                            <tr style="display: none;">
		                                <th><ww:property value='#session.local.a00537' />2:</th>
		                                <td>
		                                    <div >
		                                      <!-- 背景颜色 -->
									          <ww:property value='#session.local.a00358' />
											  <select name="backcolor2" id="backcolor2">
												  <option value="0"><ww:property value="#session.local.b00002" /></option>      <!-- 默认 -->
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option> 
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <option value="0"><ww:property value='#session.local.a00366' /></option>
												  <ww:if test="backcolor2 != 0">
											  	  	  <script>
												  	  	$("#backcolor2 option[value='0']").removeAttr("selected");
												  	    $("#backcolor2 option[value='"+"<ww:property value='backcolor2' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
											  </select>
											  <!-- 字体颜色 -->
										      <ww:property value='#session.local.a00325' />
											  <select name="fontcolor2" id="fontcolor2">
												  <option value="-16777216"><ww:property value="#session.local.b00002" /></option>
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option>
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <ww:if test="fontcolor2 != -16777216">
											  	  	  <script>
												  	  	$("#fontcolor2 option[value='-16777216']").removeAttr("selected");
												  	    $("#fontcolor2 option[value='"+"<ww:property value='fontcolor2' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
											  </select>
											  <!-- 字体类型 -->
										      <ww:property value='#session.local.a00538' />
										      <select name="fonttype2" id="fonttype2">
												  <option value="0"><ww:property value="#session.local.b00002" /></option>
												  <option value="0"><ww:property value='#session.local.a00377' /></option>
												  <option value="1"><ww:property value='#session.local.a00374' /></option>
												  <option value="2"><ww:property value='#session.local.a00379' /></option>
												  <option value="3"><ww:property value='#session.local.a00380' /></option>
												  <option value="4"><ww:property value='#session.local.a00381' /></option>
												  <option value="5"><ww:property value='#session.local.a00375' /></option>
												  <option value="6"><ww:property value='#session.local.a00376' /></option>
												  
												  <option value="7"><ww:property value='#session.local.b00135' /></option>
												  <option value="8"><ww:property value='#session.local.b00136' /></option>
												  <option value="9"><ww:property value='#session.local.b00137' /></option>
												  
												  <ww:if test="fonttype2 != 0">
											  	  	  <script>
												  	  	$("#fonttype2 option[value='0']").removeAttr("selected");
												  	    $("#fonttype2 option[value='"+"<ww:property value='fonttype2' />"+"']").attr("selected","selected");
											  	  	  </script>
											  	  </ww:if>
													<!--<option value="7"><ww:property value='#session.local.font_family_show_fsgb2312' /></option>
												   <option value="8"><ww:property value='#session.local.font_family_show_ktgb2312' /></option>
												    <option value="9"><ww:property value='#session.local.font_family_show_hwls' /></option>
												     <option value="10"><ww:property value='#session.local.font_family_show_fzwb' /></option>
												      <option value="11"><ww:property value='#session.local.font_family_show_hwxk' /></option>
												       <option value="12"><ww:property value='#session.local.font_family_show_fzhcjt' /></option>
												        <option value="13"><ww:property value='#session.local.font_family_show_fzxzs' /></option>
												         <option value="14"><ww:property value='#session.local.font_family_show_fzsjsjt' /></option>
												          <option value="15"><ww:property value='#session.local.font_family_show_fzhjjt' /></option>
												           <option value="16"><ww:property value='#session.local.font_family_show_fzxstjt' /></option>
												            <option value="17"><ww:property value='#session.local.font_family_show_fzlxtjt' /></option>
												             <option value="18"><ww:property value='#session.local.font_family_show_fzjzjt' /></option>
												              <option value="19"><ww:property value='#session.local.font_family_show_fzktjt' /></option>
												               <option value="20"><ww:property value='#session.local.font_family_show_fzxtly' /></option> -->	
										     </select>
                                          </div>
		                                </td>
		                            </tr>
		                            
		                            <tr style="display: none;">
		                                <th></th>
		                                <td>
		                                     <!-- 字体大小 --> 
		                                     <ww:property value='#session.local.a00324' /> 
											 <select name="fontsize2"  id="fontsize2">
<!--												      <option value="36"><ww:property value="#session.local.b00002" /></option>-->
													  <option value="16"><ww:property value="#session.local.b00038" /></option>
												      <option value="24"><ww:property value="#session.local.b00039" /></option>
												      <option selected="selected"   value="36"><ww:property value="#session.local.b00040" /></option>
												      <option value="48"><ww:property value="#session.local.b00041" /></option>
												      <option value="72"><ww:property value="#session.local.b00042" /></option>
										              <ww:if test="fontsize2 != 36">
												  	  	  <script>
													  	  	$("#fontsize2 option[value='36']").removeAttr("selected");
													  	    $("#fontsize2 option[value='"+"<ww:property value='fontsize2' />"+"']").attr("selected","selected");
												  	  	  </script>
											  	  	  </ww:if>
											 </select>
											 <!-- 滚动速度 -->
										     <ww:property value='#session.local.a00336' />
											 <select name="fontspeed2"  id="fontspeed2">
												  <option value="3"><ww:property value="#session.local.b00002" /></option>
												  <option  value="5" ><ww:property value="#session.local.b00037" /></option><!-- 超快 -->
									              <option  value="4"><ww:property value="#session.local.b00036" /></option><!-- 快 -->
									              <option  selected="selected" value="3"><ww:property value="#session.local.b00035" /></option><!-- 正常 -->
									              <option  value="2"><ww:property value="#session.local.b00034" /></option><!--慢 -->
									              <option  value="1"><ww:property value="#session.local.b00033" /></option><!-- 超慢 -->
												  
												  <option value="0"><ww:property value="#session.local.b00043" /></option>
												  <ww:if test="fontspeed2 != 3">
											  	  	  <script>
												  	  	$("#fontspeed2 option[value='3']").removeAttr("selected");
												  	    $("#fontspeed2 option[value='"+"<ww:property value='fontspeed2' />"+"']").attr("selected","selected");
											  	  	  </script>
										  	  	  </ww:if>
											 </select>
											 <!-- 向上移动像素(-1为默认值) -->
										     <ww:property value='#session.local.a00539' />
										     <ww:if test="up2 != -1">
										     	<input name="up2"    id="up2"  value="<ww:property value='up2' />" size="2" maxlength="4"  />
										     </ww:if>
										     <ww:else>
										     	<input name="up2"    id="up2"  value="-1" size="2" maxlength="4"  />
										     </ww:else>
		                                </td>
		                            </tr>
		                            
		                             
		                            
		                            
		                            

		                            <tr>
		                            
		                                <td colspan="3" >
		                                    <button  style="margin-left: 380px;" class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
		                                    <button class="btn btn-primary" onclick="closeDig()" type="button"><ww:property value='#session.local.a00014' /></button>
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
       
       
<input type="hidden" value="<ww:property value='nid'/>" name="nid"  id="nid" /><!-- 通知id -->
      
    
   </form>
</body>
</html>
