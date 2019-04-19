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
	var code = document.getElementById('codetext').value;				
	var styleImg = document.getElementById('styleImg').value;	
	if (styleImg.length < 1){			
		document.getElementById("sendtypeclick").style.display="";
	}else{		
		document.getElementById("sendtypeclick").style.display="none";		
		$('#url').val(''); 
		$('#imgnametext').val(''); 
		$('#img').val(''); 
		$('#item').val(''); 	
		document.getElementById("sendcode").style.display="none";
     	document.getElementById("sendurl").style.display="none";
     	document.getElementById("sendimg").style.display="none";
     	document.getElementById("senditem").style.display="none";
		}	

	if (code.length >1) {		
		 $('#url').val(""); 	
		 $('#imgnametext').val(""); 
		 $('#item').val(""); 
	}
}
//显示、隐藏宝箱内容类型
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
    	 $('#url').val(""); 	
		 $('#imgnametext').val(""); 
		 $('#item').val(""); 
    	show="4";
	 }
     var codenametext = document.getElementById('codenametext').value;    
     if (codenametext.length > 1) {
    	layer.msg("<ww:property value='#session.local.c00028' />");
    	show="4";
	 }
     var styleImgnametext = document.getElementById('styleImgnametext').value;   
     var styleImg = document.getElementById('styleImg').value;
     if (styleImg.length < 1 && styleImgnametext.length < 1) {
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
	var imgnametext = document.getElementById('imgnametext').value;	
	var codenametext = document.getElementById('codenametext').value;
	var codenametext1 = document.getElementById('codenametext1').value;
	var styleImg = document.getElementById('styleImg').value;
	var styleImgnametext = document.getElementById('styleImgnametext').value;	
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
												
				if (styleImg.length < 1&&styleImgnametext.length < 1) {
					layer.msg("<ww:property value='#session.local.c00050' />!");					
			        return;
				}else {					
					if (code1.length < 1&&url.length < 1&&img.length < 1&&item.length < 1&&codenametext1< 1) {
						layer.msg("<ww:property value='#session.local.c00051' />!");
				        return;
					}					
				}
				
			}else if (types=="<ww:property value='#session.local.c00024' />") {
				var styleImg = document.getElementById('styleImg').value;
				var styleImgnametext = document.getElementById('styleImgnametext').value;							
				if (code.length < 1&&code1.length < 1&&codenametext.length < 1) {
					layer.msg("<ww:property value='#session.local.c00052' />!");
			        return;
				}	
			}
						
		}

	if (codenametext.length < 1&&code.length < 1) {		
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
	}	
	if (styleImg.length < 1&&styleImgnametext.length < 1) {
		$('#treasureWidth').val('');    
		$('#treasureHeight').val('');
	}

	if (code.length > 1&&code1.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00056' />!");
		$('#code1').val('');
		$('#code').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}			
	if (code.length > 1&&url.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00057' />!");
		$('#url').val(''); 
		$('#code').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');		
        return;
	}	
	if (code.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#img').val('');
		$('#code').val(''); 
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
        return;
	}
	if (code.length > 1&&imgnametext.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#imgnametext').val('');
		$('#code').val('');
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val(''); 
        return;
	}		
	if (code.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00059' />!");
		$('#item').val(''); 
		$('#itemId').val('');
		$('#code').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');			
        return;
	}

	if (codenametext.length > 1&&code1.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00056' />!");
		$('#codenametext').val('');
		$('#code1').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}			
	if (codenametext.length > 1&&url.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00057' />!");
		$('#url').val(''); 
		$('#codenametext').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');		
        return;
	}	
	if (codenametext.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#img').val(''); 
		$('#codenametext').val('');
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
        return;
	}
	if (codenametext.length > 1&&imgnametext.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#imgnametext').val(''); 
		$('#codenametext').val('');
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');
        return;
	}	
	if (codenametext.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00059' />!");
		$('#item').val(''); 
		$('#itemId').val('');
		$('#codenametext').val('');	
		$('#cimgHeight').val('');
		$('#cimgWidth').val('');		
        return;
	}	
	
	if (code1.length > 1&&url.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00057' />!");
		$('#code1').val(''); 
		$('#url').val(''); 		
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}	
	if (code1.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#code1').val(''); 
		$('#img').val(''); 
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}	
	if (code1.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00059' />!");
		$('#code1').val(''); 
		$('#item').val(''); 
		$('#itemId').val('');		
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');	
        return;
	}	
	
	if (codenametext1.length > 1&&code1.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00056' />!");
		$('#code1').val('');
		$('#codenametext1').val('');		
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}	
		
	if (codenametext1.length > 1&&url.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00057' />!");
		$('#url').val(''); 
		$('#codenametext1').val('');		
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}	
	if (codenametext1.length > 1&&img.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#img').val(''); 
		$('#codenametext1').val('');
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}
	if (codenametext1.length > 1&&imgnametext.length > 1) {		
		layer.msg("<ww:property value='#session.local.c00058' />!");
		$('#img').val(''); 
		$('#imgHeight').val('');
		$('#imgWidth').val('');
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}	
	if (codenametext1.length > 1&&item.length > 1) {
		layer.msg("<ww:property value='#session.local.c00059' />!");
		$('#item').val(''); 
		$('#itemId').val('');	
		$('#codenametext1').val('');		
		$('#cimgHeight1').val('');
		$('#cimgWidth1').val('');
        return;
	}
					
	if (url.length > 1&&imgnametext.length > 1) {				
		layer.msg("<ww:property value='#session.local.c00060' />!");
		$('#url').val(''); 
		$('#imgnametext').val(''); 
		$('#img').val(''); 
        return;
	}	
	if (item.length > 1&&imgnametext.length > 1) {				
		layer.msg("<ww:property value='#session.local.c00062' />!");
		$('#item').val(''); 
		$('#imgnametext').val(''); 	
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
	
	document.form1.target = "_self";   	 
	document.form1.action = 'treasureeditlist.vs';
	document.form1.submit(); 	  	 
}
//打开节目列表
function openItem(){
	var id = document.getElementById('id').value;	
	
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
//初始化
function init_self(id){	

	$.ajax({
		type: "get",
		url: "ajaxedittreasure.vs?id="+id,
		dataType: "json",
		success: function(data){

		var styleImg=data.data.treasureitemlist[0].styleImg;
		var code=data.data.treasureitemlist[0].code;
		if (styleImg.length < 1){						
			document.getElementById("treasuresCode").style.display="";
			document.getElementById("treasuresStyle").style.display="none";	
			document.getElementById("sendtypeclick").style.display="none";	
			document.getElementById("treasuresCode").style.display="";
			document.getElementById("sendcode").style.display="none";	
		  	document.getElementById("sendurl").style.display="none";  		
		  	document.getElementById("sendimg").style.display="none";  	
		  	document.getElementById("senditem").style.display="none";	
			$('#codenametext').val(code);
		  				  	
		}else {
			document.getElementById("treasuresCode").style.display="none";	
			document.getElementById("sendtypeclick").style.display="";
				
			if (code.length < 1){
				document.getElementById("sendcode").style.display="none";				
			}else{
				document.getElementById("sendcode").style.display="";
				$("#sendcodetypes").attr("checked","checked");
				$('#codenametext1').val(code);							
			}
				
			var url=data.data.treasureitemlist[0].url;	
			if (url.length < 1){
				document.getElementById("sendurl").style.display="none";
			}else{
				document.getElementById("sendurl").style.display="";
				$("#sendurltypes").attr("checked","checked");
			}

			var skipImg=data.data.treasureitemlist[0].skipImg;	
			if (skipImg.length < 1){
				document.getElementById("sendimg").style.display="none";
			}else{
				document.getElementById("sendimg").style.display="";
				$("#sendimgtypes").attr("checked","checked");
				$('#imgnametext').val(skipImg);
			}
			
			var itemName=data.data.treasureitemlist[0].itemName;	
			if (itemName.length < 1){
				document.getElementById("senditem").style.display="none";
			}else{
				document.getElementById("senditem").style.display="";
				$("#senditemtypes").attr("checked","checked");
			}
		
		}
														  
	   }	   
	});	
}
//二维码预览
function treasure_code_preview(){

	var code = document.getElementById('codenametext').value;	
	var seeheight = document.getElementById('cimgHeight').value;	
	var seewidth = document.getElementById('cimgWidth').value;	
	if(code<1){
		 layer.msg("<ww:property value='#session.local.c00046' />!");
	}else{

		layer.open({
	 	    type: 2,
	 	    title: false,
	 	    area: ['620px', '520px'],
	 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	 	    content: "seetreasurecode.vs?code="+code+"&seeheight="+seeheight+"&seewidth="+seewidth
	 	 	
	 	});
		
	}			
}
function treasure_code1_preview(){

	var code = document.getElementById('codenametext1').value;	
	var seeheight = document.getElementById('cimgHeight1').value;	
	var seewidth = document.getElementById('cimgWidth1').value;			
	if(code<1){
		 layer.msg("<ww:property value='#session.local.c00046' />!");
	}else{

		layer.open({
	 	    type: 2,
	 	    title: false,
	 	    area: ['620px', '520px'],
	 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	 	    content: "seetreasurecode.vs?code="+code+"&seeheight="+seeheight+"&seewidth="+seewidth
	 	 	
	 	});
		
	}			
}
//宝箱样式预览
function treasure_styleImg_preview(){

	var styleImg = document.getElementById('styleImgnametext').value;	
	var seeheight = document.getElementById('treasureHeight').value;	
	var seewidth = document.getElementById('treasureWidth').value;	
	if(styleImg<1){
		 layer.msg("<ww:property value='#session.local.c00047' />!");
	}else{

		layer.open({
	 	    type: 2,
	 	    title: false,
	 	    area: ['620px', '520px'],
	 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	 	    content: "seetreasurecode.vs?styleImg="+styleImg+"&seeheight="+seeheight+"&seewidth="+seewidth
	 	});
		
	}			
}
//img预览
function treasure_img_preview(){

	var img = document.getElementById('imgnametext').value;	
	var seeheight = document.getElementById('imgHeight').value;	
	var seewidth = document.getElementById('imgWidth').value;	
	
	if(img<1){
		 layer.msg("<ww:property value='#session.local.c00048' />!");
	}else{

		layer.open({
	 	    type: 2,
	 	    title: false,
	 	    area: ['620px', '520px'],
	 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	 	    content: "seetreasurecode.vs?skipImg="+img+"&seeheight="+seeheight+"&seewidth="+seewidth
	 	});
		
	}			
}
//二维码
function treasure_codename(){

	var code = document.getElementById('code').value;
	if (code.length>1) {
		$('#codenametext').val(''); 
		document.getElementById("codetext").style.display="none";
	}else {
		document.getElementById("codetext").style.display="";
	}
	
}
//img
function treasure_imgname(){

	var img = document.getElementById('img').value;
	
	if (img.length>1) {
		$('#imgnametext').val(''); 
		document.getElementById("imgtext").style.display="none";
	}else {
		document.getElementById("imgtext").style.display="";
	}
	
}

//styleImg
function treasure_styleImgname(){

	var styleImg = document.getElementById('styleImg').value;
	var treasureHeight = document.getElementById('treasureHeight').value;	
	var treasureWidth = document.getElementById('treasureWidth').value;	
	if (styleImg.length>1) {
		$('#styleImgnametext').val(''); 
		document.getElementById("styleImgtext").style.display="none";
	}else {
		document.getElementById("styleImgtext").style.display="";
	}


	
	if (treasureHeight < 1){
	   	 layer.msg("<ww:property value='#session.local.c00063' />!");
	        return;
		}
	if (treasureWidth < 1){
  	 layer.msg("<ww:property value='#session.local.c00064' />!");
       return;
	}	 
	
}
//重选二维码
function treasure_code_reelect(){

	document.getElementById("code").style.display="";
	$('#codenametext').val(''); 
	document.getElementById("codetext").style.display="none";
}
function treasure_code1_reelect(){

	document.getElementById("code1").style.display="";
	$('#codenametext1').val(''); 
	document.getElementById("codetext1").style.display="none";
}
//重选宝箱样式图片
function treasure_styleImg_reelect(){

	document.getElementById("styleImg").style.display="";
	$('#styleImgnametext').val(''); 
	document.getElementById("styleImgtext").style.display="none";	
	document.getElementById("sendtypeclick").style.display="none";
	
	$('#url').val(''); 
	$('#imgnametext').val(''); 
	$('#img').val(''); 
	$('#item').val(''); 	
	document.getElementById("sendcode").style.display="none";
 	document.getElementById("sendurl").style.display="none";
 	document.getElementById("sendimg").style.display="none";
 	document.getElementById("senditem").style.display="none";
	
}
//重选图片
function treasure_img_reelect(){

	document.getElementById("img").style.display="";
	$('#imgnametext').val(''); 
	document.getElementById("imgtext").style.display="none";
}
//分宝箱
function treasureTypes(){
	$('#code').val('');
	$('#codenametext').val('');
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
	$('#styleImgnametext').val('');
	$('#codenametext1').val('');
	$('#imgnametext').val('');
}
</script>
</head>
<body onload="init_self(<ww:property value="id"/>)">
<form  name="form1" method="post" enctype="multipart/form-data">
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
	                    <table class="insert-tab" width="100%">
	                        <tbody>
	                        	 <tr style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00016' />：</th>
	                                <td>
	                                     <input  class="common-text required"  id="id" name="id" value="<ww:property value="id"/>"  type="text"/>
	                                </td>
	                            </tr> 
	                        
	                        	 <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00016' />：</th>
	                                <td>
	                                     <input  class="common-text required"  id="treasureName" name="treasureName" value="<ww:property value="treasureName"/>"  type="text"/>
	                                </td>
	                            </tr> 
	                            
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00017' />：</th>
	                                <td>
	                               	 <ww:if test="onStatus=='未上线'">
							           	<input style="cursor: pointer;" checked="checked" class="common-text  "  id="onStatus" name="onStatus" value="未上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00018' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="待上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00019' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="活动中"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00020' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="已下线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00021' /></span>	                              	                               	                               	                               	                            
	                               
								     </ww:if>
								      <ww:if test="onStatus=='待上线'">
							           	<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="未上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00018' /></span>
	                               		&nbsp;<input style="cursor: pointer;" checked="checked" class="common-text  "  id="onStatus" name="onStatus" value="待上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00019' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="活动中"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00020' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="已下线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00021' /></span>	                              	                               	                               	                               	                            
	                               
								     </ww:if>
								      <ww:if test="onStatus=='活动中'">
							           	<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="未上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00018' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="待上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00019' /></span>
	                              		&nbsp;<input style="cursor: pointer;" checked="checked" class="common-text  "  id="onStatus" name="onStatus" value="活动中"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00020' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="已下线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00021' /></span>	                              	                               	                               	                               	                            
	                               
								     </ww:if>
								      <ww:if test="onStatus=='已下线'">
							           	<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="未上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00018' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="待上线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00019' /></span>
	                              		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="onStatus" name="onStatus" value="活动中"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00020' /></span>
	                              		&nbsp;<input style="cursor: pointer;" checked="checked" class="common-text  "  id="onStatus" name="onStatus" value="已下线"  type="radio""/>&nbsp;<span><ww:property value='#session.local.c00021' /></span>	                              	                               	                               	                               	                            
	                               
								     </ww:if>
								    
	                               </td>
	                            </tr> 
	                            
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00022' />：</th>
	                                <td>
	                                <ww:if test="treasureType=='分宝箱'">
	                                    <input style="cursor: pointer;" checked="checked" class="common-text  "  id="treasureType" name="treasureType" value="分宝箱"  type="radio" onclick="treasureTypes()"/>&nbsp;<span><ww:property value='#session.local.c00023' /></span>
	                               		&nbsp;<input style="cursor: pointer;" class="common-text  "  id="treasureType" name="treasureType" value="二维码活动"  type="radio" onclick="treasureCode()"/>&nbsp;<span><ww:property value='#session.local.c00024' /></span>
	                              		
	                              	</ww:if>
	                               <ww:if test="treasureType=='二维码活动'">
	                                    <input style="cursor: pointer;" class="common-text  "  id="treasureType" name="treasureType" value="分宝箱"  type="radio" onclick="treasureTypes()"/>&nbsp;<span><ww:property value='#session.local.c00023' /></span>
	                               		&nbsp;<input style="cursor: pointer;" checked="checked" class="common-text  "  id="treasureType" name="treasureType" value="二维码活动"  type="radio" onclick="treasureCode()"/>&nbsp;<span><ww:property value='#session.local.c00024' /></span>
	                              	</ww:if>
	                               
	                                </td>
	                            </tr> 
	                              
	                        
	                        	 <tr id="treasuresCode">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00010' />：</th>
	                                <td>
	                                	<span id="codetext">
	                                	<input id="codenametext" name="codenametext" value=""  type="text" readonly="readonly"/>	                               	                               		
	                               		&nbsp;<a style="cursor: pointer;" onclick="treasure_code_preview()"><ww:property value='#session.local.a00026' /></a>
	                               		
	                               		&nbsp;&nbsp;<a style="cursor: pointer;" onclick="treasure_code_reelect()"><ww:property value='#session.local.c00049' /></a>
	                               		
	                               		</span>
	                               			                               		
	                               		<input style="cursor: pointer;display: none;margin-top:8px;" onchange="treasure_codename()" style="cursor: pointer;" class="common-text required" id="code" name="codeName" value=""  type="file"/>	                             	                               		
	                                  <div style="display:block;width:300px; ">
	                                   <span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="cimgHeight" name="treasureHeight" value="<ww:property value="treasureHeight"/>" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="cimgWidth" name="treasureWidth" value="<ww:property value="treasureWidth"/>"  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                              </div>
	                                </td>
	                            </tr> 
	                        	
	                        	<tr id="treasuresStyle">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00011' />：</th>
	                                <td>
	                                	<span id="styleImgtext">
	                                	<input id="styleImgnametext" name="styleImgnametext" value="<ww:property value="styleImg"/>"  type="text" readonly="readonly"/>	                               	                               		
	                               		&nbsp;<a style="cursor: pointer;" onclick="treasure_styleImg_preview()"><ww:property value='#session.local.a00026' /></a>
	                               		&nbsp;&nbsp;<a style="cursor: pointer;" onclick="treasure_styleImg_reelect()"><ww:property value='#session.local.c00049' /></a>	                               		
	                               		</span>
	                               		
	                                	<input style="cursor: pointer;display: none;margin-top:8px;" onclick="sendstyleonclick()" onchange="treasure_styleImgname()" class="common-text required" id="styleImg" name="styleImgName" value=""  type="file"/>	                             
	                              		<div style="display:block;width:300px; ">	                              		
	                              		<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="treasureHeight" name="treasureHeight" value="<ww:property value="treasureHeight"/>" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="treasureWidth" name="treasureWidth" value="<ww:property value="treasureWidth"/>"  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
				                       </div>		                           	                            			                              		
	                                </td>
	                            </tr> 
	                        
	                        	 <tr id="sendtypeclick" style="display: none;">
	                        	 
	                                <th><i class="require-red">*</i><ww:property value='#session.local.c00012' />：</th>
	                                <td>	
	                                	                                	                            	                              
								        <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="0"  id="sendcodetypes" name="sendtypes"/>
								      	&nbsp;<span><ww:property value='#session.local.c00009' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="1"  id="sendurltypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00013' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="2"  id="sendimgtypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00014' /></span>
								         <input  style="margin-top: -2px;cursor: pointer;" type="radio" onclick="sendonclick()"  value="3" id="senditemtypes" name="sendtypes"/>
								        &nbsp;<span><ww:property value='#session.local.c00015' /></span>
		                              
	                                </td>
	                            </tr>
	                            	                            	                           
	                           <tr id="sendcode" style="display: none;" >
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00009' />：</th>
	                                <td>
	                                	 <span id="codetext1">
	                                	<input id="codenametext1" name="codenametext" value=""  type="text" readonly="readonly"/>	                               	                               		
	                               		&nbsp;<a style="cursor: pointer;" onclick="treasure_code1_preview()"><ww:property value='#session.local.a00026' /></a>
	                               		
	                               		&nbsp;&nbsp;<a style="cursor: pointer;" onclick="treasure_code1_reelect()"><ww:property value='#session.local.c00049' /></a>
	                               		
	                               		</span>                                                             	
	                               		 <input style="cursor: pointer;display: none;margin-top:8px;" class="common-text required " id="code1" name="codeName" value="<ww:property value="code"/>"  type="file"/>	                             						      
	                                	<div style="display:block;width:300px; ">
	                                	  <span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="cimgHeight1" name="imgHeight" value="<ww:property value="imgHeight"/>" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="cimgWidth1" name="imgWidth" value="<ww:property value="imgWidth"/>"  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                              </div>
	                                </td>
	                            </tr>
	                             <tr id="sendurl" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00013' />：</th>
	                                <td>
	                               		 <input style="cursor: pointer;"  class="common-text required " id="url" name="url" value="<ww:property value="url"/>"  type="text" spellcheck="false"/>	                               						      
	                                </td>
	                            </tr>
	                             <tr id="sendimg" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00014' />：</th>
	                                <td>
	                                
	                                	<span id="imgtext">
	                                	<input id="imgnametext" name="imgnametext" value=""  type="text" readonly="readonly"/>	                               	                               		
	                               		&nbsp;<a style="cursor: pointer;" onclick="treasure_img_preview()"><ww:property value='#session.local.a00026' /></a>
	                               		&nbsp;&nbsp;<a style="cursor: pointer;" onclick="treasure_img_reelect()"><ww:property value='#session.local.c00049' /></a>
	                               		
	                               		</span>
	                               		 <input onchange="treasure_imgname()"  style="cursor: pointer;display: none;margin-top:8px;" class="common-text required " id="img" name="imgName" value=""  type="file"/>	                               						      
	                                	<div style="display:block;width:300px; ">
	                                	<span><ww:property value='#session.local.c00053' />(px)：<input style="width: 80px;" id="imgHeight" name="imgHeight" value="<ww:property value="imgHeight"/>" type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>                               
				                       &nbsp;<span><ww:property value='#session.local.c00054' />(px)：<input style="width: 80px;" id="imgWidth" name="imgWidth" value="<ww:property value="imgWidth"/>"  type="text" oninput="value=value.replace(/[^\d]/g,'')"/></span>
		                               </div>
	                                </td>
	                            </tr>
	                             <tr id="senditem" style="display: none;">
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00015' />：</th>
	                                <td>
	                               		 <input class="common-text required " id="item" name="item" value="<ww:property value="itemName"/>"  type="text" readonly="readonly"/>	                              		
	                               		<a style="cursor: pointer;" onclick="openItem()" id="itemInfo" name="itemInfo"><ww:property value='#session.local.a00415' /></a>	                               			                            	                              
	                                </td>
	                            </tr>	                            	                            	                            	                        	                       	                           	                             	                            
	                          
	                            <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00026' />：</th>
	                                 <td>
	                               
								     <input value="<ww:property value="onTime"/>"  id="onTime" type="text" name="onTime"  style="height: 22px;width: 180px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
								      								    		                              		                              
	                                </td>
	                            </tr> 
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00027' />：</th>
	                                <td>
	                                
	                               	<input value="<ww:property value="offTime"/>"  id="offTime" type="text" name="offTime"  style="height: 22px;width: 180px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
		                              
	                               	</td>
	                            </tr>
	                             
	                             <tr>
	                                <th width="40%"><i class="require-red">*</i><ww:property value='#session.local.c00066' />：</th>
	                                <td>
	                               <input  class="common-text required"  id="showTime" name="showTime" value="<ww:property value="showTime"/>" type="text" oninput="value=value.replace(/[^\d]/g,'')"/>
	                               <span><ww:property value='#session.local.a00106' /></span>   
	                               	</td>
	                            </tr>
	                            <tr style="display: none;">
	                                <th width="40%"><i class="require-red">*</i>获取节目id:</th>
	                                <td>
	                               <input  class="common-text required"  id="itemId" name="itemId" value="<ww:property value="itemId"/>"  type="text" readonly="readonly"/>	                         
	                               	</td>
	                            </tr>	                            	                               
	                            <tr>
	                                <th height="60px"></th>
	                                <td>
	                                
	                                  <button style="cursor: pointer;" class="btn btn-primary" onclick='addtreasure()' type="button"><ww:property value='#session.local.a00080' /></button>
	                                                                	      
	                                   <!--	                                   	                                   
	                                    &nbsp; &nbsp;
	                                     <input class="btn" onClick="history.back(-1)" value="返回" type="button">	                               		
	                               		 -->
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