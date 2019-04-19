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
<style type="">
    

</style>
<script type="text/javascript">

//设置滚动位置
//var positionValue = $(this).attr("value");
//setMessagePosition(positionValue);
 $(function(){

  //初始化显示位置
  setMessagePosition(0);
  
  	 
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
         }else{
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
	
	var bcolor=document.getElementById("bcolor").value;

    var fs = document.getElementById("fs").value;

	var fcolor = document.getElementById("fcolor").value;

	var mDirection = document.getElementById("mDirection").value;

	var txtcontent = document.getElementById("txtcontent").value;

	if(txtcontent.length==0){

		layer.alert("<ww:property value='#session.local.a00182'  />");
		return;

    }
		   
    document.form1.action="adddata.vs";
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
		                        
		                     
		                            <!-- 内容 -->
		                          <tr>
		                            
		                              <th><i class="require-red">*</i><ww:property value='#session.local.a00206' />:</th>
		                              <td style="padding-top: 5px;padding-bottom: 5px;">
		                                     
		                                  <textarea name="txtcontent" id="txtcontent"  rows="8"  cols="40"><ww:property value="txtcontent"/></textarea>
		                                  
		                              </td>
		                           </tr>
		                            <!-- 样式 -->
		                            <tr>
		                            
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00537' />:</th>
		                                <td>
		                                    <div >
		                                      <!-- 背景颜色 -->
									          <ww:property value='#session.local.a00358' />
											  <select name="bcolor" id="bcolor">
<!--											  <option value="0"><ww:property value="#session.local.b00200" /></option> 默认 -->
                                                  <option  <ww:if test="bcolor==0"> selected="selected"  </ww:if> value="0"><ww:property value='#session.local.a00366' /></option>
												  <option  <ww:if test="bcolor==-65536"> selected="selected"  </ww:if>  value="-65536"><ww:property value='#session.local.a00338' /></option> 
												  <option  <ww:if test="bcolor==-16776961"> selected="selected"  </ww:if>  value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option  <ww:if test="bcolor==-256"> selected="selected"  </ww:if>  value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option  <ww:if test="bcolor==-16711936"> selected="selected"  </ww:if>  value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option  <ww:if test="bcolor==-2"> selected="selected"  </ww:if>  value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option  <ww:if test="bcolor==-7829368"> selected="selected"  </ww:if>  value="-7829368"><ww:property value='#session.local.a00343' /></option>
												  <option  <ww:if test="bcolor==-16777216"> selected="selected"  </ww:if> value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  
											  </select>
											  <!-- 字体颜色 -->
										      <ww:property value='#session.local.a00325' />
											  <select name="fcolor" id="fcolor">
<!--											  <option value="-16777216"><ww:property value="#session.local.b00200" /></option>-->
                                                  
                                                  <option  <ww:if test="fcolor==-16777216"> selected="selected"  </ww:if>  value="-16777216"><ww:property value='#session.local.a00337' /></option>
												  <option  <ww:if test="fcolor==-65536"> selected="selected"  </ww:if>  value="-65536"><ww:property value='#session.local.a00338' /></option>
												  <option  <ww:if test="fcolor==-16776961"> selected="selected"  </ww:if>  value="-16776961"><ww:property value='#session.local.a00339' /></option>
												  <option  <ww:if test="fcolor==-256"> selected="selected"  </ww:if>  value="-256"><ww:property value='#session.local.a00342' /></option>
												  <option  <ww:if test="fcolor==-16711936"> selected="selected"  </ww:if>  value="-16711936"><ww:property value='#session.local.a00341' /></option>
												  <option  <ww:if test="fcolor==-2"> selected="selected"  </ww:if>  value="-2"><ww:property value='#session.local.a00340' /></option>
												  <option  <ww:if test="fcolor==-7829368"> selected="selected"  </ww:if>  value="-7829368"><ww:property value='#session.local.a00343' /></option>
												 
											  </select>
								
                                          </div>
		                                </td>
		                            </tr>
		                            
<!-- 		                            <tr> -->
<!-- 		                              <td>兼容</td> -->
<!-- 		                              <td style="text-align: center;"> -->
		                              
<!-- 		                                 <input type="checkbox"  /> -->
		                                 
<!-- 		                                (兼容6.1低版本的apk6月份之前) -->
		                              
<!-- 		                              </td> -->
<!-- 		                            </tr> -->
		                            
		                            <tr>
		                            
		                            <th></th>
		                                <td>
		                                     <!-- 字体大小 --> 
		                                     <ww:property value='#session.local.a00324' /> 
											 <select name="fs"  id="fs">
											        <option   <ww:if test="fs==-1"> selected="selected"  </ww:if>     value="-1"><ww:property value="#session.local.b00226" /></option>
                                                    <option   <ww:if test="fs==16"> selected="selected"  </ww:if>     value="16"><ww:property value="#session.local.b00038" /></option>
											        <option   <ww:if test="fs==24"> selected="selected"  </ww:if>     value="24"><ww:property value="#session.local.b00039" /></option>
											        <option   <ww:if test="fs==36"> selected="selected"  </ww:if>     value="36"><ww:property value="#session.local.b00040" /></option>
											        <option   <ww:if test="fs==48"> selected="selected"  </ww:if>     value="48"><ww:property value="#session.local.b00041" /></option>
											        <option   <ww:if test="fs==72"> selected="selected"  </ww:if>     value="72"><ww:property value="#session.local.b00042" /></option>
											 </select>
											 <!-- 滚动方式 -->
										     <ww:property value='#session.local.a00333' />
										     
											 <select name="mDirection"  id="mDirection">
											 
                                                    <option <ww:if test='mDirection==2'>selected="selected"</ww:if> value="2"><ww:property value="#session.local.a00369" /></option><!-- 静态文本 -->
						                            <option <ww:if test='mDirection==0'>selected="selected"</ww:if> value="0"><ww:property value="#session.local.a00370" /></option><!-- 向上滚动 -->
						                            <option <ww:if test='mDirection==1'>selected="selected"</ww:if> value="1"><ww:property value="#session.local.a00372" /></option><!-- 向左滚动 -->
						                            <option <ww:if test='mDirection==3'>selected="selected"</ww:if> value="3"><ww:property value="#session.local.a00371" /></option><!-- 向下滚动 -->
											 
											  </select>
											
		                                </td>
		                            </tr>
		                           
		                            <tr>
		                                <td colspan="3"  >
		                                    <button  style="margin-left: 380px;" class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
		                                    <button class="btn btn-primary" onclick="closeDig()" type="button"><ww:property value='#session.local.a00014' /></button>
		                                </td>
		                            </tr>
		                        </tbody>
		                   </table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
    <input type="hidden" value="<ww:property value='did'/>"  name="did"   id="did" />   
   
   </form>
</body>
</html>
