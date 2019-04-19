<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>


<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>

<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/constant.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>


<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />


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
	   
   document.getElementById("onTime").value=clock;
}


//显示或隐藏宝箱样式
function  sendstyleonclick(){
	var code = document.getElementById('code').value;	
			
	var styleImg = document.getElementById('styleImg').value;	
	
	if (styleImg.length < 1){			
		document.getElementById("sendtypeclick").style.display="";
	}else{		
		document.getElementById("sendtypeclick").style.display="none";		
		$('#url').val(''); 
		$('#img').val(''); 
		$('#item').val(''); 	
		document.getElementById("sendcode").style.display="none";
     	document.getElementById("sendurl").style.display="none";
     	document.getElementById("sendimg").style.display="none";
     	document.getElementById("senditem").style.display="none";
		}	

	if (code.length >1) {		
		 $('#url').val(""); 	
		 $('#item').val(""); 
	}
}

function sendonclick(){
 
	 var show="";
     var apm = document.getElementsByName("sendtypes");
     for(var i=0;i<apm.length;i++){
     if(apm[i].checked)
      show = apm[i].value;
     }
     var code = document.getElementById('code').value;
     if (code.length > 1) {
    	layer.msg("<ww:property value='#session.local.c00028' />");
    	show="4";
	 }
     var styleImg = document.getElementById('styleImg').value;
     if (styleImg.length < 1) {
     	layer.msg("<ww:property value='#session.local.c00055' />!");
     	 return;
 	 }     
     switch (show){
     case '0':    	
			document.getElementById("sendcode").style.display="";
	        document.getElementById("sendurl").style.display="none";
	        document.getElementById("sendimg").style.display="none";
	        document.getElementById("senditem").style.display="none";
	        break;		           
     case '1':
    	 document.getElementById("sendcode").style.display="none";
         document.getElementById("sendurl").style.display="";
         document.getElementById("sendimg").style.display="none";
         document.getElementById("senditem").style.display="none";
         break;
     case '2':
    	 document.getElementById("sendcode").style.display="none";
         document.getElementById("sendurl").style.display="none";
         document.getElementById("sendimg").style.display="";
         document.getElementById("senditem").style.display="none";
         break; 
     case '3':    	 
    	 document.getElementById("sendcode").style.display="none";
         document.getElementById("sendurl").style.display="none";
         document.getElementById("sendimg").style.display="none";
         document.getElementById("senditem").style.display="";
         break;  
     default:
     	document.getElementById("sendcode").style.display="none";
     	document.getElementById("sendurl").style.display="none";
     	document.getElementById("sendimg").style.display="none";
     	document.getElementById("senditem").style.display="none";
        break;                                                              
 }

}

