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
<script type="text/javascript">

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
	   layer.msg("<ww:property value='#session.local.a00542' />");
	  return;
	 } 
	 if(edate.length!=19)
	 {
		 layer.msg("<ww:property value='#session.local.a00543' />");
	   return;
	 } 
    //判断下载时间和开始播放时间
	 if(!comptime(sdate,edate)){
		 layer.msg("<ww:property value='#session.local.a00544' />");
		   return;
	 
    }
	
	if(fonttitle==""){
		layer.msg("<ww:property value='#session.local.a00545' />");
		  return;
    }
	if(fontcontent.length<1&&fontspeed==-1&&fontsizes==-1&&fontcolors==-1&&backcolor==-1&&fonttype==-1&&up==-1)
	{
		layer.msg("<ww:property value='#session.local.a00546' />");
	    return;
	}
    document.form1.action="addnoticejh.vs";
	document.form1.submit();
}

function closeDig(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}

</script>

</head> 
<body>


<br/>
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                          <tr>
		                            <!-- 计划名 -->
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00649' />:</th>
		                            <td>
		                               <ww:property value='njhname' />
									   <input value="<ww:property value='njhname' />" name="njhname"  id="njhname"  type="hidden"/>
									   <input value="<ww:property value='jid' />" name="jid"  id="jid"  type="hidden"/>
		                            </td>
		                          </tr>
		                        
		                         <tr>
		                            <!-- 标题 -->
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00536' />:</th>
		                            <td>
		                               <input  name="fonttitle" id="fonttitle"  type="text"/>
		                            </td>
		                          </tr>
		                          
		                         <tr>
		                            <th width="120"></th>
		                            <td>
		                                <!-- 开始时间,结束时间 -->
		                                <ww:property value='#session.local.a00540' />:
									   	<input id="sdate" type="text" name="sdate"  style="width:210px;"  value="1999-12-12 12:00:00"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/> 
	                                    &nbsp;&nbsp;&nbsp;
	                                    <ww:property value='#session.local.a00541' />:
									    <input id="edate" type="text" name="edate"  style="width: 210px;"  value="2020-12-12 12:00:00"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
		                            </td>
		                          </tr>
		                            <!-- 内容 -->
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00206' />:</th>
		                                <td>
		                                     <textarea name="fontcontent" id="fontcontent"  rows="4"  cols="60"></textarea>
		                                </td>
		                            </tr>
		                            <!-- 样式 -->
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00537' />:</th>
		                                <td>
		                                    <div >
		                                      <!-- 背景颜色 -->
									          <ww:property value='#session.local.b00200' />
											  <select name="backcolor" id="backcolor">
												  <option value="0"><ww:property value="#session.local.b00002" /></option>      <!-- 默认 -->
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option> 
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <option value="0"><ww:property value='#session.local.a00366' /></option> 
											  </select>
											  <!-- 字体颜色 -->
										      <ww:property value='#session.local.b00200' />
											  <select name="fontcolor" id="fontcolor">
												  <option value="-16777216"><ww:property value="#session.local.b00002" /></option>
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option>
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
											  </select>
											  <!-- 字体类型 -->
										      <ww:property value='#session.local.b00200' />
										      <select name="fonttype" id="fonttype">
												  <option value="0"><ww:property value="#session.local.b00002" /></option>
												  <option value="0"><ww:property value='#session.local.a00377' /></option>
												  <option value="1"><ww:property value='#session.local.a00374' /></option>
												  <option value="2"><ww:property value='#session.local.a00379' /></option>
												  <option value="3"><ww:property value='#session.local.a00380' /></option>
												  <option value="4"><ww:property value='#session.local.a00381' /></option>
												  <option value="5"><ww:property value='#session.local.a00375' /></option>
												  <option value="6"><ww:property value='#session.local.a00376' /></option>
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
		                                <th></th>
		                                <td>
		                                     <!-- 字体大小 --> 
		                                     <ww:property value='#session.local.a00324' /> 
											 <select name="fontsize"  id="fontsize">
												  <option value="50"><ww:property value="#session.local.b00200" /></option>
									           
												      <option value="1">1</option>
										              <option value="2">2</option>
										              <option value="3">3</option>
										              <option value="4">4</option>
										              <option value="5">5</option>
										              <option value="6">6</option>
										              <option value="7">7</option>
										              <option value="8">8</option>
										              <option value="9">9</option>
										              <option value="10">10</option>
										              <option value="11">11</option>
										              <option value="12">12</option>
										              <option value="13">13</option>
										              <option value="14">14</option>
										              <option value="15">15</option>
										              <option value="16">16</option>
										              <option value="17">17</option>
										              <option value="18">18</option>
										              <option value="19">19</option>
										              <option value="20">20</option>
										              <option value="21">21</option>
										              <option value="22">22</option>
										              <option value="23">23</option>
										              <option value="24" >24</option>
										              <option value="25">25</option>
										              <option value="26">26</option>
										              <option value="27">27</option>
										              <option value="28">28</option>
										              <option value="29">29</option>
										              <option value="30">30</option>
										              <option value="31">31</option>
										              <option value="32">32</option>
										              <option value="33">33</option>
										              <option value="34">34</option>
										              <option value="35">35</option>
										              <option value="36">36</option>
										              <option value="37">37</option>
										              <option value="38">38</option>
										              <option value="39">39</option>
										              <option value="40">40</option>
										              <option value="41">41</option>
										              <option value="42">42</option>
										              <option value="43">43</option>
										              <option value="44">44</option>
										              <option value="45">45</option>
										              <option value="46">46</option>
										              <option value="47">47</option>
										              <option value="48">48</option>
										              <option value="49">49</option>
										              <option value="50" selected="selected" >50</option>
										              <option value="55">55</option>
										              <option value="60">60</option>
										              <option value="65">65</option>
										              <option value="70">70</option>
										              <option value="75">75</option>
										              <option value="80">80</option>
										              <option value="85">85</option>
										              <option value="90">90</option>
										              <option value="95">95</option>
										              <option value="100">100</option>
										              <option value="110">110</option>
										              <option value="120">120</option>
										              <option value="130">130</option>
										              <option value="140">140</option>
										              <option value="150">150</option>
										              <option value="160">160</option>
										              <option value="170">170</option>
										              <option value="180">180</option>
										              <option value="190">190</option>
										              <option value="200">200</option>
										              <option value="210">210</option>
										              <option value="220">220</option>
										              <option value="230">230</option>
										              <option value="240">240</option>
										              <option value="250">250</option>
										              <option value="260">260</option>
										              <option value="270">270</option>
										              <option value="280">280</option>
										              <option value="290">290</option>
										              <option value="300">300</option>
										              <option value="320">320</option>
										              <option value="340">340</option>
										              <option value="360">360</option>
										              <option value="380">380</option>
										              <option value="400">400</option>
										              <option value="420">420</option>
										              <option value="440">440</option>
										              <option value="460">460</option>
										              <option value="480">480</option>
										              <option value="500">500</option>
										              <option value="550">550</option>
										              <option value="600">600</option>
										              <option value="650">650</option>
										              <option value="700">700</option>
										              <option value="750">750</option>
										              <option value="800">800</option>
										              <option value="850">850</option>
										              <option value="900">900</option>
										              <option value="950">950</option>
										              <option value="1000">1000</option> 
											 </select>
											 <!-- 滚动速度 -->
										     <ww:property value='#session.local.a00336' />
											 <select name="fontspeed"  id="fontspeed">
												  <option value="3"><ww:property value="#session.local.b00200" /></option>
												  <option  value="5" ><ww:property value="#session.local.b00037" /></option><!-- 超快 -->
									              <option  value="4"><ww:property value="#session.local.b00036" /></option><!-- 快 -->
									              <option  selected="selected" value="3"><ww:property value="#session.local.b00035" /></option><!-- 正常 -->
									              <option  value="2"><ww:property value="#session.local.b00034" /></option><!--慢 -->
									              <option  value="1"><ww:property value="#session.local.b00033" /></option><!-- 超慢 -->
												  
												  <option value="0"><ww:property value="#session.local.b00043" /></option>
											 </select>
											 <!-- 向上移动像素(-1为默认值) -->
										     <ww:property value='#session.local.a00539' />
										     <input name="up"    id="up"  value="-1" size="2" maxlength="4"  />
		                                </td>
		                            </tr>
		                            
		                           
		                             <!-- 内容 2-->
		                            <tr style="display: none;">
		                                <th><ww:property value='#session.local.a00206' />2:</th>
		                                <td>
		                                     <textarea name="fontcontent2" id="fontcontent2"  rows="4"  cols="60"></textarea>
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
												  <option value="0"><ww:property value="#session.local.b00200" /></option>      <!-- 默认 -->
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option> 
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <option value="0"><ww:property value='#session.local.a00366' /></option> 
											  </select>
											  <!-- 字体颜色 -->
										      <ww:property value='#session.local.a00325' />
											  <select name="fontcolor2" id="fontcolor2">
												  <option value="-16777216"><ww:property value="#session.local.b00200" /></option>
												  <option value="-65536"><ww:property value='#session.local.a00338' /></option>
												  <option value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option value="-16777216"><ww:property value='#session.local.a00337' /></option>
											  </select>
											  <!-- 字体类型 -->
										      <ww:property value='#session.local.a00538' />
										      <select name="fonttype2" id="fonttype2">
												  <option value="0"><ww:property value="#session.local.b00200" /></option>
												  <option value="0"><ww:property value='#session.local.a00377' /></option>
												  <option value="1"><ww:property value='#session.local.a00374' /></option>
												  <option value="2"><ww:property value='#session.local.a00379' /></option>
												  <option value="3"><ww:property value='#session.local.a00380' /></option>
												  <option value="4"><ww:property value='#session.local.a00381' /></option>
												  <option value="5"><ww:property value='#session.local.a00375' /></option>
												  <option value="6"><ww:property value='#session.local.a00376' /></option>
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
												  <option value="50"><ww:property value="#session.local.b00002" /></option>
									           
												      <option value="1">1</option>
										              <option value="2">2</option>
										              <option value="3">3</option>
										              <option value="4">4</option>
										              <option value="5">5</option>
										              <option value="6">6</option>
										              <option value="7">7</option>
										              <option value="8">8</option>
										              <option value="9">9</option>
										              <option value="10">10</option>
										              <option value="11">11</option>
										              <option value="12">12</option>
										              <option value="13">13</option>
										              <option value="14">14</option>
										              <option value="15">15</option>
										              <option value="16">16</option>
										              <option value="17">17</option>
										              <option value="18">18</option>
										              <option value="19">19</option>
										              <option value="20">20</option>
										              <option value="21">21</option>
										              <option value="22">22</option>
										              <option value="23">23</option>
										              <option value="24" >24</option>
										              <option value="25">25</option>
										              <option value="26">26</option>
										              <option value="27">27</option>
										              <option value="28">28</option>
										              <option value="29">29</option>
										              <option value="30">30</option>
										              <option value="31">31</option>
										              <option value="32">32</option>
										              <option value="33">33</option>
										              <option value="34">34</option>
										              <option value="35">35</option>
										              <option value="36">36</option>
										              <option value="37">37</option>
										              <option value="38">38</option>
										              <option value="39">39</option>
										              <option value="40">40</option>
										              <option value="41">41</option>
										              <option value="42">42</option>
										              <option value="43">43</option>
										              <option value="44">44</option>
										              <option value="45">45</option>
										              <option value="46">46</option>
										              <option value="47">47</option>
										              <option value="48">48</option>
										              <option value="49">49</option>
										              <option value="50" selected="selected" >50</option>
										              <option value="55">55</option>
										              <option value="60">60</option>
										              <option value="65">65</option>
										              <option value="70">70</option>
										              <option value="75">75</option>
										              <option value="80">80</option>
										              <option value="85">85</option>
										              <option value="90">90</option>
										              <option value="95">95</option>
										              <option value="100">100</option>
										              <option value="110">110</option>
										              <option value="120">120</option>
										              <option value="130">130</option>
										              <option value="140">140</option>
										              <option value="150">150</option>
										              <option value="160">160</option>
										              <option value="170">170</option>
										              <option value="180">180</option>
										              <option value="190">190</option>
										              <option value="200">200</option>
										              <option value="210">210</option>
										              <option value="220">220</option>
										              <option value="230">230</option>
										              <option value="240">240</option>
										              <option value="250">250</option>
										              <option value="260">260</option>
										              <option value="270">270</option>
										              <option value="280">280</option>
										              <option value="290">290</option>
										              <option value="300">300</option>
										              <option value="320">320</option>
										              <option value="340">340</option>
										              <option value="360">360</option>
										              <option value="380">380</option>
										              <option value="400">400</option>
										              <option value="420">420</option>
										              <option value="440">440</option>
										              <option value="460">460</option>
										              <option value="480">480</option>
										              <option value="500">500</option>
										              <option value="550">550</option>
										              <option value="600">600</option>
										              <option value="650">650</option>
										              <option value="700">700</option>
										              <option value="750">750</option>
										              <option value="800">800</option>
										              <option value="850">850</option>
										              <option value="900">900</option>
										              <option value="950">950</option>
										              <option value="1000">1000</option> 
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
											 </select>
											 <!-- 向上移动像素(-1为默认值) -->
										     <ww:property value='#session.local.a00539' />
										     <input name="up2"    id="up2"  value="-1" size="2" maxlength="4"  />
		                                </td>
		                            </tr>
		                            
		                             
		                            
		                            
		                            

		                            <tr>
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00080' />" type="button"  onclick="save()"/>
		                                    <input class="btn btn6" value="<ww:property value='#session.local.a00014' />" type="button" onclick="closeDig()" />
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
       
       
<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->
      
    
   </form>
</body>
</html>
