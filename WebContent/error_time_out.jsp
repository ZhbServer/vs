<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:property value='#session.local.a00002' /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<link rel="stylesheet" type="text/css" href="../css/dandelion.css"  media="screen" />
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
<script type="text/javascript">
    /*启动获取浏览器高度自适应屏幕*/ 
    window.onload = function()
    {
        var h = document.body.clientHeight;
        document.getElementById("da-wrapper").style.height=(h-40)+"px";

        //判断是否返回登陆页面
        var creturn="<ww:property value='#session.creturn'  />";
        if(creturn=="login"){
        	window.parent.location.href="tologin.vs";

        }

           
    };
    
</script>
<script>
  
	
</script>
</head>







<body>




<div id="da-wrapper" class="fluid">
    
        <!-- Content -->
        <div id="da-content">
            
            <!-- Container -->
            <div class="da-container clearfix">
            
            	<div id="da-error-wrapper">
                	
                   	<div id="da-error-pin"></div>
                   	
                    <div id="da-error-code">
                    	 超时请重新登陆
						<br/><br/>
						<span style="font-size:30px;"><ww:property value="#session.error"  /></span>                    
				    </div>
                
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <div id="da-footer">
        	<div class="da-container clearfix">
          
        </div>
 </div>
    
    
</div>
</body>
</html>
