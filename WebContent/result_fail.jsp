<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:property value='#session.local.a00002' /></title>
<link rel="stylesheet" href="css/index.css" />
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
<script language="javascript">
	function closeDig(){
		var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	    window.parent.layer.close(index);
	}
</script>

<script>
	
	
</script>




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
	          <form action="#" method="post">
<!--	             <h3><ww:property value="#session.error"  /></h3>-->
	             <p><a href="#" onclick="closeDig()"> <ww:property value="#session.error"/></a></p>
	          </form>
          </div>
      </div>
</div>


</body>
</html>
