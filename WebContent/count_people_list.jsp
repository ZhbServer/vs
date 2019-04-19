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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
</style>

<script>
var bt;
var et;
var index;

/** 
* 获取本日、本周、本月、本年开始日期 
*/  
var now = new Date();                    //当前日期     
var nowDayOfWeek = now.getDay();         //今天本周的第几天     
var nowDay = now.getDate();              //当前日     
var nowMonth = now.getMonth();           //当前月     
var nowYear = now.getYear();             //当前年     
nowYear += (nowYear < 2000) ? 1900 : 0;  //   

//格式化日期：yyyy-MM-dd     
function formatDate(date) {      
    var myyear = date.getFullYear();     
    var mymonth = date.getMonth()+1;     
    var myweekday = date.getDate();      
         
    if(mymonth < 10){     
        mymonth = "0" + mymonth;     
    }      
    if(myweekday < 10){     
        myweekday = "0" + myweekday;     
    }     
    return (myyear+"-"+mymonth + "-" + myweekday+" 00:00:00");      
}

//获取当前时间
function getCurrentDay(){
	var seperator1 = "-";//年月日分隔符
    var seperator2 = ":";//时分秒分隔符
    var month = now.getMonth() + 1; //月份是0~11，要加1为当前月
    var strDate = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
	if(now.getHours() >=0 && now.getHours()<=9){
		hours = "0" + now.getHours();
	}
	if(now.getMinutes() >=0 && now.getMinutes()<=9){
		minutes = "0" + now.getMinutes();
	}
	if(now.getSeconds() >=0 && now.getSeconds()<=9){
		seconds = "0" + now.getSeconds();
	}
	
	//var currentdate = now.getFullYear() + seperator1 + month + seperator1 + strDate + " " + hours + seperator2 + minutes + seperator2 + seconds;
	var currentdate = now.getFullYear() + seperator1 + month + seperator1 + strDate + " 23:59:59";
    return currentdate;
}      

//获得本日的开始日期     
function getDayStartDate() {      
    var dayStartDate = new Date(nowYear, nowMonth, nowDay);      
    return formatDate(dayStartDate);     
}

//获得本周的开始日期     
function getWeekStartDate() {      
	return formatDate(getCurrentWeek()[0]);       
}

//获得本月的开始日期     
function getMonthStartDate(){     
    var monthStartDate = new Date(nowYear, nowMonth, 1);      
    return formatDate(monthStartDate);     
} 

//获得本年的开始日期     
function getYearStartDate(){     
    var yearStartDate = new Date(nowYear, 0, 1);      
    return formatDate(yearStartDate);     
} 

window.onload=function(){
	bt = document.getElementById('btime').value;
	et = document.getElementById('etime').value;
	var datemode = document.getElementById('datemode').value;
	var check = document.getElementsByName('choicedate');
	if(datemode == "1"){
		check[0].checked = true;
	    check[1].checked = false;
	    check[2].checked = false;
	    check[3].checked = false;
		$("#btime").val(getDayStartDate());
		$("#etime").val(getCurrentDay());
	}else if(datemode == "2"){
		check[1].checked = true;
		check[0].checked = false;
	    check[2].checked = false;
	    check[3].checked = false;
		$("#btime").val(getWeekStartDate());
	    $("#etime").val(getCurrentDay());
	}else if(datemode == "3"){
		check[2].checked = true;
		check[0].checked = false;
	    check[1].checked = false;
	    check[3].checked = false;
		$("#btime").val(getMonthStartDate());
	    $("#etime").val(getCurrentDay());
	}else if(datemode == "4"){
		check[3].checked = true;
		check[0].checked = false;
	    check[1].checked = false;
	    check[2].checked = false;
		$("#btime").val(getYearStartDate());
	    $("#etime").val(getCurrentDay());
	}else if(datemode == "0"){
		var zdybtime = document.getElementById('zdybtime').value;
		var zdyetime = document.getElementById('zdyetime').value;
		$("#btime").val(zdybtime);
	    $("#etime").val(zdyetime);
		check[0].checked = false;
	    check[1].checked = false;
	    check[2].checked = false;
	    check[3].checked = false;
	}	

	$("input[name=choicedate]").click(function(e){
 		showCont(e);
	});
	function showCont(e){
	 switch(e.currentTarget.value){
	  case "1":
		  var check = document.getElementsByName('choicedate');
		   check[1].checked = false;
		   check[2].checked = false;
		   check[3].checked = false;
		   $("#btime").val(getDayStartDate());
		   $("#etime").val(getCurrentDay());
	   	   break;
	  case "2":
		  var check = document.getElementsByName('choicedate');
		   check[0].checked = false;
		   check[2].checked = false;
		   check[3].checked = false;
		   $("#btime").val(getWeekStartDate());
		   $("#etime").val(getCurrentDay());
	   	   break;
	  case "3":
		  var check = document.getElementsByName('choicedate');
		   check[0].checked = false;
		   check[1].checked = false;
		   check[3].checked = false;
		   $("#btime").val(getMonthStartDate());
		   $("#etime").val(getCurrentDay());
		   break;
	  case "4":
		  var check = document.getElementsByName('choicedate');
		   check[0].checked = false;
		   check[1].checked = false;
		   check[2].checked = false;
		   $("#btime").val(getYearStartDate());
		   $("#etime").val(getCurrentDay());
		   break;
	  default:
	   	   break;
	 	}
	}
}

