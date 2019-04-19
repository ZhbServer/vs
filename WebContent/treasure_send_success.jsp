<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:property value='#session.local.a00002' /></title>
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<style type="text/css">
body,html {
	width: 100%;
	height: 99.5%;
	margin: 0px;
	padding: 0px;
	border: 0px;
	
	font-family: Microsoft YaHei;
	/*background-color:#134AFF;*/ /*overflow:hidden*/
	
	#__01 {
		position:absolute;
		left:0px;
		top:0px;
		width:530px;
		height:340px;
    }
    
    #x672ax6807x9898-4-01-03 {
	position:absolute;
	left:218px;
	top:69px;
	width:92px;
	height:81px;
	margin: 10px 10px 0px 0px;
    }
    
    #x672ax6807x9898-4-01-06 {
	  position:absolute;
	  left:218px;
	  top:162px;
	  width:92px;
	  height:14px;
    }
    
    
    #x672ax6807x9898-4-01-09 {
	position:absolute;
	left:59px;
	top:217px;
	width:412px;
	height:8px;
    }
    
    #x672ax6807x9898-4-01-13 {
	position:absolute;
	left:238px;
	top:254px;
	width:54px;
	height:29px;
    }
}
</style>
<script type="text/javascript">
    /*启动获取浏览器高度自适应屏幕*/ 
    window.onload = function()
    {
        var h = document.body.clientHeight;
       
        document.getElementById("part_one").style.height=(h-40)+"px";   

        var openIntro = <%=request.getParameter("openIntro")%>;
    	
    	if(openIntro == '1'){
    		var intro = introJs();  
    		intro.setOptions({
            doneLabel:"<ww:property value='#session.local.a00863' />",
    		showStepNumbers: false,
    		showBullets: false,
    		exitOnOverlayClick: false,
    		overlayOpacity: 0.4,  
    		steps: [  	
    			{  
    				element: '#step1',  
    				intro: "<ww:property value='#session.local.a00931' />"
    			}
    		  ]  
    		});  

    		intro.start().oncomplete(function() {  
    			intro.exit();  
    	    });

    		intro.onexit(function() {
    			layer.msg("<ww:property value='#session.local.a00864' />");
    		});
    	}
    };

    function jump_a(url){
    	
    	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引			  	
	    window.parent.layer.close(index);
  
    }
</script>
</head>

<body>
<div id="part_one" class="part_one">
      
       <div class="title bottom">
		  <div class="t_container">
		      <div class="loc"></div>
		      <div class="plist2_right"></div>
		   </div>		
	   </div>
       <div class="content_container"  style="text-align: center;">
       
          <div class="content_mid_1" style="text-align: center;">
             <div id="__01">
	
	
					<div id="x672ax6807x9898-4-01-03" style="margin-top:30px;"> <!-- 成功logo-->
						<img src="images/success_logo.png" width="92" height="81" alt="">
					</div>
					
					
					<div id="x672ax6807x9898-4-01-06" style="margin-top:10px;"> <!--操作成功-->
						
						<ww:property value="#session.local.a00125"/>
					</div>
					
					
					<div id="x672ax6807x9898-4-01-09" style="margin-top:30px;"><!--进度条 -->
						<img src="images/success_bar.png" width="412" height="8" alt="">
					</div>
					
					
					
					<div id="x672ax6807x9898-4-01-13" style="margin-top:30px;"><!--返回按钮 -->
						 <button onclick="jump_a('<ww:property value="#session.url"  />')"      type="button" class="btn  btn-primary"><ww:property value='#session.local.a00014' /></button><!--返回 -->
					</div>

	           </div>
            </div>
       
       
       
       
	          <!--<div class="content_mid_1" style="text-align: center;">
		          <form action="#" method="post">
	<!--	             <h3><ww:property value="#session.error"  /></h3>-->
		  <!--            <p><a href="<ww:property value="#session.url"  />"> <ww:property value="#session.local.a00427"/></a></p>
		           </form>
	          </div> -->
      </div>
</div>


</body>
</html>
