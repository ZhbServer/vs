<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html>
<head> 
<title><ww:property value="name"/></title>
<link rel="stylesheet" href="css/index.css"/>
<style type="text/css">
body,html {
	width: 100%;
	height: 99.5%;
	margin: 0px;
	padding: 0px;
	border: 0px;
	
	font-family: Microsoft YaHei;
	/*background-color:#134AFF;*/ /*overflow:hidden*/
}
</style>
</head>

<ww:if test="propor==0||propor==null">
	<img style="position:absolute; left:0px; top:0px;"  src="see/<ww:property value='filename'/>">
	<!--<div style="position:absolute; left:0px; top:0px; width:1920px; height:1080px; background-image: url(see/<ww:property value="filename"/>)"></div>-->
	
	<object  style='POSITION: absolute; z-index:100;left:<ww:property value="videox"/>px;top:<ww:property value="videoy"/>px;width:<ww:property value="videowidth"/>px;height:<ww:property value="videoheight"/>px' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0'><param name='movie' value='files/flvplayer.swf' /><param name='FlashVars' value='vcastr_file=<ww:property value="videocontent"/>&IsAutoPlay=1&IsShowBar=0'/> <param name='allowFullScreen' value='false' /><param name='quality' value='high'></object>  

</ww:if>
<ww:elseif test="propor==1">
	<script type="text/javascript">
         //获取浏览器高度,宽度
         var h;
         var w;
         window.onload = function()
         {
        	 h = document.documentElement.clientHeight;
        	 w = document.documentElement.clientWidth;
        	 var imgw="<ww:property value='imgw'/>";
        	 var imgh="<ww:property value='imgh'/>";
        	 
             var pro=0.9;
        	 //setImgPro(imgw,imgh,pro);
             document.getElementById("jshow").style.width = w + 'px';
        	 document.getElementById("jshow").style.height = h + 'px';
         };
         function setImgPro(imgw,imgh,pro){
             alert(imgw+"    "+imgh);
             alert(w+"   "+h);
        	 if(imgw>w||imgh>h){
        		 if(pro==0.1){
        			 document.getElementById("jshow").style.width = imgw + 'px';
                	 document.getElementById("jshow").style.height = imgh + 'px';
            	 }else{
            		 imgw=imgw*pro;
                     imgh=imgh*pro;
                     pro=pro-0.1;
                     setImgPro(imgw,imgh,pro);
                 }
             }else{
                 document.getElementById("jshow").style.width = imgw + 'px';
            	 document.getElementById("jshow").style.height = imgh + 'px';
             }
         }
    </script>
    <img style="position:absolute; left:0px; top:0px;" id="jshow"  src="see/<ww:property value='filename'/>">
</ww:elseif>
<ww:elseif test="propor==2">
    <script type="text/javascript">
         function reloadJk(){
        	 window.location.reload();
        	 //window.location.href=window.location.href+"?id="+10000*Math.random();    
         }
</script>
    
	<center>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<a href="javascript:reloadJk();">
	       <ww:property value="#session.local.a00694"/>
	</a>
	</center>
	    
	</ww:elseif>


</html> 