//判断开始日期和结束日期
function comptime(beginTime,endTime){

	 var beginTimes=beginTime.substring(0,10).split('-');
     var endTimes=endTime.substring(0,10).split('-');
     beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
     endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
     var a =Date.parse(endTime)-Date.parse(beginTime);
     
     if(a<=0){
         return false;
     }else{
         return true;
     }
}

//查询
function selzxtime(){
	var btime = document.getElementById('btime').value;
	var etime = document.getElementById('etime').value;
	var check = document.getElementsByName('choicedate');
	for ( var i = 0; i < check.length; i++) {
		if(check[i].checked){
			$("#datemode").val(check[i].value);
			break;
		}else{
			$("#datemode").val(0);
		}
	}

	if(btime.length ==19){
		if(etime.length != 19){
			alert("<ww:property value='#session.local.a00543' />");
			return;
		}
		if(!comptime(btime,etime))
	    {
   	        alert("<ww:property value='#session.local.a00544' />");
   			return;
	    }
	}
	document.form1.target = "_self";
    document.form1.action = "toPeopleCountList.vs"; 
    document.form1.submit();
}

//统计人数详情
function count_people_info(mark){
	var btime = document.getElementById('btime').value;
	var etime = document.getElementById('etime').value;
	
	 layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "toCountPeopleDetails.vs?mark="+mark+"&btime="+btime+"&etime="+etime,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}
//统计人数详情 人脸/wife
function count_people_info_faceorwife(mark,sel){
	var btime = document.getElementById('btime').value;
	var etime = document.getElementById('etime').value;
	
	 layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "toCountPeopleDetails.vs?mark="+mark+"&btime="+btime+"&etime="+etime+"&sel="+sel,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}

//统计人数详情图标
function count_people_chart(mark){
	var btime = document.getElementById('btime').value;
	var etime = document.getElementById('etime').value;
	
	 layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "selPeopleFaceCountChart.vs?mark="+mark+"&btime="+btime+"&etime="+etime,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}

//当天时间记录
function today_rcode(id){
	layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "seeclienttodayinfo1.vs?id="+id,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}