//保存
function addtreasure(){
			
	var treasureName = document.getElementById('treasureName').value;		
	var onStatus = document.getElementById('onStatus').value;	
	var treasureType = document.getElementById('treasureType').value;	
	var onTime = document.getElementById('onTime').value;	
	var offTime = document.getElementById('offTime').value;		
	var code1 = document.getElementById('code1').value;
	var code = document.getElementById('code').value;
	var url = document.getElementById('url').value;
	var img = document.getElementById('img').value;
	var item = document.getElementById('item').value;	
	var treasureHeight = document.getElementById('treasureHeight').value;	
	var treasureWidth = document.getElementById('treasureWidth').value;	
	var cimgHeight = document.getElementById('cimgHeight').value;	
	var cimgWidth = document.getElementById('cimgWidth').value;	
	
	if (treasureName.length < 1){
    	 layer.msg("<ww:property value='#session.local.a00260' />!");
         return;
	}			
	if (onStatus.length < 1){
   	 layer.msg("<ww:property value='#session.local.c00030' />!");
        return;
	}	
	if (treasureType.length < 1){
   	 layer.msg("<ww:property value='#session.local.c00031' />!");
        return;
	}else{
		var types=$('input:radio[name="treasureType"]:checked').val();
		if (types=="<ww:property value='#session.local.c00023' />") {
			var styleImg = document.getElementById('styleImg').value;
			if (styleImg.length < 1) {
				layer.msg("<ww:property value='#session.local.c00050' />!");
		        return;
			}else {				
				if (code1.length < 1&&url.length < 1&&img.length < 1&&item.length < 1) {
					layer.msg("<ww:property value='#session.local.c00051' />!");
			        return;
				}
				
			}
			
		}else if (types=="<ww:property value='#session.local.c00024' />") {
			var treasureName = document.getElementById('code').value;
			if (treasureName.length < 1&&code1.length<1) {
				layer.msg("<ww:property value='#session.local.c00052' />!");
		        return;
			}	
		}
		
		
	}
		
	if (code1.length > 1&&url.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00057' />!");
		$('#code1').val(''); 
		$('#url').val(''); 
        return;
	}	
	if (code1.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#code1').val(''); 
		$('#img').val('');
		$('#imgHeight').val('');
		$('#imgWidth').val(''); 
        return;
	}	
	if (code1.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00059' />!");
		$('#code1').val(''); 
		$('#item').val('');
		$('#itemId').val('');	
        return;
	}	
	
	if (url.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00060' />!");
		$('#url').val(''); 
		$('#img').val(''); 
        return;
	}	
	if (url.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00061' />!");
		$('#url').val(''); 
		$('#item').val('');
		$('#itemId').val('');  	
        return;
	}

	if (item.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00062' />!");
		$('#item').val(''); 
		$('#img').val(''); 
		$('#itemId').val('');
        return;
	}			
	if (treasureHeight < 1&&cimgHeight<1){
   	 layer.msg("<ww:property value='#session.local.c00063' />!");
        return;
	}
	if (treasureWidth < 1&&cimgWidth<1){
  	 layer.msg("<ww:property value='#session.local.c00064' />!");
       return;
	}	   
			
	if (onTime.length < 1){
    	 layer.msg("<ww:property value='#session.local.c00032' />!");
         return;
	}
	if (offTime.length < 1){
   	 layer.msg("<ww:property value='#session.local.c00033' />!");
        return;
	}	   
       	    	
	//判断下载时间和开始播放时间
	 if(!comptime(onTime,offTime)){
		 alert("<ww:property value='#session.local.a00544' />");
		   return;
	 
   	 }
	document.form1.action = 'treasureaddlist.vs';
	document.form1.submit(); 	
}
//节目
function openItem(){
	layer.open({
 		type: 2,
         area: ['600px', '530px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toaddtreasureitem.vs',      
         scrollbar: false,
         end: function(){
			 var itemname=window.returnValue;
			 
			 var items=itemname.split("|");
			 
			 var name=items[0];
			 
			 var id=items[1];

			$("#itemId").val(id);
				 
			$("#item").val(name);		
		 }
	});
	
}
//分宝箱
function treasureTypes(){
	$('#code').val('');
	
	$('#cimgHeight').val('');
	$('#cimgWidth').val('');
	
	 document.getElementById("treasuresStyle").style.display="";
	 document.getElementById("sendtypeclick").style.display="";
	 document.getElementById("treasuresCode").style.display="none";
	 
}
//二维码
function treasureCode(){
	
	document.getElementById("treasuresStyle").style.display="none";	
	document.getElementById("sendtypeclick").style.display="none";	
	document.getElementById("treasuresCode").style.display="";
	document.getElementById("sendcode").style.display="none";	
  	document.getElementById("sendurl").style.display="none";  		
  	document.getElementById("sendimg").style.display="none";  	
  	document.getElementById("senditem").style.display="none";
  	$('#itemId').val('');
	$('#img').val(''); 
	$('#url').val(''); 
	$('#code1').val('');
	$('#styleImg').val('');
	
	$('#cimgHeight1').val('');
	$('#cimgWidth1').val('');
	$('#imgHeight').val('');
	$('#imgWidth').val('');
	$('#treasureHeight').val('');
	$('#treasureWidth').val('');
  	
}
</script>

</head>
<body>
<form  name="form1" method="post" enctype="multipart/form-data">
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
	                    <table class="insert-tab" width="100%">
	                        <tbody>
	                        
	                        	 <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00016' />：</th>
	                                <td>
	                                     <input  class="common-text required"  id="treasureName" name="treasureName" value=""  type="text"/>
	                                </td>
	                            </tr> 
	                            
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00017' />：</th>
	                                <td>
	                                    <input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="未上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00018' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="待上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00019' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="活动中"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00020' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="已下线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00021' /></span>	                              	                               	                               	                               	                            
	                                </td>
	                            </tr> 
	                            
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00022' />：</th>
	                                <td>
	                                   <input style="cursor: pointer;" class="common-text  "  id="treasureType" name="treasureType" value="分宝箱"  type="radio" onclick="treasureTypes()" checked="checked"/>&nbsp;<span><ww:property value='#session.local.c00023' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="treasureType" name="treasureType" value="二维码活动"  type="radio" onclick="treasureCode()"/>&nbsp;<span><ww:property value='#session.local.c00024' /></span>
	                               	</td>
	                            </tr>
	                                                         	                        
	                        	 <tr id="treasuresCode" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00010' />：</th>
	                                <td>
	                                     <input style="cursor: pointer;margin-top:8px;" class="common-text required" id="code" name="codeName" value=""  type="file""/>
	                                      	<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="cimgHeight" name="treasureHeight" value="" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="cimgWidth" name="treasureWidth" value=""  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                                     
	                                </td>
	                            </tr> 	                        	   
	                        	
	                        	<tr id="treasuresStyle">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00011' />：</th>
	                                <td>
	                                	<span><input style="cursor: pointer;margin-top:8px;" class="common-text required" onclick="sendstyleonclick()" id="styleImg" name="styleImgName" value=""  type="file"/>	  </span>                         	                          	                                								
										<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="treasureHeight" name="treasureHeight" value="" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="treasureWidth" name="treasureWidth" value=""  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                           </td>
	                            </tr> 
	                        
	                        	 <tr id="sendtypeclick">
	                        	 
	                                <th><i class="require-red">*</i><ww:property value='#session.local.c00012' />：</th>
	                                <td>	
	                                	                                	                            	                              
								        <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="0"  id="sendtypes" name="sendtypes"/>
								      	&nbsp;<span><ww:property value='#session.local.c00009' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="1"  id="sendtypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00013' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="2"  id="sendtypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00014' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="3" id="sendtypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00015' /></span>
		                              
	                                </td>
	                            </tr>
	                            	                            	                           
	                           <tr  id="sendcode" style="display: none;" >
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00009' />：</th>
	                                <td>
	                               		 <input style="cursor: pointer;margin-top:8px;" class="common-text required " id="code1" name="codeName" value=""  type="file"/>	
	                               		      	<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="cimgHeight1" name="imgHeight" value="" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="cimgWidth1" name="imgWidth" value=""  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                                                            						      
	                                </td>
	                            </tr>
	                             <tr id="sendurl" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00013' />：</th>
	                                <td>
	                                 	<label>http://</label><input style="cursor: pointer;" class="common-text required " id="url" name="url" type="text" value="" spellcheck="false"/>
					                
	                               	  </td>
	                            </tr>
	                             <tr id="sendimg" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00014' />：</th>
	                                <td>
	                               		 <input style="cursor: pointer;margin-top:8px;" class="common-text required " id="img" name="imgName" value=""  type="file"/>	  
	                               		     	<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="imgHeight" name="imgHeight" value="" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="imgWidth" name="imgWidth" value=""  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                                                   						      
	                                </td>
	                            </tr>
	                             <tr id="senditem" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00015' />：</th>
	                                <td>
	                               		 <input class="common-text required " id="item" name="item" value=""  type="text"/>
	                               		<input style="cursor: pointer;" onclick="openItem()" class="common-text required " id="itemInfo" name="itemInfo" value="<ww:property value='#session.local.a00415' />"  type="button"/>
	                             	                              
	                                </td>
	                            </tr>	                            	                            	                            	                        	                       	                           	                             	                            
	                          
	                            <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00026' />：</th>
	                                 <td>
	                               
								     <input id="onTime" type="text" name="onTime"  style="height: 22px;width: 180px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
								      								    		                              		                              
	                                </td>
	                            </tr> 
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00027' />：</th>
	                                <td>
	                                
	                               	<input id="offTime" type="text" name="offTime"  style="height: 22px;width: 180px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
		                              
	                               	</td>
	                            </tr> 
	                             
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00066' />：</th>
	                                <td>
	                               <input  class="common-text required"  id="showTime" name="showTime" value=""  type="text" oninput="value=value.replace(/[^\d]/g,'')"/>
	                               <span><ww:property value='#session.local.a00106' /></span>   
	                               	</td>
	                            </tr>
	                             <tr style="display: none;">
	                                <th width="40%"><i class="require-red">*</i>获取节目id:</th>
	                                <td>
	                               <input  class="common-text required"  id="itemId" name="itemId" value=""  type="text" readonly="readonly"/>	                         
	                               	</td>
	                            </tr>
	                             	                            	                               
	                            <tr>
	                                <th height="60px"></th>
	                                <td>
	                                  
	                                     <button class="btn btn-primary" onclick='addtreasure()' type="button"><ww:property value='#session.local.a00080' /></button>
	                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
		            </div>
		        </div>
		     </div>
       </div>
   </form>

</body>
</html>