function outPeopleFace(){

	var btime = document.getElementById('btime').value;
	var etime = document.getElementById('etime').value;
	var check = document.getElementsByName('choicedate');
	for ( var i = 0; i < check.length; i++) {
		if(check[i].checked){
			$("#datemode").val(check[i].value);
			break;
		}else{
			$("#datemode").val(0);
		}
	}
	
	//document.form1.target = "_blank";
	//document.form1.action = "outCountPeople.vs";
	//document.form1.submit();


    
	var sel=document.getElementById("sel").value;
 	var ser=document.getElementById("ser").value;
    var datemode=document.getElementById("datemode").value;
   
    layer.open({
		type: 2,
		area: ['660px', '520px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'outCountPeople.vs?sel='+sel+"&ser="+ser+"&datemode="+datemode+"&btime="+btime+"&etime="+etime,
        scrollbar: false,
        end: function(){ 
		    	
		}
    });


	
}

</script>
</head>
<body>
<form  name="form1" method="post" >
<div class="title bottom">
	<div class="t_container">
		<div class="loc">
			<ww:property value='#session.local.a00065' /> :
	       <span class="function"><ww:property value='#session.local.a00113' /></span>
	       <span class="material_bg"><ww:property value='#session.local.b00115' /></span>
		</div>
	</div>
</div>
<div class="c_middle download_manager">
    <!--菜单-->
	<div>
		<div class="c_right_header" >
	         <div style="float:left;margin: 10px 0px 10px 20px;width: 1030px;">
	         	  <div class="col-xs-4">
	         	  	<ww:property value="#session.local.a00540" />：<input id="btime" type="text" name="btime"  style="height: 22px;width: 150px;"  value="<ww:property value='btime'/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	         	  </div>
	         	  <div class="col-xs-4" style="margin-left: -120px;">
	         	  	<ww:property value="#session.local.a00541"/>：<input id="etime" type="text" name="etime"  style="height: 22px;width: 150px;"  value="<ww:property value='etime'/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	         	  </div>
	         	  <div class="col-xs-3" style="margin-left: -120px;">
	         	  	<input  style="margin-top: -1px;"  type="checkbox" name="choicedate"  checked="checked"  value="1"/><ww:property value='#session.local.a00853' />&nbsp;<!-- 本日 -->
                    &nbsp;&nbsp;&nbsp;
                    <input  style="margin-top: -1px;"  type="checkbox" name="choicedate"  value="2"/><ww:property value='#session.local.a00857' />&nbsp;<!-- 本周 -->
                    &nbsp;&nbsp;&nbsp;
                    <input  style="margin-top: -1px;"  type="checkbox" name="choicedate"  value="3"/><ww:property value='#session.local.a00854' />&nbsp;<!-- 本月 -->
                    &nbsp;&nbsp;&nbsp;
                    <input  style="margin-top: -1px;"  type="checkbox" name="choicedate"  value="4"/><ww:property value='#session.local.a00855' />&nbsp;<!-- 本年 -->
	         	  </div>
				  <div class="col-xs-1" style="margin-left: -20px;">
				    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			             <!-- 搜索条件 -->
			             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00031' /></option>
			             <!-- 终端名 -->
			             <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00038' /></option>
						 <!-- 终端IP-->
						 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00039' /></option>
						 <!-- 标识码 -->
						 <option  <ww:if test="sel==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.a00040' /></option>
		            </select>
				  </div>
				  <div class="col-xs-2" style="margin-left: 10px;">
				     <input id="ser" name="ser"  class="form-control input-sm" type="text" value="<ww:property value='ser' />" style="width: 110px;" /> 
				  </div> 
				  <div class="col-xs-1" style="width: 30px;margin:0px -30px 0px -50px;" >
				     	<button  onclick="selzxtime()" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  <div>
				     	<button onclick="outPeopleFace()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00658' /></button><!-- 导出日志-->
				  </div> 
		       </div>	
		</div>
		
        <!--显示内容-->
        <div style="height: 400px;text-align:center;">
          <!-- 固定标题 -->
          <div style="width:1030px;padding-right:17px;">
	            <table border="0" cellspacing="0" cellpadding="0">
	              <tr class="cell_element cell_first">
					<td style="width:20%"><ww:property value='#session.local.a00038' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00040' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00041' /></td>
					<td style="width:20%"><ww:property value='#session.local.b00116' /></td>
					<td style="width:20%">
							<ww:property value='#session.local.a00016' />
				    </td>
				
				  </tr>
	            </table>
            </div>
            <div style="width: 1040px;height: 390px;overflow: auto;overflow-y:scroll;margin-top:-20px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="countPeopleList">
					
						<tr class="cell_element cell_show">
						  <td style="width:20%">
							  <ww:if test="name.length()>15"><ww:property  value="name.substring(0,15)"/>...</ww:if>
			   				  <ww:else><ww:property value='name' /></ww:else>
						  </td>
						  <td style="width:20%"><ww:property value='mark' /></td>
						  <td style="width:20%"><ww:property value='ip' /></td>
						  <td style="width:20%"><ww:property value='countPeople' /></td>
					  	  <td style="width:20%">
						  		
						  		
						  		
						  		<i   title="<ww:property value='#session.local.a00752' />" onclick="count_people_info('<ww:property value='mark'/>')"  class="icon icon-align-justify" style="cursor: pointer;" onclick="count_people_chart('<ww:property value='mark'/>')"></i>
						  		
						  		
						  		<i   title="<ww:property value='#session.local.b00115' />" class="icon icon-bar-chart-alt" style="cursor: pointer;"  onclick="count_people_chart('<ww:property value='mark'/>')"></i>
							
								<i   title="<ww:property value='#session.local.b00069' /><ww:property value='#session.local.b00112' /><ww:property value='#session.local.a00752' />" 
								onclick="count_people_info_faceorwife('<ww:property value='mark'/>',1)"  class="icon icon-align-justify" style="cursor: pointer;" onclick="count_people_chart('<ww:property value='mark'/>')"></i>
						  		
						  		
						  		<i   title="<ww:property value='#session.local.b00069' />WIFE<ww:property value='#session.local.a00752' />" "
						  		 onclick="count_people_info_faceorwife('<ww:property value='mark'/>',2)"  class="icon icon-align-justify" style="cursor: pointer;" onclick="count_people_chart('<ww:property value='mark'/>')"></i>
						  		
					      </td>
							
							
					  	  
						</tr>
					</ww:iterator>
				</table>
			</div>
		</div>
		
        <!--分页-->
		<div class="nav" style="width: 1030px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toPeopleCountList.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toPeopleCountList.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toPeopleCountList.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toPeopleCountList.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toPeopleCountList.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('zxtimeist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toPeopleCountList.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'toPeopleCountList.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toPeopleCountList.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'toPeopleCountList.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--分组-->
            <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
            <!--时间类型-->
            <input type="hidden" name="datemode" id="datemode" value="<ww:property value='datemode'/>" />
            <input type="hidden" name="zdybtime" id="zdybtime" value="<ww:property value='zdybtime'/>" />
            <input type="hidden" name="zdyetime" id="zdyetime" value="<ww:property value='zdyetime'/>" />
		</div>
	</div>
</div>
</form>
</body>
</html>
